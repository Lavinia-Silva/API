package br.com.restcontroller;

import java.net.URI;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.dao.SalaoDAO;
import br.com.model.Funcionario;
import br.com.model.Salao;

@CrossOrigin
@RestController
public class SalaoRestController {
	@Autowired
	private SalaoDAO daoSalao;

	@RequestMapping(value = "/salao", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Salao> criarSalao(@RequestBody Salao salao) {
		try {
			for (Funcionario funcionario : salao.getFuncionarios()) {
				funcionario.setSalao(salao);
			}
			daoSalao.inserir(salao);
			return ResponseEntity.created(URI.create("/salao/" + salao.getId())).body(salao);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Salao>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Salao>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/salao/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Salao buscar(@PathVariable Long id) {
		return daoSalao.buscar(id);
	}

	@RequestMapping(value = "/salao", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Salao> listar() {
		return daoSalao.listar();
	}

	@RequestMapping(value = "/salao/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable Long id) {
		daoSalao.excluir(id);
		return ResponseEntity.noContent().build();
	}

	@RequestMapping(value = "/salao/", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Salao> alterar(@RequestBody Salao salao) {
		try {			
			for (Funcionario funcionario : salao.getFuncionarios()) {
				funcionario.setSalao(salao);
			}
			daoSalao.alterar(salao);
			HttpHeaders header = new HttpHeaders();
			header.setLocation(URI.create("/salao/" + salao.getId()));
			return new ResponseEntity<Salao>(salao, header, HttpStatus.OK);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Salao>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Salao>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/salaoCNPJ", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Salao buscarSalao(@RequestBody Salao salao) {
		System.out.println("Sala CNPJ" + salao.toString());
		return daoSalao.buscarCnpj(salao);
	}
}
