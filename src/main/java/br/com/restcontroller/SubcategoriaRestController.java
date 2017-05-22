package br.com.restcontroller;

import java.net.URI;

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

import br.com.dao.SubcategoriaDAO;
import br.com.model.Subcategoria;
@CrossOrigin
@RestController
public class SubcategoriaRestController {
	@Autowired
	private SubcategoriaDAO daoSub;

	@RequestMapping(value = "/categoria/{id}/subcategoria", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Subcategoria> criarSubcategoria(@PathVariable Long id,
			@RequestBody Subcategoria subcategoria) {
		try {
			daoSub.inserir(id, subcategoria);
			return ResponseEntity.created(URI.create("/subcategoria/" + subcategoria.getId())).body(subcategoria);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Subcategoria>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Subcategoria>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/subcategoria/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Subcategoria buscar(@PathVariable long id) {
		return daoSub.buscar(id);
	}

	@RequestMapping(value = "/subcategoria", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@RequestBody Subcategoria subcategoria) {
		try {
			daoSub.alterar(subcategoria);
			return null;	
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/subcategoria/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluirSub(@PathVariable long id) {
		daoSub.excluir(id);
		return ResponseEntity.noContent().build();
	}
}
