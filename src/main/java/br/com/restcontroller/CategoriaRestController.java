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

import br.com.dao.CategoriaDAO;
import br.com.model.Categoria;
import br.com.model.Fornecedor;
import br.com.model.Subcategoria;

@CrossOrigin
@RestController
public class CategoriaRestController {
	@Autowired
	private CategoriaDAO daoCategoria;

	@RequestMapping(value = "/categoria", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Categoria> criarCategoria(@RequestBody Categoria categoria) {
		try {
			for (Subcategoria subcategoria : categoria.getSubcategorias()) {
				subcategoria.setCategoria(categoria);
			}
			daoCategoria.inserir(categoria);
			return ResponseEntity.created(URI.create("/categoria/" + categoria.getId())).body(categoria);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Categoria>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Categoria>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/categoria/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Categoria buscar(@PathVariable Long id) {
		return daoCategoria.buscar(id);
	}

	@RequestMapping(value = "/categoriaList", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Categoria> listarCategoria(@RequestBody Fornecedor fornecedor) {
		System.out.println(fornecedor.toString());
		return daoCategoria.listar(fornecedor);
	}

	@RequestMapping(value = "/categoria", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Categoria> listar() {
		return daoCategoria.listar();
	}

	@RequestMapping(value = "/categoria/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable Long id) {
		daoCategoria.excluir(id);
		return ResponseEntity.noContent().build();
	}

	@RequestMapping(value = "/categoria", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@RequestBody Categoria categoria) {
		try {
			daoCategoria.alterar(categoria);
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
