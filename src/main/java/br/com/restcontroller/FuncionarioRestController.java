package br.com.restcontroller;

import java.net.URI;

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

import br.com.dao.FuncionarioDAO;
import br.com.model.Funcionario;

@CrossOrigin
@RestController
public class FuncionarioRestController {
	@Autowired
	private FuncionarioDAO daoFuncionario;

	@RequestMapping(value = "/salao/{id}/funcionario", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Funcionario> criarFuncionario(@PathVariable Long id, @RequestBody Funcionario funcionario) {
		try {
			daoFuncionario.inserir(id, funcionario);
			return ResponseEntity.created(URI.create("/funcionario/" + funcionario.getId())).body(funcionario);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Funcionario>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Funcionario>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/funcionario/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Funcionario buscar(@PathVariable long id) {
		return daoFuncionario.buscar(id);
	}

	@RequestMapping(value = "/salao/{id}/funcionario", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Funcionario> alterar(@PathVariable Long id, @RequestBody Funcionario funcionario) {
		try {
			daoFuncionario.alterar(funcionario, id);
			HttpHeaders header = new HttpHeaders();
			header.setLocation(URI.create("/funcionario/" + funcionario.getId()));
			return new ResponseEntity<Funcionario>(funcionario, header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Funcionario>(funcionario, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/funcionario/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable long id) {
		daoFuncionario.excluir(id);
		return ResponseEntity.noContent().build();
	}
}
