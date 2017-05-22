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

import br.com.dao.ProdutoDAO;
import br.com.model.Imagem;
import br.com.model.Produto;

@CrossOrigin
@RestController
public class ProdutoRestController {
	@Autowired
	private ProdutoDAO daoProduto;

	@RequestMapping(value = "/produto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Produto> criarProduto(@RequestBody Produto produto) {
		System.out.println(produto.toString());
		try {
			for (Imagem imagem : produto.getImagens()) {
				imagem.setProduto(produto);
			}
			daoProduto.inserir(produto);
			return ResponseEntity.created(URI.create("/produto/" + produto.getId())).body(produto);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Produto>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Produto>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/produto/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Produto buscar(@PathVariable Long id) {
		return daoProduto.buscar(id);
	}

	@RequestMapping(value = "/produtolist", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listar(@RequestBody Produto produto) {
		return daoProduto.listar(produto);
	}

	@RequestMapping(value = "/produto", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listar() {
		return daoProduto.listar();
	}

	@RequestMapping(value = "/produto/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable Long id) {
		daoProduto.excluir(id);
		return ResponseEntity.noContent().build();
	}

	@RequestMapping(value = "/produto/", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@RequestBody Produto produto) {
		try {
			daoProduto.alterar(produto);
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
