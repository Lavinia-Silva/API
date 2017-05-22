package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Endereco;

@Repository
public class EnderecoDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public List<Endereco> listar() {
		TypedQuery<Endereco> query = manager.createQuery("SELECT e FROM Endereco e ", Endereco.class);
		return query.getResultList();
	}

	public Endereco buscar(Long id) {
		return manager.find(Endereco.class, id);
	}

	@Transactional
	public void inserir(Endereco endereco) {
		manager.persist(endereco);
	}

	@Transactional
	public void alterar(Endereco endereco) {
		manager.merge(endereco);
	}

	@Transactional
	public void excluir(Long id) {
		Endereco endereco = buscar(id);
		manager.remove(endereco);
	}
}
