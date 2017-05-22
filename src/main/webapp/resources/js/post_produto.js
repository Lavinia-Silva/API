var config = {
	apiKey : "AIzaSyBrWJAz6qqbhpkRbP5Au6BAYa8jnH4xn0Y",
	authDomain : "cosmetica-b295f.firebaseapp.com",
	databaseURL : "https://cosmetica-b295f.firebaseio.com",
	projectId : "cosmetica-b295f",
	storageBucket : "cosmetica-b295f.appspot.com",
	messagingSenderId : "1053982947503"
};
firebase.initializeApp(config);

var url = window.location.host;
var fileButton = document.getElementById('inputFileToLoad');
var salvar = document.getElementById('salvar');
var file = null;

var arrayImagem = [];
var arrayImagem2 = [];
var arrayImagem3 = [];
var imagem;
var imgData;
var url = window.location.host;
var capa = document.getElementById("cortina");
var pagina = document.getElementById("page-wrapper");

fileButton.addEventListener('change', function(e) {
	arrayImagem2 = e.target.files;
});

salvar.addEventListener('click', function(event) {

	capa.style.display = "block";
	pagina.style.opacity = "0.5";
	$("#loadingimg").show(600);

	// Create a storage ref
	for (var i = 0; i < arrayImagem2.length; i++) {
		imagem = arrayImagem2[i];
		uploadImageAsPromise(imagem);
	}
	var interval = setInterval(function() {
		if (arrayImagem.length == arrayImagem2.length) {
			for (var i = 0; i < arrayImagem.length; i++) {
				var imagem2 = arrayImagem[i];
				var imagem = {
					conteudo : imagem2
				}
				arrayImagem3.push(imagem);
			}
			enviar();
			if (arrayImagem.length = arrayImagem3.length) {
				clearInterval(interval);
			}
		}
	}, 3000);

});

function uploadImageAsPromise(imageFile) {

	return new Promise(function(resolve, reject) {

		var storageRef = firebase.storage().ref();

		var task = storageRef.child(
				'ImagemProduto/' + $("#nomeProduto").val() + imageFile.name)
				.put(imageFile);

		task.on('state_changed', function progress(snapshot) {

		}, function error(err) {

		}, function complete() {
			var download = task.snapshot.downloadURL;
			arrayImagem.push(download);
		});
	});

}

function limparCampos() {
	$("#nomeProduto").val("");
	$("#preco").val("");
	$("#estoque").val("");
	$("#comment").val("");
	$('#inputFileToLoad').fileinput('clear');
	arrayImagem.length = 0;
	arrayImagem2.length = 0;
	arrayImagem3.length = 0;
	imagem = null;
	imgData = null;
	file = null;
}

function enviar() {

	var dados = {
		nomeProduto : $("#nomeProduto").val(),
		preco : $("#preco").val(),
		estoque : $("#estoque").val(),
		descricao : $("#comment").val(),
		fornecedor : {
			id : $("#fornecedor").val()
		},
		subcategoria : {
			id : $("#subcategoria").val()
		},
		imagens : arrayImagem3
	}

	var jsonText = JSON.stringify(dados);
	// Salva os dados...
	console.log(jsonText);

	$.ajax({
		url : "http://" + url.toString() + "/API/produto",
		method : "POST",
		data : jsonText,
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		error : function() {
			alert('failure');
			capa.style.display = "none";
			pagina.style.opacity = "initial";
			$("#loadingimg").hide(600);
		},
		success : function() {
			$("#div_sucesso").css("display", "block");
			capa.style.display = "none";
			pagina.style.opacity = "initial";
			$("#loadingimg").hide(600);
			limparCampos();
		}
	});

};