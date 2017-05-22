var produtos;
var url = window.location.host;

function loadProdutos() {
	// Carrega as informações de categoria...
	$
			.getJSON(
					"http://" + url.toString() + "/API/produto",
					{
						get_param : "value"
					},
					function(data) {
						produtos = data;
						console.log(produtos);
						for (var i = 0; i < produtos.length; i++) {
							var base64Img = produtos[i].imagens[0].conteudo

							$("#ul_produtos")
									.append(
											"<li class='li_produto' id='"
													+ produtos[i].subcategoria.id
													+ "'> <div class='produto' id=''> <a href='' data-toggle='modal' data-target='#myModal'><div class='produto_imagem'> <img style='max-height: 100%; max-width: 80%;' id='img' src='"
													+ base64Img + "'> <p>"
													+ produtos[i].nomeProduto
													+ "</p></div></a></li>")

						}
					});
};

loadProdutos();

$(document).ready(function() {
	$("#subcategoria").change(function() {
		var ctgSelect = $("#subcategoria option:selected").val();
		if (ctgSelect != 0) {
			$('.li_produto').hide();
			$('#ul_produtos #' + ctgSelect).show();
		}
	});
});