<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/personalizacao/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<title>Cosmética - Cadastro de Salões</title>
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
<script type="text/javascript" src="resources/js/post_salao.js"></script>
<!-- Script de Json Load-->
<script type="text/javascript" defer="defer">
	var url = window.location.host;
	function loadSalao() {
		// Carrega as informações de categoria...
		$
				.getJSON(
						"http://" + url.toString()
								+ "/API/salao/${param.id_salao }",
						{
							get_param : "value"
						},
						function(data) {
							object = data;
							$("#nomeFantasia").val(object.nomeFantasia);
							$("#razaoSocial").val(object.razaoSocial);
							$("#cnpj").val(object.cnpj);
							$("#telefone").val(object.telefone);
							$("#cep").val(object.endereco.cep);
							$("#logradouro").val(object.endereco.logradouro);
							$("#numero").val(object.endereco.numero);
							$("#cidade").val(object.endereco.cidade);
							$("#bairro").val(object.endereco.bairro);
							$("#uf").val(object.endereco.uf);
							$("#complemento").val(object.endereco.complemento);

							for (var i = 0; i < object.funcionarios.length; i++) {
								arrayFuncs
										.push(funcionario = {
											id : object.funcionarios[i].id,
											nome : object.funcionarios[i].nome,
											email : object.funcionarios[i].email,
											tipoFuncionario : object.funcionarios[i].tipoFuncionario,
											rg : object.funcionarios[i].rg,
											cpf : object.funcionarios[i].cpf,
											logado : object.funcionarios[i].logado,
											senha : object.funcionarios[i].senha,
											genero : object.funcionarios[i].genero,
											pedidos : object.funcionarios[i].pedidos,
											status : object.funcionarios[i].status
										})
								desenhar(i);
							}
						});

	};

	$
	{
		loadSalao
	}
</script>
<!-- Script de Máscara -->
<script>
	jQuery(function($) {
		$("#telefone").mask("(99) 99999-9999");
		$("#cep").mask("99999-999");
		$("#rg").mask("99.999.999-9");
		$("#cpf").mask("999.999.999-99");
	});
</script>

</head>
<body>
	<div id="wrapper">
		<c:import url="menu.jsp"></c:import>

		<!-- PÁGINA -->
		<div id="page-wrapper" style="background-color: rgb(248, 248, 248);">

			<!-- FORMULARIO SALÃO -->
			<div class="box_salao">

				<form class="form_salao">
					<h1 class="page-header">Cadastro de Salão</h1>

					<!-- DADOS DO SALÃO -->
					<fieldset>
						<legend>
							<span class="number">1</span>Dados do Salão
						</legend>
						<div class="nomefantasia">
							<label>nome fantasia:</label> <input type="text"
								class="form-control" id="nomeFantasia" required>
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
							<label>Celular:</label> <input type="text" class="form-control"
								id="telefone" placeholder="(00) 00000-0000">
						</div>
					</fieldset>
					<!-- ENDEREÇO -->
					<fieldset>
						<legend>
							<span class="number">2</span>Endereço
						</legend>
						<div class="cep">
							<label>CEP:</label> <input type="text" class="form-control"
								id="cep" required placeholder="00000-000">
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
							<label>UF:</label> <input type="text" class="form-control"
								id="uf">
						</div>
						<div class="complemento">
							<label>complemento:</label> <input type="text"
								class="form-control" id="complemento">
						</div>
					</fieldset>
					<!-- ADICIONAR FUNCIONARIO -->
					<fieldset class="adicionarFuncionario">
						<legend>
							<span class="number">3</span>Funcionário
						</legend>
						<table class="table table">
							<thead style="background-color: rgb(245, 198, 220);">
								<tr>
									<th>Nome</th>
									<th>Email</th>
									<th>RG</th>
									<th>Editar</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
						<a data-toggle="modal" data-target="#myModal"><img
							src="resources/img/adicionarFuncionario.png"
							style="width: 20%; margin-left: 39.5%;"></a>
					</fieldset>

					<button onclick="enviar()" type="button" id="salvar">Salvar</button>

					<div class="alert alert-success" role="alert" id="div_sucesso"
						style="display: none;">Salão e Funcionários cadastrados com
						Sucesso!</div>
				</form>
			</div>

		</div>

	</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title">Cadastro de Funcionário</h3>
				</div>
				<div class="modal-body">
					<form action="form_funcionario" name="form_funcionario"
						class="form_funcionario">
						<fieldset>
							<legend>
								<span class="number">1</span>Dados do Funcionário
							</legend>
							<div class="nome">
								<label>Nome:</label> <input type="text" class="form-control"
									id="nome" required="required">
							</div>
							<div class="email">
								<label>E-Mail:</label> <input type="text" class="form-control"
									id="email" required placeholder="exemplo@exemplo.com">
							</div>
							<div class="rg">
								<label>RG:</label> <input type="text" class="form-control"
									id="rg" required="required" placeholder="00.000.000-0">
							</div>
							<div class="cpf">
								<label>CPF:</label> <input type="text" class="form-control"
									id="cpf" required="required" placeholder="000.000.000.00">
							</div>
							<div class="senha">
								<label>Senha:</label> <input type="password"
									class="form-control" id="senha" placeholder="*****">
							</div>
							<div class="genero">
								<label>Gênero:</label> <label class="radio-inline"><input
									type="radio" name="genero" id="masculino" value="true"
									checked="checked">Masculino</label> <label class="radio-inline"><input
									type="radio" name="genero" id="feminino" value="false">Feminino</label>
							</div>
							<div class="proprietario">
								<label>Proprietário:</label> <label class="radio-inline"><input
									type="radio" name="proprietario" id="sim" value="true"
									checked="checked">Sim</label> <label class="radio-inline"><input
									type="radio" name="proprietario" id="nao" value="false">Não</label>
							</div>
						</fieldset>
						<div>
							<button onclick="adcionar(id)" name="func_button" type="button"
								class="btn btn-default" data-dismiss="modal"
								style="margin-top: 1%; margin-left: 80%; width: 15%; font-weight: bold; background-color: rgb(206, 102, 150); color: white;">SALVAR</button>
						</div>
					</form>
				</div>
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