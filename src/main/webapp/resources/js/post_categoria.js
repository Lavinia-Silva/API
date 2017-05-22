var arraySubcategoria = [];
var subcategoria;
var id;
var url = window.location.host;

function adcionar(id) {
	if (id == "") {
		arraySubcategoria.push(subcategoria = {
			nomeSubcategoria : $("#subcategoria").val()
		})
		desenhar(arraySubcategoria.length - 1);
		console.log(url.toString());
	} else {
		subcategoria = {
			nomeSubcategoria : $("#subcategoria").val()
		}
		arraySubcategoria.splice(id, 1, subcategoria);
		$(".input-group-btn button").attr("id", "");
		$(".input-group-btn button").html("ADICIONAR");
		desenharNovo();
		for (var i = 0; i < arraySubcategoria.length; i++) {
			desenhar(i);
		}
	}

};

function editar(id) {
	var nome = arraySubcategoria[id].nomeSubcategoria

	$("#subcategoria").val(nome);
	$(".input-group-btn button").attr("id", id);
	$(".input-group-btn button").html("EDITAR");

}

function excluir(id) {
	arraySubcategoria.splice(id, 1);

	id = arraySubcategoria.length - 1;

	desenharNovo();

	for (var i = 0; i < arraySubcategoria.length; i++) {
		desenhar(i);
	}
}

function desenhar(id) {
	$("tbody").append(
			"<tr><td>" + $("#nomeCategoria").val()
					+ "</td><td>" + arraySubcategoria[id].nomeSubcategoria
					+ "</td><td><a id=" + id
					+ " onclick='excluir(id)'>X</a></td><td><a id=" + id
					+ " onclick='editar(id)'>O</a></td></tr>");
}

function desenharNovo() {
	$("tbody").empty();
}

function limparCampos() {
	$("#nomeCategoria").val("");
	$("#subcategoria").val("");
	arraySubcategoria.length = 0;
	var subcategoria = null;
	var id = null;
	desenharNovo();
}

function enviar() {
	var dados = {
		nomeCategoria : $("#nomeCategoria").val(),
		subcategorias : arraySubcategoria
	}

	var jsonText = JSON.stringify(dados);

	// Salva os dados...
	$.ajax({
		url : "http://" + url.toString() + "/API/categoria",
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

};

$(document).ready(function() {
	$("#nomeCategoria").blur(function() {
		var nome = $("#nomeCategoria").val();
		if (nome != "") {
			$("#subcategoria").removeAttr('disabled');
			$("#subcategoria").focus();
		} else {
			alert("Prencha com uma categoria.");
		}
	});
});