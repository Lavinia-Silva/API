package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Produto;

@Repository
public class ProdutoDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public List<Produto> listar() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p ", Produto.class);
		return query.getResultList();
	}
	
	public List<Produto> listar(Produto produto) {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p where p.subcategoria.id =:id", Produto.class);		
		query.setParameter("id", produto.getSubcategoria().getId());
		return query.getResultList();
	}

	public Produto buscar(Long id) {
		return manager.find(Produto.class, id);
	}

	@Transactional
	public void inserir(Produto produto) {
		manager.persist(produto);
	}

	@Transactional
	public void alterar(Produto produto) {
		manager.merge(produto);
	}

	@Transactional
	public void excluir(Long id) {
		Produto produto= buscar(id);
		manager.remove(produto);
	}
}
