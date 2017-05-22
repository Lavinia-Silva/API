package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Funcionario;
import br.com.model.Pedido;

@Repository
public class PedidoDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public List<Pedido> listar() {
		TypedQuery<Pedido> query = manager.createQuery("SELECT p FROM Pedido p ", Pedido.class);
		return query.getResultList();
	}

	public Pedido buscar(Long id) {
		return manager.find(Pedido.class, id);
	}

	@Transactional
	public void inserir(Long id,Pedido pedido) {
		Funcionario funcionario = new Funcionario();
		funcionario.setId(id);
		pedido.setFuncionario(funcionario);
		manager.persist(pedido);
	}

	@Transactional
	public void alterar(Pedido pedido) {
		manager.merge(pedido);
	}

	@Transactional
	public void excluir(Long id) {
		Pedido pedido = buscar(id);
		manager.remove(pedido);
	}
}
