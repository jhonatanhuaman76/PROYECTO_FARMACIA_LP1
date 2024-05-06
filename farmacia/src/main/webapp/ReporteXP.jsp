<%@page import="com.farmacia.dao.ProductoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Libreria Bootstrap v3 (adaptado) -->
<link rel="stylesheet" href="css/bootstrapV3.css">

<!-- Librería Jquery v3.7.1-->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<!-- Librería Bootstrap v5.3.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- Bootstrao-Select v1.14.0-beta3 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">

<!-- 
	Librería Bootstrap-select(v1.14.0-gamma1) NoOficial 
	Author: mattymatty76
-->
<script src="js/bootstrap-select(v1.14.0-gamma1).js"></script>

<!-- Librería SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Librería BootstrapValidator -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.1/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.1/js/bootstrapValidator.min.js"></script>

<!-- Librería DataTable -->
<link href="https://cdn.datatables.net/2.0.3/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/responsive/3.0.1/css/responsive.bootstrap5.css" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/3.0.1/css/buttons.dataTables.css" rel="stylesheet">
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.min.js"></script>
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/3.0.1/js/dataTables.responsive.js"></script>
<script src="https://cdn.datatables.net/responsive/3.0.1/js/responsive.bootstrap5.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.1/js/dataTables.buttons.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.1/js/buttons.dataTables.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.1/js/buttons.colVis.min.js"></script>

<!-- Librería moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<title>Reporte de Ventas por Producto | Farma Plus</title>
<link rel="icon" type="image/x-icon" href="img/logo-icon.ico">
<style type="text/css">
	.bootstrap-select .dropdown-toggle:focus, .bootstrap-select>select.mobile-device:focus+.dropdown-toggle{
	    outline: none!important;
	}
</style>
</head>
<body>
	<c:set var="lista_pro" value="<%= new ProductoDAO().listadoProducto() %>" />
	<div class="container">
		<%@ include file="componentes/menu.jsp" %>
		<div class="row mt-4">
			<div class="col-md-9">
				<h1>Reporte Ventas por Producto</h1>				
			</div>
		</div>
		<div class="mt-4 row">
    	<div class="col form-group ns">
    		<label for="cboProducto" class="form-label">Producto</label>
	      <select class="selectpicker w-100" name="producto" data-placeholder="Elije un producto" data-live-search="true" id="cboProducto">
				  <c:forEach var="pro" items="${pageScope.lista_pro}">
				  	<option value="${pro.getCod_pro()}"> ${pro.getCod_pro()} -- ${pro.getNom_pro()}</option>
				  </c:forEach>
				</select>
    	</div>
    </div>
		<div class="table-responsive mt-4">
			<table class="table table-striped display responsive nowrap" id="mydatatable" style="width:100%">
		 		<thead>
			  		<tr>
							<th >Nro Boleta</th>
							<th>Cliente</th>
							<th>Empleado</th>
							<th>Metodo pago</th>
							<th>Fecha Emision</th>
							<th>Total Venta</th>
							<th>Acciones</th>
			  		</tr>
				</thead>
				<tbody>
				
				</tbody>
		 	</table>
		</div>
	</div>
	
<!-- Modal Detalle-->
<div class="modal fade" id="detalleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">DETALLE DE VENTA</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    		<div class="table-responsive mt-4">
					<table class="table table-striped display responsive nowrap" id="detalleTable" style="width:100%">
				 		<thead>
					  		<tr>
									<th>Nro Lote</th>
									<th>Producto</th>
									<th>UNIDAD</th>
									<th>CANTIDAD (UND)</th>
									<th>Precio Venta</th>
									<th>Total</th>
					  		</tr>
						</thead>
						<tbody>
						
						</tbody>
				 	</table>
				</div>
      </div>
    </div>
  </div>
</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			function mostrarDetalleVenta(codBole){
				$.post(
					'${pageContext.servletContext.contextPath}/gestionDetalleBoleta', {
						codBoleta: codBole
					}, function(result){
						const detalles = $.parseJSON(result);
						
						$('#detalleTable tbody').empty();
						detalles.forEach(function(e){
							var nuevaFila = $('<tr>');
							
							var nroLoteTd = $('<td>').text(e.cod_lote);
							nuevaFila.append(nroLoteTd);
							
							var productoTd = $('<td>').text(e.nom_pro);
							nuevaFila.append(productoTd);
							
							var abtrUnidadTd = $('<td>').text(e.abtr_unidad);
							nuevaFila.append(abtrUnidadTd);
							
							var cantidadTd = $('<td>').text(e.cant_vend_base);
							nuevaFila.append(cantidadTd);
							
							var precioTd = $('<td>').text(e.pre_unit_venta);
							nuevaFila.append(precioTd);
							
							var totalTd = $('<td>').text(e.total);
							nuevaFila.append(totalTd);
							
							$('#detalleTable tbody').append(nuevaFila);
						});
						
					}
				).fail(function(jqXHR, textStatus, errorThrown){
					$('#detalleTable tbody').empty();
				});
			}
			
			function mostrarVentasProducto(codPro){
				$.post('${pageContext.servletContext.contextPath}/gestionReportes',{
					codProducto: codPro,
					reporte: 'rxp'
				}, function(result){
					const ventas = $.parseJSON(result);
					
					table.destroy();
					$('#mydatatable tbody').empty();
					ventas.forEach(function (e){
						var nuevaFila = $('<tr>');
						
						var codigoTd = $('<td>').text(e.cod_boleta);
						nuevaFila.append(codigoTd);
						
						var clienteTd = $('<td>').text(e.nom_cli+" "+e.ape_cli);
						nuevaFila.append(clienteTd);
						
						var empleadoTd = $('<td>').text(e.nom_emp+" "+e.ape_emp);
						nuevaFila.append(empleadoTd);
						
						var metodoPagoTd = $('<td>').text(e.metodo_pago);
						nuevaFila.append(metodoPagoTd);
						
						var fechaEmTd = $('<td>').text(e.fecha_em);
						nuevaFila.append(fechaEmTd);
						
						var totalVentaTd = $('<td>').text(e.total_venta);
						nuevaFila.append(totalVentaTd);
						
						var btnDetalleTd = $('<td>');
						btnDetalleTd.append($('<button data-bs-toggle="modal" data-bs-target="#detalleModal">').addClass('btn btn-primary btnDetalle').attr('type', 'button').data('codBoleta',e.cod_boleta).text('Detalle'));
						nuevaFila.append(btnDetalleTd);
						
						$('#mydatatable tbody').append(nuevaFila);
					});
					table = $("#mydatatable").DataTable(TABLE_CONFIG);
				}).fail(function(jqXHR, textStatus, errorThrown){
					table.destroy();
					$('#mydatatable tbody').empty();
					table = $("#mydatatable").DataTable(TABLE_CONFIG);
				});
			}
			
			$(document).on('click', '.btnDetalle', function(){
				const codBole = $(this).data('codBoleta');
				mostrarDetalleVenta(codBole);
			});
			
			// Activar Bootstrap Select
			$('.selectpicker').selectpicker();
			
			$('#cboProducto').on('change', function(){
				const cod = $(this).val();
				mostrarVentasProducto(cod);
			});
			
			const TABLE_CONFIG = {
					language: {
						url: '//cdn.datatables.net/plug-ins/2.0.3/i18n/es-ES.json',
					},
					responsive: true,
					columnDefs: [
					    { responsivePriority: 1, targets: 6 }
					]
			}
			
			let table = $('#mydatatable').DataTable(TABLE_CONFIG);
		});
	</script>
</body>
</html>