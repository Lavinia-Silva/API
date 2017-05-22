<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Cosmética</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper">
			<div class="row">
				<!-- TODOS TIPOS DE CADASTROS -->
				<div class="col-lg-12">
					<h1 class="page-header">Cadastros</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-home fa-5x"></i>
								</div>
								<!-- CADASTRO DE SALÃO -->
								<div class="col-xs-9 text-right">
									<div>Cadastro de Salão</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA AO FORMULÁRIO DE CADASTRO DE SALÃO -->
						<a href="cadastro_salao">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">CADASTRAR</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"
									style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-tags fa-5x"></i>
								</div>
								<!-- CADASTRO DE MARCAS -->
								<div class="col-xs-9 text-right">
									<div>Cadastro de Marcas</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA AO FORMULÁRIO DE CADASTRO DE MARCAS -->
						<a href="cadastro_marcas">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">CADASTRAR</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"
									style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-list-alt fa-5x"></i>
								</div>
								<!-- CADASTRO DE CATEGORIA -->
								<div class="col-xs-9 text-right">
									<div>Cadastro de Categorias</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA AO FORMULÁRIO DE CADASTRO DE CATEGORIA -->
						<a href="cadastro_categorias">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">CADASTRAR</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"
									style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-inbox fa-5x"></i>
								</div>
								<!-- CADASTRO DE PRODUTOS -->
								<div class="col-xs-9 text-right">
									<div>Cadastro de Produtos</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA AO FORMULÁRIO DE CADASTRO DE PRODUTOS -->
						<a href="cadastro_produtos">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">CADASTRAR</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"
									style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-bullhorn fa-5x"></i>
								</div>
								<!-- CADASTRO DE PUBLICIDADE -->
								<div class="col-xs-9 text-right">
									<div>Cadastro de Publicidade</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA AO FORMULÁRIO DE CADASTRO DE PUBLICIDADE -->
						<a href="cadastro_publicidade">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">CADASTRAR</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"
									style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- PÁGINA -->
		<div id="page-wrapper" style="margin-top: -20%;">
			<div class="row">
				<!-- TODOS TIPOS DE LISTAS -->
				<div class="col-lg-12">
					<h1 class="page-header">Listas</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-home fa-2x"></i> <i
										class="glyphicon glyphicon-align-left fa-5x"></i>
								</div>
								<!-- LISTAS DE SALÕES -->
								<div class="col-xs-9 text-right">
									<div>Lista de Salões</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA A LISTA DE SALÕES E FUNCIONÁRIOS -->
						<a href="lista_salao">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">VISUALIZAR</span>
								<span class="pull-right"><i
									class="fa fa-arrow-circle-right" style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-inbox fa-2x"></i> <i
										class="glyphicon glyphicon-align-left fa-5x"></i>
								</div>
								<!-- LISTAS DE PRODUTOS -->
								<div class="col-xs-9 text-right">
									<div>Lista de Produtos</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA A LISTA DE PRODUTOS -->
						<a href="lista_produtos">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">VISUALIZAR</span>
								<span class="pull-right"><i
									class="fa fa-arrow-circle-right" style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-tags fa-2x"></i> <i
										class="glyphicon glyphicon-align-left fa-5x"></i>
								</div>
								<!-- LISTAS DE MARCAS -->
								<div class="col-xs-9 text-right">
									<div>Lista de Marcas</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA A LISTA DE MARCAS -->
						<a href="lista_marcas">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">VISUALIZAR</span>
								<span class="pull-right"><i
									class="fa fa-arrow-circle-right" style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-6">
					<div class="panel" style="background-color: #fc7bb9;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-list-alt fa-2x"></i> <i
										class="glyphicon glyphicon-align-left fa-5x"></i>
								</div>
								<!-- LISTAS DE CATEGORIAS -->
								<div class="col-xs-9 text-right">
									<div>Lista de Categorias</div>
								</div>
							</div>
						</div>
						<!-- DIRECIONA A LISTA DE CATEGORIA -->
						<a href="lista_categorias">
							<div class="panel-footer">
								<span class="pull-left" style="color: black;">VISUALIZAR</span>
								<span class="pull-right"><i
									class="fa fa-arrow-circle-right" style="color: black;"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>

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