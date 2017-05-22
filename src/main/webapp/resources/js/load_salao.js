var salao;
var url = window.location.host;
function loadSalao() {
	// Carrega as informações de categoria...
	$
			.getJSON(
					"http://" + url.toString() + "/API/salao",
					{
						get_param : "value"
					},
					function(data) {
						salao = data;
						console.log(salao);
						for (var i = 0; i < salao.length; i++) {
							$("#ul_saloes")
									.append(
											"<tr><td><a href='#' onclick='verSalao(name, id)' id="
													+ i
													+ " name="
													+ salao[i].id
													+ " class='salao' data-toggle='modal' data-target='#myModal1' style='color: black;'>"
													+ salao[i].nomeFantasia
													+ "</a></td><td> <a href='#' onclick='verFunc(name, id)' id="
													+ i
													+ " name="
													+ salao[i].id
													+ " class='funcionario' data-toggle='modal' data-target='#myModal2'style='color: black;'>Funcionarios</a></td></tr>");
						}
					});
};
loadSalao();

function limparFunc() {
	$("#ul_funcs").empty();
}

function verFunc(id_salao, id) {
	limparFunc();
	var arrayFuncs = salao[id].funcionarios;
	for (var i = 0; i < arrayFuncs.length; i++) {
		$("#ul_funcs")
				.append(
						"<tr><td><a href='#' onclick='popover()' id="
								+ arrayFuncs[i].id
								+ " class='funcionario' style='color: black; margin-left:10%;margin-top 2%;' data-toggle='popover' title='Informações do Cliente' data-placement='bottom' data-content='RG: "
								+ arrayFuncs[i].rg
								+ " \nE-mail: "
								+ arrayFuncs[i].email
								+ "'>"
								+ arrayFuncs[i].nome
								+ "</a></td><td><a id="
								+ arrayFuncs[i].id
								+ " name="
								+ id_salao
								+ " class='editar' onclick='editar(id, name)' style='color: red; font-weight: bold'>Alterar</a></td></tr>");
	}
	$("#ul_funcs").append(
			"<li><a href='cadastro_funcionario?id_salao=" + id_salao + "' id= "
					+ id_salao + " style='color: rgb(208, 108, 154); font-weight: bold; margin-left: 71%; font-size: 17px;'>Adicionar Novo Funcionario</a></li>");
}

function verSalao(id_salao, id) {
	$("#nomeFantasia").val(salao[id].nomeFantasia);
	$("#razaoSocial").val(salao[id].razaoSocial);
	$("#cnpj").val(salao[id].cnpj);
	$("#telefone").val(salao[id].telefone);
	$("#cep").val(salao[id].endereco.cep);
	$("#logradouro").val(salao[id].endereco.logradouro);
	$("#numero").val(salao[id].endereco.numero);
	$("#cidade").val(salao[id].endereco.cidade);
	$("#bairro").val(salao[id].endereco.bairro);
	$("#uf").val(salao[id].endereco.uf);
	$("#complemento").val(salao[id].endereco.complemento);
	$("#salao a").attr("id", id_salao);
}

function popover() {
	$('[data-toggle="popover"]').popover();
}

function editar(id_func, id_salao) {
	decisao = confirm("Deseja modificar esse cliente?");
	if (decisao) {
		window.location.href = "cadastro_funcionario?id_func=" + id_func
				+ "&id_salao=" + id_salao;
	} else {
		alert("Você pode editar quando quiser");
	}
}

function editarSalao(id) {
	window.location.href = "cadastro_salao?id_salao=" + id;
}

function novoFunc(id) {
	window.location.href = "cadastro_funcionario?id_salao=" + id;
}