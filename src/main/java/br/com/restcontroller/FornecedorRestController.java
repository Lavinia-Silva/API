package br.com.restcontroller;

import java.net.URI;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.dao.FornecedorDAO;
import br.com.model.Fornecedor;
@CrossOrigin
@RestController
public class FornecedorRestController {
	@Autowired
	private FornecedorDAO daoFornecedor;

	@RequestMapping(value = "/fornecedor", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Fornecedor> criarFornecedor(@RequestBody Fornecedor fornecedor) {
		try {
			daoFornecedor.inserir(fornecedor);
			return ResponseEntity.created(URI.create("/fornecedor/" + fornecedor.getId())).body(fornecedor);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Fornecedor>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Fornecedor>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/fornecedor/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Fornecedor buscar(@PathVariable Long id) {
		return daoFornecedor.buscar(id);
	}

	@RequestMapping(value = "/fornecedor", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Fornecedor> listar() {		
		return daoFornecedor.listar();
	}

	@RequestMapping(value = "/fornecedor/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable Long id) {
		daoFornecedor.excluir(id);
		return ResponseEntity.noContent().build();
	}
	
	@RequestMapping(value = "/fornecedor/", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@RequestBody Fornecedor fornecedor) {
		try {
			daoFornecedor.alterar(fornecedor);
			return null;	
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
