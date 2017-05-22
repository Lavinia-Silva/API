package br.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.model.Pagamento;

@Repository
public class PagamentoDAO {
	@PersistenceContext
	private EntityManager manager;
	
	public List<Pagamento> listar() {
		TypedQuery<Pagamento> query = manager.createQuery("SELECT f FROM Pagamento f ", Pagamento.class);
		return query.getResultList();
	}

	public Pagamento buscar(Long id) {
		return manager.find(Pagamento.class, id);
	}

	@Transactional
	public void inserir(Pagamento pagamento) {
		manager.persist(pagamento);
	}

	@Transactional
	public void alterar(Pagamento pagamento) {
		manager.merge(pagamento);
	}

	@Transactional
	public void excluir(Long id) {
		Pagamento pagamento = buscar(id);
		manager.remove(pagamento);
	}
}
