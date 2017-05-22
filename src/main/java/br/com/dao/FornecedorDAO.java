package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Fornecedor;

@Repository
public class FornecedorDAO {
	@PersistenceContext
	private EntityManager manager;

	public List<Fornecedor> listar() {
		TypedQuery<Fornecedor> query = manager.createQuery("SELECT f FROM Fornecedor f ", Fornecedor.class);
		return query.getResultList();
	}

	public Fornecedor buscar(Long id) {
		return manager.find(Fornecedor.class, id);
	}

	@Transactional
	public void inserir(Fornecedor fornecedor) {
		manager.persist(fornecedor);
	}

	@Transactional
	public void alterar(Fornecedor fornecedor) {
		manager.merge(fornecedor);
	}

	@Transactional
	public void excluir(Long id) {
		Fornecedor fornecedor = buscar(id);
		if (fornecedor.isStatus() == true) {
			fornecedor.setStatus(false);
		} else if(fornecedor.isStatus() == false){
			fornecedor.setStatus(true);
		}
		manager.merge(fornecedor);
	}

	public Fornecedor verificaCnpj(Fornecedor fornecedor) {
		Query query = manager.createQuery("SELECT f from Fornecedor f WHERE f.cnpj = :cnpj");
		query.setParameter("cnpj", fornecedor.getCnpj());
		try {
			return (Fornecedor) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
