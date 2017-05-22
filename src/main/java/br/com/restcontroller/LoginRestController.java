package br.com.restcontroller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.auth0.jwt.JWTSigner;

import br.com.dao.FuncionarioDAO;
import br.com.model.Funcionario;
import br.com.model.TokenJWT;
@CrossOrigin
@RestController
public class LoginRestController {
	@Autowired
	private FuncionarioDAO daoFuncionario;
	
	public static final String EMISSOR="COSMETICA";
	public static final String SECRET = "EoQ";
	
	@RequestMapping(value = "/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TokenJWT> logarFuncionario(@RequestBody Funcionario funcionario) {
		System.out.println(funcionario.toString());
		funcionario = daoFuncionario.login(funcionario);
		if (funcionario != null) {
			System.out.println(funcionario.getCpf());
			HashMap<String, Object> claims = new HashMap<String, Object>();
			claims.put("iss", EMISSOR);
			claims.put("funcionario", funcionario.getId());
			JWTSigner signer = new JWTSigner(SECRET);
			TokenJWT tokenJwt = new TokenJWT();
			tokenJwt.setFuncionario(funcionario);
			long horaAtual = System.currentTimeMillis()/1000;
			long horaExpiracao = horaAtual + 3600;
			claims.put("iat", horaAtual);
			claims.put("exp", horaExpiracao);
			
			tokenJwt.setToken(signer.sign(claims));
			return ResponseEntity.ok(tokenJwt);
		} else {
			return new ResponseEntity<TokenJWT>(HttpStatus.UNAUTHORIZED);
		}
	}
}
