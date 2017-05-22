package br.com.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties("salao")
@Entity
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = { "cpf", "email" }) })
public class Funcionario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(nullable = false)
	private String nome;
	@Column(nullable = false)
	private String email;
	@Column(nullable = false)
	private boolean tipoFuncionario;
	@Column(nullable = false)
	private String rg;
	@Column(unique = true, nullable = false)
	private String cpf;
	@Column(nullable = false)
	private String senha;
	@Column(nullable = false)
	private boolean genero;
	@ManyToOne(optional = false)
	private Salao salao;
	@OneToMany(mappedBy = "funcionario", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
	private List<Pedido> pedidos;
	@Column(nullable = false)
	private boolean status = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isTipoFuncionario() {
		return tipoFuncionario;
	}

	public void setTipoFuncionario(boolean tipoFuncionario) {
		this.tipoFuncionario = tipoFuncionario;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		if (id != null && senha.length() == 32) {
			this.senha = senha;
		} else {
			Md5PasswordEncoder encoder = new Md5PasswordEncoder();
			String md5 = encoder.encodePassword(senha, null);
			this.senha = md5;
		}
	}

	public boolean isGenero() {
		return genero;
	}

	public void setGenero(boolean genero) {
		this.genero = genero;
	}

	public Salao getSalao() {
		return salao;
	}

	public void setSalao(Salao salao) {
		this.salao = salao;
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Funcionario [id=" + id + ", nome=" + nome + ", email=" + email + ", tipoFuncionario=" + tipoFuncionario
				+ ", rg=" + rg + ", cpf=" + cpf + ", senha=" + senha + ", genero=" + genero + ", salao=" + salao
				+ ", pedidos=" + pedidos + ", status=" + status + "]";
	}

}
