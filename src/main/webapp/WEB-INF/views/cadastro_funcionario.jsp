<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- jQuery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/personalizacao/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Cosm�tica - Cadastro de Sal�es</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="resources/personalizacao/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/personalizacao/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/geralCadastroSalao.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resources/personalizacao/morris.css" rel="stylesheet">


<!-- Script CNPJ -->
<script src="resources/js/validar_cnpj.js"></script>
<!-- Script ViaCep -->
<script type="text/javascript" src="resources/js/via_cep.js"></script>

<!-- Script de Json -->
<script type="text/javascript" defer="defer">
	var url = window.location.host;
	function loadFuncionario() {
		// Carrega as informa��es de categoria...
		$.getJSON("http://" + url.toString()
				+ "/API/funcionario/${ids.id_func }", {
			get_param : "value"
		}, function(data) {
			funcionario = data;
			console.log(funcionario)
			$("#nome").val(funcionario.nome);
			$("#email").val(funcionario.email);
			$("#rg").val(funcionario.rg);
			$("#cpf").val(funcionario.cpf);
			if (funcionario.tipoFuncionario == true) {
				document.form_salao.proprietario[0].checked = true;
			}
			document.form_salao.proprietario[1].checked = true;
		});
	};
	loadFuncionario();

	function enviar() {
		var dados = {
			id : funcionario.id,
			nome : $("#nome").val(),
			email : $("#email").val(),
			rg : $("#rg").val(),
			cpf : $("#cpf").val(),
			tipoFuncionario : $("input[name='proprietario']:checked").val(),
			logado : funcionario.logado,
			senha : funcionario.senha,
			genero : funcionario.genero,
			pedidos : funcionario.pedidos,
			status : funcionario.status
		}

		var jsonText = JSON.stringify(dados);
		alert(jsonText);
		$.ajax({
			url : "http://" + url.toString()
					+ "/API/salao/${ids.id_salao }/funcionario",
			method : "PUT",
			data : jsonText,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function() {
				$("#div_sucesso").css("display", "block");
				limparCampos();
			},
			error : (function(jqXHR, textStatus, errorThrown) {
				alert("tente novamente mais tarde");
			})
		});
	}

	function limparCampos() {
		$("#nome").val("");
		$("#email").val("");
		$("#rg").val("");
		$("#cpf").val("");
	}
</script>
<!-- Script de M�scara -->
<script>
	jQuery(function($) {
		$("#rg").mask("99.999.999-9");
		$("#cpf").mask("999.999.999-99");
	});
</script>
</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- P�GINA -->
		<div id="page-wrapper" style="background-color: #ededed;">
			<div class="row">
				<!-- CADASTRO DE SAL�O -->
				<div class="col-lg-12">
					<h1 class="page-header">Cadastro de Sal�o</h1>
				</div>
			</div>
			<!-- FORMULARIO SAL�O -->
			<div class="box_salao" style="background-color: #ededed;">
				<form class="form_salao" name="form_salao">
					<!-- DADOS DO SAL�O -->
					<fieldset>
						<legend
							style="margin-left: 5%; font-size: 15px; font-weight: bold;">DADOS
							DO FUNCION�RIO</legend>
						<div style="margin-left: 20%;">
							<label>Nome</label> <input type="text" class="form-control"
								id="nome">
						</div>
						<div style="margin-left: 20%;">
							<label>E-Mail</label> <input type="text" class="form-control"
								style="width: 65%;" id="email">
						</div>
						<div style="margin-left: 20%;">
							<label>RG</label> <input type="text" class="form-control"
								style="width: 50%;" id="rg">
						</div>
						<div style="margin-left: 20%;">
							<label>CPF</label> <input type="text" class="form-control"
								style="width: 50%;" id="cpf">
						</div>
						<div style="margin-left: 20%; margin-top: 2%;">
							<label>Propriet�rio</label> <label class="radio-inline"><input
								type="radio" name="proprietario" id="proprietario" value="true">Sim</label>
							<label class="radio-inline"><input type="radio"
								name="proprietario" id="proprietario" value="false">N�o</label>
						</div>
					</fieldset>
					<div>
						<button onclick="enviar()" type="button" class="btn btn-default"
							style="margin-top: 2%; margin-left: 85%; width: 14.5%; border: 2px solid #969696; font-weight: bold; background-color: #efd2ee;">SALVAR</button>
					</div>
					<div class="alert alert-success" role="alert" id="div_sucesso"
						style="display: none;">Sucesso!</div>
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

</body>

</html>
