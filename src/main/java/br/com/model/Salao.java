package br.com.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Salao extends Empresa {
	@PrimaryKeyJoinColumn(name = "id")
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "salao", cascade = CascadeType.ALL)
	private List<Funcionario> funcionarios;

	public List<Funcionario> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}

	@Override
	public String toString() {
		return "Cnpj=" + getCnpj();
	}

}
