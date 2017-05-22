package br.com.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.dao.AdministradorDAO;
import br.com.model.Administrador;

@Controller
public class LinksController {
	private AdministradorDAO bdAdmin;

	@Autowired
	public LinksController(AdministradorDAO bdAdmin) {
		this.bdAdmin = bdAdmin;
	}

	@RequestMapping("login_adm")
	public String logar(Administrador administrador, Model model) {
		if (bdAdmin.logar(administrador) != null) {
			return "inicio";
		} else {
			return "redirect:index.jsp";
		}
	}

	@RequestMapping("sair")
	public String sair(Administrador administrador, Model model) {
		return "redirect:index.jsp";
	}

	@RequestMapping("inicio")
	public String inicio(Administrador administrador, Model model) {
		return "inicio";
	}

	@RequestMapping("cadastro_categorias")
	public String categoria(Administrador administrador, Model model) {
		return "cadastro_categorias";
	}

	@RequestMapping("cadastro_salao")
	public String salao(Administrador administrador, Model model, Long id_salao) {
		model.addAttribute("id_marca", id_salao);
		if (id_salao != null) {
			model.addAttribute("loadSalao", "loadSalao();");
		}
		return "cadastro_salao";
	}

	@RequestMapping("cadastro_funcionario")
	public String funcionario(Administrador administrador, Model model, Long id_func, Long id_salao) {
		if (id_func != null) {
			Map<String, Long> params = new HashMap<String, Long>();
			params.put("id_salao", id_salao);
			params.put("id_func", id_func);
			model.addAttribute("ids", params);
			return "cadastro_funcionario";
		} else {
			model.addAttribute("id_salao", id_salao);
			return "cadastro_funcionario_novo";
		}

	}

	@RequestMapping("cadastro_publicidade")
	public String publicidade(Administrador administrador, Model model) {
		return "cadastro_publicidade";
	}

	@RequestMapping("cadastro_produtos")
	public String produto(Administrador administrador, Model model) {
		return "cadastro_produtos";
	}

	@RequestMapping("cadastro_marcas")
	public String marcas(Administrador administrador, Model model, Long id_marca) {
		if (id_marca != null) {
			model.addAttribute("id_marca", id_marca);
			model.addAttribute("loadMarca", "loadMarca();");
			return "cadastro_marcas";
		} else {
			model.addAttribute("storageClear", "sessionStorage.clear();");
			return "cadastro_marcas";
		}
	}

	@RequestMapping("lista_salao")
	public String listagemSalao(Administrador administrador, Model model) {
		return "lista_salao";
	}

	@RequestMapping("lista_produtos")
	public String listagemProduto(Administrador administrador, Model model) {
		return "lista_produtos";
	}

	@RequestMapping("lista_marcas")
	public String listagemMarcas(Administrador administrador, Model model) {
		return "lista_marcas";
	}

	@RequestMapping("lista_categorias")
	public String listagemCategoria(Administrador administrador, Model model) {
		return "lista_categorias";
	}

	@RequestMapping("historico_vendas")
	public String historicoVendas(Administrador administrador, Model model) {
		return "historico_vendas";
	}

}
