package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Categoria;
import br.com.model.Fornecedor;

@Repository
public class CategoriaDAO {
	@PersistenceContext
	private EntityManager manager;

	@Transactional
	public void inserir(Categoria categoria) {
		manager.persist(categoria);
	}

	public Categoria buscar(Long id) {
		return manager.find(Categoria.class, id);
	}
	
	public List<Categoria> listar(Fornecedor fornecedor) {
		TypedQuery<Categoria> query = manager.createQuery(""
				+ "select p.subcategoria.categoria from Produto p where p.fornecedor.id = :id", Categoria.class);
		query.setParameter("id",fornecedor.getId());
		return query.getResultList();
	}

	public List<Categoria> listar() {
		TypedQuery<Categoria> query = manager.createQuery("select c from Categoria c", Categoria.class);
		return query.getResultList();
	}

	@Transactional
	public void alterar(Categoria categoria) {
		manager.merge(categoria);
	}
	
	@Transactional
	public void excluir(Long id) {
		Categoria categoria = buscar(id);
		manager.remove(categoria);
	}
	
}
