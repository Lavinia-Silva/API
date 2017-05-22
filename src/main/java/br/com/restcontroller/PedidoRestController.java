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

import br.com.dao.PedidoDAO;
import br.com.model.Pedido;
@CrossOrigin
@RestController
public class PedidoRestController {
	@Autowired
	private PedidoDAO daoPedido;

	@RequestMapping(value = "funcionario/{id}/pedido", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Pedido> criarPedido(@PathVariable Long id,@RequestBody Pedido pedido) {
		try {
			daoPedido.inserir(id,pedido);
			return ResponseEntity.created(URI.create("/pedido/" + pedido.getId())).body(pedido);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Pedido>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Pedido>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/pedido/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Pedido buscar(@PathVariable Long id) {
		return daoPedido.buscar(id);
	}

	@RequestMapping(value = "/pedido", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Pedido> listar() {
		return daoPedido.listar();
	}

	@RequestMapping(value = "/pedido/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable Long id) {
		daoPedido.excluir(id);
		return ResponseEntity.noContent().build();
	}

	@RequestMapping(value = "/pedido/", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@RequestBody Pedido pedido) {
		try {
			daoPedido.alterar(pedido);
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
