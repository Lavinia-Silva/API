<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<!-- IMAGEM LOGO - CLIK -> INDEX.HTML -->
			<a class="navbar-brand"><img
				src="resources/img/logopages.png"></a>
		</div>
		<!-- MENU -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<!-- INICIO -->
					<li><a href="inicio" style="color: black;"><i
							class="fa fa-bookmark fa-fw" style="color: black;"></i> Ínicio</a></li>
					<!-- CADASTROS -->
					<li><a href="index" style="color: black;"><i
							class="fa fa-plus-square" style="color: black;"></i> Cadastros<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li>
								<!-- CADASTRO DE SALÃO --> <a href="cadastro_salao"
								style="color: black;">Salão</a>
							</li>
							<li>
								<!-- CADASTRO DE MARCAS --> <a href="cadastro_marcas"
								style="color: black;">Marcas</a>
							</li>
							<li>
								<!-- CADASTRO DE CATEGORIAS --> <a href="cadastro_categorias"
								style="color: black;">Categorias</a>
							</li>
							<li>
								<!-- CADASTRO DE PRODUTOS --> <a href="cadastro_produtos"
								style="color: black;">Produtos</a>
							</li>
							<li>
								<!-- CADASTRO DE PUBLICIDADE --> <a href="cadastro_publicidade"
								style="color: black;">Publicidade</a>
							</li>
						</ul></li>
					<!-- HISTORICO DE VENDAS -->
					<li><a href="historico_vendas" style="color: black;"><i
							class="fa fa-table fa-fw" style="color: black;"></i> Histórico de
							Vendas</a></li>
					<!-- LISTAS -->
					<li><a href="#" style="color: black;"><i
							class="fa fa-list"></i> Listas<spa style="color: black;"
								class="fa arrow"> </span></a>
						<ul class="nav nav-second-level">
							<li>
								<!-- LISTAS DE SALÕES --> <a href="lista_salao"
								style="color: black;">Lista de Salões</a>
							</li>
							<li>
								<!-- LISTAS DE PRODUTOS --> <a href="lista_produtos"
								style="color: black;">Lista de Produtos</a>
							</li>
							<li>
								<!-- LISTAS DE MARCAS --> <a href="lista_marcas"
								style="color: black;">Lista de Marcas</a>
							</li>
							<li>
								<!-- LISTAS DE CATEGORIAS--> <a href="lista_categorias"
								style="color: black;">Lista de Categorias</a>
							</li>
						</ul></li>
					<!-- SAIR -->
					<li><a href="sair" style="color: black;"><i
							class="fa fa-sign-out"></i>Sair</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>

</body>