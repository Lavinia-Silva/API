var config = {
	apiKey : "AIzaSyBrWJAz6qqbhpkRbP5Au6BAYa8jnH4xn0Y",
	authDomain : "cosmetica-b295f.firebaseapp.com",
	databaseURL : "https://cosmetica-b295f.firebaseio.com",
	projectId : "cosmetica-b295f",
	storageBucket : "cosmetica-b295f.appspot.com",
	messagingSenderId : "1053982947503"
};
firebase.initializeApp(config);

var imgData;
var url = window.location.host;
var fileButton = document.getElementById('inputFileToLoad');
var salvar = document.getElementById('salvar');
var file = null;
var capa = document.getElementById("cortina");
var pagina = document.getElementById("page-wrapper");

function limparCampos() {
	$('#inputFileToLoad').val("");
	$("#cnpj").val("");
	$("#razaoSocial").val("");
	$("#nomeFantasia").val("");
	$("#telefone").val("");
	$("#cep").val("");
	$("#logradouro").val("");
	$("#numero").val("");
	$("#cidade").val("");
	$("#bairro").val("");
	$("#uf").val("");
	$("#complemento").val("");
	$('#inputFileToLoad').fileinput('clear');
	dados = null;
	imgData = null;
	file = null;
}

fileButton.addEventListener('change', function(e) {

	file = e.target.files[0];

});

salvar.addEventListener('click', function(event) {
	capa.style.display = "block";
	pagina.style.opacity = "0.5";
	$("#loadingimg").show(600);

	// Create a storage ref
	var storageRef = firebase.storage().ref();

	// upload file
	var task = storageRef.child(
			'ImagemMarca/' + $("#nomeFantasia").val() + file.name).put(file);

	// Update progress bra
	task.on('state_changed', function progress(snapshot) {

	}, function error(err) {

	}, function complete() {
		imgData = task.snapshot.downloadURL;
		enviar();

	});

});

function enviar() {

	var dados = {
		foto : imgData,
		cnpj : $("#cnpj").val(),
		razaoSocial : $("#razaoSocial").val(),
		nomeFantasia : $("#nomeFantasia").val(),
		telefone : $("#telefone").val(),
		endereco : {
			cep : $("#cep").val(),
			uf : $("#uf").val(),
			cidade : $("#cidade").val(),
			bairro : $("#bairro").val(),
			logradouro : $("#logradouro").val(),
			numero : $("#numero").val(),
			complemento : $("#complemento").val(),
		}
	}

	var jsonText = JSON.stringify(dados);

	// Salva os dados...
	$.ajax({
		url : "http://" + url.toString() + "/API/fornecedor",
		method : "POST",
		data : jsonText,
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		success : function() {
			capa.style.display = "none";
			pagina.style.opacity = "initial";
			$("#loadingimg").hide(600);
			$("#div_sucesso").css("display", "block");
			limparCampos();
		},
		error : function() {
			capa.style.display = "none";
			pagina.style.opacity = "initial";
			$("#loadingimg").hide(600);
			alert('failure');
		}
	});
};