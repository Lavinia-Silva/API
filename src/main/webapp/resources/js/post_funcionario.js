var url = window.location.host;

function enviar(id_salao) {
	var dados = {
		nome : $("#nome").val(),
		email : $("#email").val(),
		rg : $("#rg").val(),
		cpf : $("#cpf").val(),
		senha : $("#senha").val(),
		genero : $("#genero:checked").val(),
		tipoFuncionario : $("#proprietario:checked").val()
	};

	var jsonText = JSON.stringify(dados);
	$.ajax({
		url : "http://" + url.toString() + "/API/salao/" + id_salao
				+ "/funcionario",
		method : "PUT",
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
}

function limparCampos() {
	$("#nome").val("");
	$("#email").val("");
	$("#rg").val("");
	$("#cpf").val("");
	$("#senha").val("");
}