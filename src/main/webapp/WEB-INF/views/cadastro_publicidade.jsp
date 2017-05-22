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
<title>Cosmética - Cadastro de Salões</title>
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
<link href="resources/css/geralCadastroPublicidade.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">
<!-- Fire Base padrão -->
<script src="https://www.gstatic.com/firebasejs/3.7.4/firebase.js"></script>


</head>
<body>
	<div id="wrapper">

		<c:import url="menu.jsp"></c:import>
		<!-- PÁGINA -->
		<div id="page-wrapper" style="background: #f8f8f8;">

			<!-- FORMULARIO CATEGORIA -->
			<div class="box_publicidade">
				<form class="form_publicidade" onsubmit="return false">
					<h1 class="page-header">Cadastro de Publicidade</h1>
					<fieldset>
						<legend>
							<span class="number">1</span>Publicidade
						</legend>
						<div class="adicionarpublicidade">
							<label class="control-label">Adicionar Publicidade:</label> <input
								type="file" id="fileButton" class="file"
								data-show-upload="false" data-show-caption="true">
							<script>
								$("#fileButton")
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
						<div class="titulo">
							<label>Título:</label> <input type="text" id="title"
								class="form-control">
						</div>
					</fieldset>

					<div>
						<button type="submit" id="salvar" class="btn btn-default"
							style="margin-top: 1%; margin-left: 82%; width: 15%; font-weight: bold; background-color: rgb(206, 102, 150); color: white; margin-bottom: 1%;">SALVAR</button>
					</div>
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
	<!-- Fire Base salvar foto -->
	<script src="resources/js/fireBase.js" type="text/javascript"></script>

</body>
</html>