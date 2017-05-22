<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Cosmética - Cadastro de Categorias</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/geralCadastroCategorias.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resources/personalizacao/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- script -->
<script type="text/javascript" src="resources/js/post_categoria.js"></script>

</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper" style="background: #f8f8f8;">

			<!-- FORMULARIO CATEGORIA -->
			<div class="box_categoria">
				<form class="form_categoria" style="margin-top: auto;">
					<h1 class="page-header">Cadastro de Categorias</h1>

					<fieldset>
						<legend>
							<span class="number">1</span>Dados do Categoria
						</legend>
						<div class="nomecategoria">
							<label>Nome da Categoria</label> <input type="text"
								class="form-control" name="nomeCategoria" id="nomeCategoria">
						</div>
					</fieldset>
					<fieldset style="margin-top: 2%;">
						<legend>
							<span class="number">2</span>Dados do Subcategoria
						</legend>
						<div>
							<div class="subcategoria">
								<label>SubCategoria</label>
								<div class="input-group">
									<input type="text" id='subcategoria' disabled="disabled"
										class="form-control" aria-label="...">
									<div class="input-group-btn">
										<button type="button" id="" class="btn btn-default"
											onclick="adcionar(id)">ADICIONAR</button>
									</div>
								</div>
							</div>
							<br />

							<table class="table table-bordered">
								<thead style="background-color: rgb(245, 198, 220);">
									<tr>
										<th>Categoria</th>
										<th>Subcategoria</th>
										<th>Excluir</th>
										<th>Alterar</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</fieldset>

					<div>
						<button type="button" onclick="enviar()" class="btn btn-default"
							style="margin-top: 1%; margin-left: 82%; width: 15%; font-weight: bold; background-color: rgb(206, 102, 150); color: white; margin-bottom: 1%;">SALVAR</button>
					</div>
					<div class="alert alert-success" role="alert" id="div_sucesso"
						style="display: none;">Categoria / SubCategoria cadastrados
						com Sucesso!</div>
				</form>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="resources/personalizacao/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/personalizacao/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resources/personalizacao/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="resources/personalizacao/raphael.min.js"></script>
	<script src="resources/personalizacao/morris.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/dist/js/sb-admin-2.js"></script>
</body>
</html>