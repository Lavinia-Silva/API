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

import br.com.dao.AdministradorDAO;
import br.com.model.Administrador;
import br.com.model.TokenJWT;
@CrossOrigin
@RestController
public class LoginADMRestController {
	@Autowired
	private AdministradorDAO daoAdministrador;
	
	public static final String EMISSOR="COSMETICA";
	public static final String SECRET = "ÈoQ";
	
	@RequestMapping(value = "/loginADM", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TokenJWT> logar(@RequestBody Administrador administrador) {
		administrador = daoAdministrador.logar(administrador);
		if (administrador != null) {
			HashMap<String, Object> claims = new HashMap<String, Object>();
			claims.put("iss", EMISSOR);
			claims.put("nome_usuario", administrador.getEmail());
			// hora atual em segundos
			long horaAtual = System.currentTimeMillis()/1000;
			// expiração do token (3600 segundos)
			long horaExpiracao = horaAtual + 3600;
			claims.put("iat", horaAtual);
			claims.put("exp", horaExpiracao);
			JWTSigner signer = new JWTSigner(SECRET);
			TokenJWT tokenJwt = new TokenJWT();
			tokenJwt.setToken(signer.sign(claims));
			return ResponseEntity.ok(tokenJwt);
		} else {
			return new ResponseEntity<TokenJWT>(HttpStatus.UNAUTHORIZED);
		}
	}
}
