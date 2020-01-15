$(document).ready(function(){
	$("#resultado_salida").hide();
});

function salida_vehiculo(){
	$("#resultado_salida").html("");
	var placa_vehiculo = $("#placa_vehiculo").val();
	if (placa_vehiculo != undefined && placa_vehiculo != "") {
		$.ajax({
			dataType: "json",
			type: "get",
			url: "/salida_vehiculo",
			data: {
				placa_vehiculo: placa_vehiculo
			},
			async: false,
			success: function(responce){
				if(responce.parking != null){
					$("#resultado_salida").show();
					var html = "";
					html += "<div class='row'>"
						html += "<div class='col-md-6'>"
							html += "<label>Placa:</label> "+responce.parking.placa+""
						html += "</div>"

						html += "<div class='col-md-6'>"
							html += "<label>Marca:</label> "+responce.parking.marca+""
						html += "</div>"

					html += "</div>"

					html += "<div class='row'>"
						html += "<div class='col-md-6'>"
							html += "<label>Fecha entrada:</label> "+responce.parking.fecha_entrada+""
						html += "</div>"

						html += "<div class='col-md-6'>"
							html += "<label>Hora entrada:</label> "+responce.hora_entrada+""
						html += "</div>"

					html += "</div>"

					html += "<div class='row'>"
						html += "<div class='col-md-6'>"
							html += "<label>Fecha salida:</label> "+responce.parking.fecha_salida+""
						html += "</div>"

						html += "<div class='col-md-6'>"
							html += "<label>Hora salida:</label> "+responce.hora_salida+""
						html += "</div>"

					html += "</div>"

					html += "<div class='row'>"
						html += "<div class='col-md-6'>"
							html += "<label>Tiempo en parqueadero:</label> "+(responce.parking.tiempo/60).toFixed(1)+" Horas"
						html += "</div>"

						html += "<div class='col-md-6'>"
							html += "<label>Total a pagar:</label> $"+responce.parking.total_pagar+""
						html += "</div>"

					html += "</div>"

					$("#resultado_salida").html(html);
				}else{
					alert("El numero de placa no ha sido ingresado")
				}

			}
				
		});
	}else{
		alert("No ha ingresado un numero de placa")
	}
}
