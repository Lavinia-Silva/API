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
<script src="resources/js/sortable.min.js"></script>
<script src="resources/js/fileinput.min.js"></script>
<title>Cosmética - Cadastro de Produtos</title>
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
<link href="resources/css/geralCadastroProdutos.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resources/personalizacao/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Fire Base padrão -->
<script src="https://www.gstatic.com/firebasejs/3.7.4/firebase.js"></script>

<!-- script -->
<script type="text/javascript" DEFER="DEFER"
	src="resources/js/load_ctgforn.js"></script>

<script type="text/javascript">
	function esconde() {
		var capa = document.getElementById("cortina");
		capa.style.display = "none";
	}
</script>
</head>

<body onLoad="esconde();">
	<div id="cortina"></div>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper" style="background-color: rgb(248, 248, 248);">

			<!-- FORMULARIO PRODUTO -->
			<div class="box_produto">
				<form class="form_produto" style="margin-top: auto;">
					<h1 class="page-header">Cadastro de Produtos</h1>

					<fieldset>
						<legend>
							<span class="number">1</span>Dados do Produto
						</legend>

						<div class="adicionarimagem">
							<label class="control-label">Adicionar Imagem:</label> <input
								id="inputFileToLoad" type="file" class="file"
								data-show-upload="false" data-show-caption="true" multiple>
							<script>
								$("#inputFileToLoad")
										.fileinput(
												{
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

						<div class="nomeproduto">
							<label>nome do produto:</label> <input type="text"
								class="form-control" id="nomeProduto">
						</div>
						<div class="preco">
							<label>preço:</label> <input type="text" class="form-control"
								id="preco">
						</div>
						<div class="estoque">
							<label>estoque:</label> <input type="text" class="form-control"
								id="estoque">
						</div>
						<div class="descricao">
							<label>descrição:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
					</fieldset>
					<fieldset style="margin-top: 2%;">
						<legend>
							<span class="number">2</span>Fornecedor
						</legend>
						<div class="fornecedor">
							<label>fornecedor:</label> <select class="form-control"
								id="fornecedor">
							</select>
						</div>
					</fieldset>
					<fieldset style="margin-top: 2%;">
						<legend>
							<span class="number">3</span>Categoria e Subcategoria
						</legend>
						<div class="categoria">
							<label>categoria:</label> <select class="form-control"
								id="categoria">
								<option value='_empty' selected='selected'
									style='display: none;'></option>
							</select>
						</div>
						<div class="subcategoria">
							<label>sub-categoria:</label> <select class="form-control"
								id="subcategoria">
								<option value='_empty' selected='selected'
									style='display: none;'></option>
							</select>
						</div>
					</fieldset>
					<div>
						<button id="salvar" type="button" class="btn btn-default"
							style="margin-top: 1%; margin-left: 82%; width: 15%; font-weight: bold; background-color: rgb(206, 102, 150); color: white; margin-bottom: 1%;">SALVAR</button>
						<img id="loadingimg" src="resources/img/ajax-loader.png"
							style="display: none;">
					</div>
					<div class="alert alert-success" role="alert" id="div_sucesso"
						style="display: none;">Produto cadastrado com Sucesso!</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resources/personalizacao/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="resources/personalizacao/raphael.min.js"></script>
	<script src="resources/personalizacao/morris.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script src="resources/js/fileinput.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="resources/js/post_produto.js"></script>
</body>

</html>
