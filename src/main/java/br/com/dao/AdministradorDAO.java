package br.com.dao;

import org.springframework.stereotype.Repository;

import br.com.model.Administrador;

@Repository
public class AdministradorDAO {

	public Administrador logar(Administrador administrador) {
		if (administrador.getEmail().equals("admin@admin.com") && administrador.getSenha().equals("admin")) {
			return administrador;
		} else {
			return null;
		}
	}
}
