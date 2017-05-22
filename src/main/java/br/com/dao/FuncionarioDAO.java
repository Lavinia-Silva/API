package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Funcionario;
import br.com.model.Salao;

@Repository
public class FuncionarioDAO {
	@PersistenceContext
	private EntityManager manager;

	public List<Funcionario> listar() {
		TypedQuery<Funcionario> query = manager.createQuery("SELECT f FROM Funcionario f ", Funcionario.class);
		return query.getResultList();
	}

	public Funcionario buscar(Long id) {
		return manager.find(Funcionario.class, id);
	}

	@Transactional
	public void inserir(Long idSalao, Funcionario funcionario) {
		Salao salao = new Salao();
		salao.setId(idSalao);
		funcionario.setSalao(salao);
		manager.persist(funcionario);
	}

	@Transactional
	public void alterar(Funcionario funcionario, Long idSalao) {
		Salao salao = new Salao();
		salao.setId(idSalao);
		funcionario.setSalao(salao);
		manager.merge(funcionario);
	}

	@Transactional
	public void excluir(Long id) {
		Funcionario funcionario = buscar(id);
		Salao salao = funcionario.getSalao();
		salao.getFuncionarios().remove(funcionario);
		manager.merge(salao);
		manager.remove(funcionario);
	}
	
	public Funcionario login(Funcionario funcionario) {
		Query query = manager.createQuery("SELECT f from Funcionario f WHERE f.senha = :senha and f.email = :email");
		query.setParameter("senha", funcionario.getSenha());
		query.setParameter("email", funcionario.getEmail());
		try {
			return (Funcionario) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
