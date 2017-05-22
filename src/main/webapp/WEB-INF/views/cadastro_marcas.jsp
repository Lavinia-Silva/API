<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/personalizacao/jquery.min.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/sortable.min.js"></script>
<script src="resources/js/fileinput.min.js"></script>

<title>Cosmética - Cadastro de Marcas</title>
<link href="resources/css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/geralCadastroMarcas.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">



<!-- Script CNPJ -->
<script src="resources/js/validar_cnpj.js"></script>
<!-- Script ViaCep -->
<script type="text/javascript" src="resources/js/via_cep.js"></script>

<!-- Fire Base padrão -->
<script src="https://www.gstatic.com/firebasejs/3.7.4/firebase.js"></script>

<script>
	jQuery(function($) {
		$("#telefone").mask("(99) 99999-9999");
		$("#cep").mask("99999-999");
		$("#rg").mask("99.999.999-9");
		$("#cpf").mask("999.999.999-99");
	});
</script>

<script type="text/javascript">
	function esconde() {
		var capa = document.getElementById("cortina");
		capa.style.display = "none";
	}
</script>

<script type="text/javascript">
	${storageClear }
	var url = window.location.host;
	var imagem = sessionStorage.getItem("foto");

	function loadMarca() {
		$.getJSON("http://" + url.toString() + "/API/fornecedor/${id_marca }",
				{
					get_param : "value"
				}, function(data) {
					marca = data;
					$("#nomeFantasia").val(marca.nomeFantasia);
					$("#razaoSocial").val(marca.razaoSocial);
					$("#cnpj").val(marca.cnpj);
					$("#telefone").val(marca.telefone);
					$("#cep").val(marca.endereco.cep);
					$("#logradouro").val(marca.endereco.logradouro);
					$("#numero").val(marca.endereco.numero);
					$("#cidade").val(marca.endereco.cidade);
					$("#bairro").val(marca.endereco.bairro);
					$("#uf").val(marca.endereco.uf);
					$("#complemento").val(marca.endereco.complemento);
				});
	}
	${loadMarca }
</script>
</head>
<body onload="esconde();">
	<div id="wrapper">
		<div id="cortina"></div>
		<c:import url="menu.jsp"></c:import>
		<!-- PÁGINA -->
		<div id="page-wrapper" style="background-color: rgb(248, 248, 248);">

			<!-- FORMULARIO MARCAS -->
			<div class="box_marca">
				<form class="form_marca">
					<h1 class="page-header">Cadastro de Marcas</h1>
					<fieldset>
						<legend>
							<span class="number">1</span>Dados do Fornecedor
						</legend>
						<div class="adicionarimagem">
							<label class="control-label">Adicionar Imagem:</label> <input
								id="inputFileToLoad" type="file" class="file"
								data-show-upload="false" data-show-caption="true">
							<script>
								$("#inputFileToLoad")
										.fileinput(
												{
													initialPreview : [ imagem ],
													initialPreviewAsData : true,
													initialPreviewFileType : 'image',
													previewFileType : "image",
													browseClass : "btn btn-success",
													browseLabel : "Adicionar",
													browseIcon : "<i class=\"fa fa-picture-o\"></i> ",
													removeClass : "btn btn-danger",
													removeLabel : "Delete",
													removeIcon : "<i class=\"fa fa-trash\"></i> "
												});
							</script>
						</div>
						<div class="nomefantasia">
							<label>nome fantasia:</label> <input type="text"
								class="form-control" id="nomeFantasia">
						</div>
						<div class="razaosocial">
							<label>razão social:</label> <input type="text"
								class="form-control" id="razaoSocial">
						</div>
						<div class="cnpj">
							<label>CNPJ:</label> <input type="text" name="cnpj" id="cnpj"
								onkeyup="FormataCnpj(this,event)"
								onblur="if(!validarCNPJ(this.value)){alert('CNPJ Informado é inválido'); this.value='';}"
								maxlength="18" class="form-control"
								placeholder="00.000.000/0000-00">
						</div>
						<div class="telefone">
							<label>Telefone:</label> <input type="text" class="form-control"
								id="telefone" placeholder="(00) 0000-0000">
						</div>
					</fieldset>
					<fieldset>
						<legend>
							<span class="number">2</span>Endereço
						</legend>
						<div class="cep">
							<label>CEP:</label> <input type="text" class="form-control"
								id="cep" placeholder="00000-000">
						</div>
						<div class="logradouro">
							<label>logradouro:</label> <input type="text"
								class="form-control" id="logradouro">
						</div>
						<div class="numero">
							<label>Nº</label> <input type="text" class="form-control"
								id="numero" placeholder="000">
						</div>
						<div class="cidade">
							<label>cidade:</label> <input type="text" class="form-control"
								id="cidade">
						</div>
						<div class="bairro">
							<label>bairro:</label> <input type="text" class="form-control"
								id="bairro">
						</div>
						<div class="uf">
							<label>uf:</label> <input type="text" class="form-control"
								id="uf">
						</div>
						<div class="complemento">
							<label>complemento:</label> <input type="text"
								class="form-control" id="complemento">
						</div>
					</fieldset>
					<div>
						<button type="button" id="salvar" class="btn btn-default"
							style="margin-top: 1%; margin-left: 82%; width: 15%; font-weight: bold; background-color: rgb(206, 102, 150); color: white; margin-bottom: 1%;">SALVAR</button>
						<img id="loadingimg" src="resources/img/ajax-loader.png"
							style="display: none;">
					</div>
					<div class="alert alert-success" role="alert" id="div_sucesso"
						style="display: none;">Fornecedor cadastrado com Sucesso!</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/personalizacao/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resources/personalizacao/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="resources/personalizacao/raphael.min.js"></script>
	<script src="resources/personalizacao/morris.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script src="resources/js/post_fornecedor.js"></script>

</body>

</html>
