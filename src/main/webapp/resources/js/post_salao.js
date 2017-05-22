var arrayFuncs = [];
var funcionario;
var object = null;
var url = window.location.host;

function adcionar(id) {

	if (id == '') {
		arrayFuncs.push(funcionario = {
			nome : $("#nome").val(),
			email : $("#email").val(),
			rg : $("#rg").val(),
			cpf : $("#cpf").val(),
			senha : $("#senha").val(),
			genero : $("input[name='genero']:checked").val(),
			tipoFuncionario : $("input[name='proprietario']:checked").val()
		})
		desenhar(arrayFuncs.length - 1);
	} else {
		arrayFuncs[id].nome = $("#nome").val();
		arrayFuncs[id].email = $("#email").val();
		arrayFuncs[id].rg = $("#rg").val();
		arrayFuncs[id].cpf = $("#cpf").val();
		arrayFuncs[id].genero = $("input[name='genero']:checked").val();
		arrayFuncs[id].tipoFuncionario = $("input[name='proprietario']:checked")
				.val();

		limparModal();
		desenharNovo();
		for (var i = 0; i < arrayFuncs.length; i++) {
			desenhar(i);
		}
		$("button[name='func_button']").attr("id", '');
		$("button[name='func_button']").html("SALVAR");
		document.getElementById("senha").disabled = false;
	}

};

function desenhar(id) {
	$("tbody")
			.append(
					"<tr><td>"
							+ arrayFuncs[id].nome
							+ "</td><td>"
							+ arrayFuncs[id].email
							+ "</td><td>"
							+ arrayFuncs[id].rg
							+ "</td><td><a id="
							+ id
							+ " onclick='editar(id)' data-toggle='modal' data-target='#myModal'>O</a></td></tr>");
}

function desenharNovo() {
	$("tbody").empty();
}

function editar(id) {
	document.getElementById("senha").disabled = true;

	$("#nome").val(arrayFuncs[id].nome);
	$("#email").val(arrayFuncs[id].email);
	$("#rg").val(arrayFuncs[id].rg);
	$("#cpf").val(arrayFuncs[id].cpf);
	$("#senha").val(arrayFuncs[id].senha)

	if (arrayFuncs[id].tipoFuncionario == true) {
		$("input[id='sim']").prop("checked", true);
	} else {
		$("input[id='nao']").prop("checked", true);
	}
	if (arrayFuncs[id].genero == true) {
		$("input[id='masculino']").prop("checked", true);
	} else {
		$("input[id='feminino']").prop("checked", true);
	}

	$("button[name='func_button']").attr("id", id);
	$("button[name='func_button']").html("EDITAR");
}

String.prototype.replaceAll = String.prototype.replaceAll
		|| function(needle, replacement) {
			return this.split(needle).join(replacement);
		};

function enviar() {
	var dados = {
		nomeFantasia : $("#nomeFantasia").val(),
		razaoSocial : $("#razaoSocial").val(),
		cnpj : $("#cnpj").val().replaceAll(".", "").replace("/", "").replace(
				"-", ""),
		telefone : $("#telefone").val(),
		endereco : {
			cep : $("#cep").val(),
			uf : $("#uf").val(),
			cidade : $("#cidade").val(),
			bairro : $("#bairro").val(),
			logradouro : $("#logradouro").val(),
			numero : $("#numero").val(),
			complemento : $("#complemento").val(),
		},
		funcionarios : arrayFuncs
	}

	if (object != null) {
		dados.id = object.id;
		dados.endereco.id = object.endereco.id;
	}

	var jsonText = JSON.stringify(dados);

	// Salva os dados...
	if (object == null) {
		$.ajax({
			url : "http://" + url.toString() + "/API/salao",
			method : "POST",
			data : jsonText,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function() {
				$("#div_sucesso").css("display", "block");
				limparCampos();
			},
			error : function() {
				alert('failure');
			}
		});
	} else {
		console.log("vai fazer o put!");
		$.ajax({
			url : "http://" + url.toString() + "/API/salao/",
			method : "PUT",
			data : jsonText,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function() {
				$("#div_sucesso").css("display", "block");
				limparCampos();
			},
			error : function() {
				alert('tente novamento mais tarde');
			}
		});
	}

};

function limparCampos() {
	$("#nomeFantasia").val("");
	$("#razaoSocial").val("");
	$("#cnpj").val("");
	$("#telefone").val("");
	$("#logradouro").val("");
	$("#cep").val("");
	$("#complemento").val("");
	$("#cidade").val("");
	$("#bairro").val("");
	$("#numero").val("");
	$("#uf").val("");
	limparModal();
	$("tbody").empty();
	arrayFuncs = [];
	funcionario = null;
	object = null;
}

function limparModal() {
	$("#nome").val("");
	$("#email").val("");
	$("#rg").val("");
	$("#cpf").val("");
	$("#senha").val("");
}