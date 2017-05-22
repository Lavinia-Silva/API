<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Cosmética - Lista de Salões</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/geralListaSalao.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resources/personalizacao/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- script lista salao -->
<script type="text/javascript" defer="defer"
	src="resources/js/load_salao.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-table.css">
<link rel="stylesheet" href="resources/css/examples.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootstrap-table.js"></script>
<script src="resources/js/ga.js"></script>


</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper" style="background-color: #ededed;">

			<h1 class="page-header">Lista de Salões</h1>

			<!-- LISTA SALAO -->
			<div id="box_lista_salao">

				<div id="saloes">
					<table id="ul_saloes" class="table table ">
						<thead>
							<tr>
								<th style="font-size: 20px; text-align: center;">Salões</th>
								<th style="font-size: 20px; text-align: center;">Funcionários</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal Dados Salão-->
	<div class="modal fade" id="myModal1" role="dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<div id="salao">
					<!-- FORMULARIO SALÃO -->
					<div class="box_salao">
						<button type="button" class="close" data-dismiss="modal">&times;</button>

						<form class="form_salao" style="margin-top: auto;">
							<h1 class="page-header">Salão Cadastrado</h1>
							<fieldset>
								<legend>
									<span class="number">1</span>Dados do Salão
								</legend>
								<div>
									<label>nome fantasia</label> <input type="text"
										class="form-control" id="nomeFantasia" disabled="disabled">
								</div>
								<div>
									<label>razão social</label> <input type="text"
										class="form-control" id="razaoSocial" disabled="disabled">
								</div>
								<div>
									<label>CNPJ</label> <input type="text" name="cnpj" id="cnpj"
										class="form-control" disabled="disabled">
								</div>
								<div>
									<label>Telefone</label> <input type="text" class="form-control"
										id="telefone" disabled="disabled">
								</div>

							</fieldset>
							<!-- ENDEREÇO -->
							<fieldset class="endereco">
								<legend>
									<span class="number">2</span>Endereço
								</legend>
								<div>
									<label>CEP</label> <input type="text" class="form-control"
										id="cep" disabled="disabled">
								</div>
								<div>
									<label>logradouro</label> <input type="text"
										class="form-control" id="logradouro" disabled="disabled">
								</div>
								<div>
									<label>Nº</label> <input type="text" class="form-control"
										id="numero" disabled="disabled">
								</div>
								<div>
									<label>cidade</label> <input type="text" class="form-control"
										id="cidade" disabled="disabled">
								</div>
								<div>
									<label>bairro</label> <input type="text" class="form-control"
										id="bairro" disabled="disabled">
								</div>
								<div>
									<label>uf</label> <input type="text" class="form-control"
										id="uf" disabled="disabled">
								</div>
								<div>
									<label>complemento</label> <input type="text"
										class="form-control" id="complemento" disabled="disabled">
								</div>
							</fieldset>
							<a id="" href="#" onclick="editarSalao(id)"><img
								src="resources/img/editar.png"
								style="width: 20%; margin-left: 73%;"></a>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal Funcionários -->
	<div class="container">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"
						style="text-align: center; font-size: 25px; color: rgb(208, 108, 154);">Funcionarios
						Cadastrados</h4>
				</div>
				<div class="modal-body">
					<div id="funcs">
						<table id="ul_funcs" data-toggle="table" data-height="299">
							<thead>
								<tr>
									<th data-field="funcionarios">Funcionários</th>
									<th data-field="edit">Editar</th>
								</tr>
							</thead>

							<tbody>

							</tbody>
						</table>

						<ul id="ul_funcs">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$("#box_lista_salao input").keyup(
					function() {
						var index = $(this).parent().index();
						var nth = "#box_lista_salao a:nth-child("
								+ (index).toString() + ")";
						var valor = $(this).val().toUpperCase();
						$("#box_lista_salao ul li").show();
						$(nth).each(
								function() {
									if ($(this).text().toUpperCase().indexOf(
											valor) < 0) {
										$(this).parent().hide();
									}
								});
					});

			$("#box_lista_salao input").blur(function() {
				$(this).val("");
			});
		});
	</script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resources/personalizacao/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="resources/personalizacao/raphael.min.js"></script>
	<script src="resources/personalizacao/morris.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="resources/dist/js/sb-admin-2.js"></script>
</body>

</html>
