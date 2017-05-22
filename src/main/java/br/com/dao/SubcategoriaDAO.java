package br.com.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Categoria;
import br.com.model.Subcategoria;

@Repository
public class SubcategoriaDAO {
	@PersistenceContext
	private EntityManager manager;

	@Transactional
	public void inserir(Long id, Subcategoria subcategoria) {
		Categoria categoria = new Categoria();
		categoria.setId(id);
		subcategoria.setCategoria(categoria);
		manager.persist(subcategoria);
	}

	public Subcategoria buscar(Long id) {
		return manager.find(Subcategoria.class, id);
	}

	@Transactional
	public void alterar(Subcategoria subcategoria) {
		manager.merge(subcategoria);
	}

	@Transactional
	public void excluir(Long id) {
		Subcategoria subcategoria = buscar(id);
		Categoria categoria = subcategoria.getCategoria();
		categoria.getSubcategorias().remove(subcategoria);
		manager.merge(categoria);
	}
}
