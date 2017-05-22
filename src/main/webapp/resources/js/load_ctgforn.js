var url = window.location.host;

function loadCategoria() {
	var categoria;

	// Carrega as informações de categoria...
	$
			.getJSON(
					"http://" + url.toString() + "/API/categoria",
					{
						get_param : "value"
					},
					function(data) {
						categoria = data;

						for (var i = 0; i < categoria.length; i++) {
							$("#categoria").append(
									"<option value='" + categoria[i].id + "'>"
											+ categoria[i].nomeCategoria
											+ "</option>");

							for (var j = 0; j < categoria[i].subcategorias.length; j++) {
								$("#subcategoria")
										.append(
												"<option id="
														+ categoria[i].id
														+ " value='"
														+ categoria[i].subcategorias[j].id
														+ "'>"
														+ categoria[i].subcategorias[j].nomeSubcategoria
														+ "</option>");
							}
						}
						$('#subcategoria option').hide();
					});
};

function loadFornecedor() {
	var object;

	// Carrega as informações de categoria...
	$.getJSON("http://" + url.toString() + "/API/fornecedor", {
		get_param : "value"
	}, function(data) {
		object = data;
		for (var i = 0; i < object.length; i++) {
			$("#fornecedor").append(
					"<option value='" + object[i].id + "'>"
							+ object[i].nomeFantasia + "</option>");
		}
	});

};

// Chamada da função
loadCategoria();
loadFornecedor();

$(document).ready(function() {
	$("#categoria").change(function() {
		var ctgSelect = $("#categoria option:selected").val();
		if (ctgSelect != 0) {
			$('#subcategoria option').hide(); // hide all options initially
			$('#subcategoria option#' + ctgSelect).show(); // show options with
			// the right class
		}
	});
});