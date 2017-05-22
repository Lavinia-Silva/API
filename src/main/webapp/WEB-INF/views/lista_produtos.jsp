<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Cosmética - Lista de Produtos</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/geralListaProdutos.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resources/personalizacao/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- script lista salao -->
<script type="text/javascript" defer="defer"
	src="resources/js/load_produto.js"></script>
<script type="text/javascript" src="resources/js/load_ctgforn.js"
	defer="defer"></script>
</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper" style="background-color: #ededed;">

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Lista de Salões</h1>
				</div>
			</div>

			<div class="dropdows">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Categoria</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<select class="form-control" id="categoria">
								<option value='_empty' selected='selected'
									style='display: none;'></option>
							</select>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">Subcategoria</a>
							</h4>
						</div>
						<div id="collapse2" class="panel-collapse collapse">
							<select class="form-control" id="subcategoria">
								<option value='_empty' selected='selected'
									style='display: none;'></option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<!-- LISTA SALAO -->
			<div id="box_lista_produtos" style="background-color: #efd2ee;">

				<input type="text" name="search" placeholder="Search.."
					class="search">

				<div id="produtos">
					<ul id="ul_produtos">

					</ul>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<a href="">Editar</a> <a href="">Ecluir</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$("#box_lista_produtos input").keyup(
					function() {
						var index = $(this).parent().index();
						var nth = "#box_lista_produtos .produto:nth-child("
								+ (index).toString() + ")";
						var valor = $(this).val().toUpperCase();
						$("#box_lista_produtos ul li").show();
						$(nth).each(
								function() {
									if ($(this).text().toUpperCase().indexOf(
											valor) < 0) {
										$(this).parent().hide();
									}
								});
					});

			$("#box_lista_produtos input").blur(function() {
				$(this).val("");
			});
		});
	</script>

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