package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Item;
import br.com.model.Pedido;

@Repository
public class ItemDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public List<Item> listar() {
		TypedQuery<Item> query = manager.createQuery("SELECT i FROM Item i ", Item.class);
		return query.getResultList();
	}

	public Item buscar(Long id) {
		return manager.find(Item.class, id);
	}

	@Transactional
	public void inserir(Item item) {
		manager.persist(item);
	}

	@Transactional
	public void alterar(Item item) {
		manager.merge(item);
	}
	
	@Transactional
	public void excluir(Long id) {
		Item item = buscar(id);
		Pedido pedido = item.getPedido();
		pedido.getItens().remove(item);
		manager.merge(pedido);
	}
}
