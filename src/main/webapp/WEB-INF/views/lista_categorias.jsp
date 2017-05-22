<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Cosmética - Lista de Categorias</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/geralListaCategorias.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resources/personalizacao/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
	var marcas;
	var url = window.location.host;

	function loadMarcas() {
		$
				.getJSON(
						"http://" + url.toString() + "/API/categoria",
						{
							get_param : "value"
						},
						function(data) {
							marcas = data;
							for (var i = 0; i < marcas.length; i++) {
								var base64Img = marcas[i].imagem;
								$("#ul_categoria")
										.append(
												"<tr><td><a href='#' onclick='verMarca(id)' id="
														+ marcas[i].id
														+ " data-toggle='modal' data-target='#myModal1' style='color: black;'>"
														+ marcas[i].nomeCategoria
														+ "</a></td></tr>")
							}
						})
	}
	loadMarcas();

	function verMarca(id) {
		var i = id - 1;
	}

	function editarMarca(id) {
		localStorage.setItem("id_marca", id);
		window.location.href = "cadastro_marcas?id_marca=" + id;
	}
</script>

</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper" style="background-color: #ededed;">

			<h1 class="page-header">Lista de Categorias</h1>

			<!-- LISTA SALAO -->
			<div id="box_lista_categorias">
				<div id="categorias">
					<table id="ul_categoria" class="table table">
						<thead>
							<tr>
								<th style="font-size: 20px; text-align: center;">Categorias</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<!-- Modal Dados Marca -->
	<div class="modal fade" id="myModal1" role="dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<div id="marca">
					<fieldset style="background-color: #efd2ee;">
						<legend>Dados da Categoria</legend>
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
								style="width: 30%;" id="telefone" disabled="disabled">
						</div>

					</fieldset>
					<!-- ENDEREÇO -->
					<fieldset class="endereco" style="background-color: #efd2ee;">
						<legend>Endereço</legend>
						<div>
							<label>CEP</label> <input type="text" class="form-control"
								style="width: 30%;" id="cep" disabled="disabled">
						</div>
						<div>
							<label>logradouro</label> <input type="text" class="form-control"
								id="logradouro" disabled="disabled">
						</div>
						<div>
							<label>Nº</label> <input type="text" class="form-control"
								style="width: 13%;" id="numero" disabled="disabled">
						</div>
						<div>
							<label>cidade</label> <input type="text" class="form-control"
								style="width: 30%;" id="cidade" disabled="disabled">
						</div>
						<div>
							<label>bairro</label> <input type="text" class="form-control"
								style="width: 30%;" id="bairro" disabled="disabled">
						</div>
						<div>
							<label>uf</label> <input type="text" class="form-control"
								style="width: 13%;" id="uf" disabled="disabled">
						</div>
						<div>
							<label>complemento</label> <input type="text"
								class="form-control" style="width: 30%;" id="complemento"
								disabled="disabled">
						</div>
					</fieldset>
					<a id="" href="#" onclick="editarMarca(id)">Editar</a>
				</div>
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
</body>
</html>