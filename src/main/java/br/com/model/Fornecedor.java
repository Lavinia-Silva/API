package br.com.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Fornecedor extends Empresa {
	@PrimaryKeyJoinColumn(name = "id")
	@Column(nullable = false)
	private String foto;
	@JsonIgnore
	@OneToMany(mappedBy = "fornecedor", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Produto> produtos;

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}
}
