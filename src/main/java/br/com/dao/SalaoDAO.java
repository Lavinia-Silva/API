package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Salao;

@Repository
public class SalaoDAO {
	@PersistenceContext
	private EntityManager manager;

	public List<Salao> listar() {
		TypedQuery<Salao> query = manager.createQuery("SELECT s FROM Salao s ", Salao.class);
		return query.getResultList();
	}

	public Salao buscar(Long id) {
		return manager.find(Salao.class, id);
	}

	@Transactional
	public void inserir(Salao salao) {
		manager.persist(salao);
	}

	@Transactional
	public void alterar(Salao salao) {
		manager.merge(salao);
	}

	@Transactional
	public void excluir(Long id) {
		Salao salao = buscar(id);
		if (salao.isStatus() == true) {
			salao.setStatus(false);
		} else if (salao.isStatus() == false) {
			salao.setStatus(true);
		}
		manager.merge(salao);
	}

	public Salao buscarSalao(String cnpj) {
		return manager.find(Salao.class, cnpj);
	}

	public Salao buscarCnpj(Salao salao) {
		Query query = manager.createQuery("SELECT s from Salao s WHERE s.cnpj = :cnpj and s.status = true");
		query.setParameter("cnpj", salao.getCnpj());
		try {
			return (Salao) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Salao verificaCnpj(Salao salao) {
		Query query = manager.createQuery("SELECT s from Salao s WHERE s.cnpj = :cnpj");
		query.setParameter("cnpj", salao.getCnpj());
		try {
			return (Salao) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
