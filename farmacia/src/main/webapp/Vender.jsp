<%@page import="com.farmacia.dao.LoteDAO"%>
<%@page import="com.farmacia.dao.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.empleado}">
	<jsp:forward page="/Login.jsp"/>
</c:if>
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

<title>Punto de venta | FarmaPlus</title>
<link rel="icon" type="image/x-icon" href="img/logo-icon.ico">
<style type="text/css">
  .outer {
    overflow-y: auto;
    height: 300px;
  }

  .outer {
    width: 100%;
    -layout: fixed;
  }

  .outer th {
    text-align: left;
    top: 0;
    position: sticky;
    background-color: white;
  }
  
  
.bootstrap-select .dropdown-toggle:focus, .bootstrap-select>select.mobile-device:focus+.dropdown-toggle{
    outline: none!important;
}
</style>
</head>
<body>
<c:set var="lista_cli" value="<%= new ClienteDAO().listadoCliente() %>" />
<c:set var="lista_lote" value="<%= new LoteDAO().listadoLote() %>" />

	<div class="container">
		<%@ include file="componentes/menu.jsp" %>
		<form class="mt-4" action="gestionVentas" role="form" method="post" id="frmVentas">
			<h1>Punto de Venta FarmaPlus</h1>
	    <div class="mt-4 row">
	    	<div class="col-md-10 form-group ns">
	    		<label for="txtCliente" class="form-label">Cliente</label><button type="button" class="btn text-primary fw-bold border-0" data-bs-toggle="modal" data-bs-target="#modalRegistro">[+ Nuevo]</button>
		      <select class="selectpicker w-100" name="cliente" data-placeholder="Elije un cliente" data-live-search="true" id="txtCliente">
					  <c:forEach var="cli" items="${pageScope.lista_cli}">
					  	<option value="${cli.getCod_cli()}">${cli.getNom_cli()} ${ cli.getApe_cli()} -- DNI: ${cli.getDni_cli()}</option>
					  </c:forEach>
					</select>
	    	</div>
	    	<div class="col-md-2 form-group">
	    		<label for="cboMetodoPago" class="form-label">Metodo pago:</label>
	    		<select class="selectpicker w-100" name="metodo_pago" id="cboMetodoPago" data-placeholder="Elije un metodo">
	    			<option value="TRANSFERENCIA">Transferencia</option>
	    			<option value="EFECTIVO">Efectivo</option>
	    		</select>
	    	</div>
	    </div>
	    <div class="mt-4 row">
	    	<div class="col-md-8 form-group">
	    		<label for="cboLote" class="form-label">Producto</label>
		      <select class="selectpicker w-100" name="lote" data-placeholder="Elije un producto" data-live-search="true" id="cboLote">
					  <c:forEach var="lote" items="${pageScope.lista_lote}">
					  	<option 
					  	value="${lote.getNro_lote()}"
					  	data-codpro="${lote.getCod_pro()}"
					  	data-nombre="${lote.getNom_pro()}"
					  	data-precio="${lote.getPre_unit_venta()}"
					  	data-stock="${lote.getStock()}"
					  	>
					  		#${lote.getNro_lote()} -- ${lote.getNom_pro()} -- Fecha Venc: ${lote.getFecha_venc()}
					  	</option>
					  </c:forEach>
					</select>
	    	</div>
	      <div class="col-md-2 form-group">
			    <label for="txtPrecio" class="form-label">Precio Unitario</label>
			    <input type="number" class="form-control" id="txtPrecio" readonly>
			  </div>
			  <div class="col-md-2 form-group">
			    <label for="txtStock" class="form-label">Stock</label>
			    <input type="number" class="form-control" id="txtStock" readonly>
			  </div>
	    </div>
	    <div class="mt-4 row g-3">
	    	<div class="col-md-5  form-group">
			    <label for="txtCantidad" class="form-label">Cantidad</label>
			    <input type="number" min="0" class="form-control" id="txtCantidad">
			  </div>
			  <div class="col-md-5 form-group">
			  	<label for="cboUnidadMedida" class="form-label">Unidad de Medida</label>
			    <select class="selectpicker w-100" name="unida_medida" id="cboUnidadMedida" data-placeholder="Primero Elije un producto...">
					</select>
			  </div>
			  <div class="col-md-2 d-flex align-items-end">
					<button type="button" class="btn btn-primary w-100" id="btnAgregarProducto">
					  + Agregar producto
					</button>
			  </div>
	    </div>
	    <div class="table-responsive mt-4 outer">
	    	<table class="table table-striped display responsive nowrap" id="mydatatable">
	    		<thead>
		    		<tr>
							<th>Nro Lote</th>
							<th>Nombre</th>
							<th>Unidades</th>
							<th>Cantidad <br>(PRES)</th>
							<th>Cantidad <br>(UND)</th>
							<th>Precio</th>
							<th>Importe</th>
							<th>Acciones</th>	    		
		    		</tr>
					</thead>
					<tbody style="max-height:200px;overflow:auto">
					</tbody>
	    	</table>
	    </div>
	    <div class="mt-4 d-md-flex justify-content-md-end gap-4">
	    	<div class="">
			    <label for="txtSubtotal" class="form-label">Subtotal</label>
			    <input type="number" class="form-control" id="txtSubtotal" value="0" disabled>
			  </div>
			  <div class="">
			    <label for="txtIgv" class="form-label">Importe IGV</label>
			    <input type="number" class="form-control" id="txtIgv" value="0" disabled>
			  </div>
			  <div class="">
			    <label for="txtTotal" class="form-label">Importe Total</label>
			    <input type="number" class="form-control" id="txtTotal" value="0" disabled>
			  </div>
	    </div>
	    <div class="my-4 d-md-flex justify-content-md-end gap-2">
			  <button type="submit" class="btn btn-success" id="btnVender">Vender</button>
	    </div>
		</form>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="modalRegistro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="titleModalRegistro">Registrar Cliente</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form role="form" method="post" class="d-flex flex-column gap-4" id="frmCliente">
      		<input type="hidden" class="form-control" id="codigo" name="codigo">
        	<div class="row">
	        	<div class="form-group">
	      			<label>DNI</label>
	      			<input type="text" class="form-control" id="dni" name="dni" placeholder="Ingrese el DNI">
	     			</div>
        	</div>
        	<div class="row">
	        	<div class="form-group">
	      			<label>Nombre</label>
	      			<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Apellido</label>
	      			<input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingrese el apellido">
	     			</div>
        	</div>
        	<div class="row">
	        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	             <button type="submit" class="btn btn-success" name="accion" value="AgregarAjax" id="btnGuardar">Guardar</button>
	             <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancelar</button>
	         	</div>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		// Aplicando validaciones
		$('#frmCliente').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		  },
		  excluded:[':disabled'],
		  fields:{
			  dni:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'El DNI es obligatorio'
	  			  },
	  				stringLength:{
	  					message:'DNI debe tener 8 digitos', 
	  					min: 8, 
	  					max: 8 
	  				}
				  }
			  },
			  nombre:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'EL nombre es obligatorio'
	  			  },
	  				stringLength:{
	  					message:'Nombre debe tener entre 3 a 30 caracteres',
	  					min: 3, 
	  					max:30 
	  				}
				  }
			  },
			  apellido:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'El apellido es obligatorio'
	  			  },
	  				stringLength:{
	  					message:'Nombre debe tener entre 3 a 30 caracteres',
	  					min:3, 
	  					max:30
	  				}
				  }
			  }
	    }
		}).on('success.form.bv', function(e){
			e.preventDefault();
			registrarCliente();
	  	$('#modalRegistro').modal('hide');
  	  $('#frmCliente input').val('');
  		$("#frmCliente").data('bootstrapValidator').resetForm();
		});
		
		function registrarCliente(){
			const formData = $("#frmCliente").serialize();
			$.post('${pageContext.servletContext.contextPath}/gestionClienteAjax', 
				formData, function(result){
				$("#txtCliente").empty();
				const cli = $.parseJSON(result);
				
				cli.forEach(function (e) {
					$('#txtCliente').append(
							$('<option>')
							.attr('value', e.cod_cli)
							.text(e.nom_cli+" "+e.ape_cli+" -- DNI: "+e.dni_cli)
					);
				});
				$('#txtCliente').selectpicker('refresh');
			}).fail(function(jqXHR, textStatus, errorThrown){
				
			});
		}
		
		function enviarDatosProducto(nroLote, precio, stock){
			if(nroLote !== ''){
				$('#txtPrecio').val(precio);
				$('#txtStock').val(stock);
			}else{
				$('#txtPrecio').val("");
				$('#txtStock').val("");
			}
		}
		
		function solicitarUmProducto(codPro, callback){
			$.post('${pageContext.servletContext.contextPath}/gestionUM',{
				codProducto: codPro
				}, function(result){
					$("#cboUnidadMedida").data('placeholder', null);
					$("#cboUnidadMedida").empty();
					const ump = $.parseJSON(result);
					
					ump.forEach(function (e) {
						$('#cboUnidadMedida').append(
								$('<option>')
								.attr('value', e.cod_uni)
								.text(e.abtr_uni+" ("+e.des_uni+")"+" -- Contiene: "+e.factor+" und")
								.data('abtr', e.abtr_uni)
								.data('factor', e.factor)
						);
					});
					$('#cboUnidadMedida').selectpicker('refresh');
					callback();
					
			}).fail(function(jqXHR, textStatus, errorThrown){
				console.error('Se produjo un error:', errorThrown);
				$("#cboUnidadMedida").data('placeholder', 'Primero elije un producto...');
				$("#cboUnidadMedida").empty();
				$('#cboUnidadMedida').selectpicker('refresh');
			});
		}
	
    function validarIngresoProductoEnTabla(nroLote, codUnidad, cantidad, stock, factor){
    	const isValidNroLote = validarNroLote(nroLote, codUnidad);
      const isValidCantidad = validarCantidad(cantidad, stock, factor, nroLote);
      const isValidUnidad = validarUnidad(codUnidad);
    	
      if(isValidNroLote && isValidCantidad && isValidUnidad){
          return true;
      } else {
          return false;
      }
    }
    
    function validarNroLote(nroLote, nroUnidad){
    	let isValid = true;
    	const divProducto = $('#cboLote').closest('.form-group');
    	
    	if(nroLote === ''){
    		divProducto.removeClass('has-success');
    		divProducto.removeClass('has-error').find("small").remove();
    		divProducto.addClass('has-error').append($('<small>').addClass('help-block').text('Seleccione un producto'));
    		isValid = false;
    	}else if(existeLoteEnTabla(nroLote, nroUnidad)){
    		divProducto.removeClass('has-success');
    		divProducto.removeClass('has-error').find("small").remove();
    		divProducto.addClass('has-error').append($('<small>').addClass('help-block').text('El producto seleccionado ya existe en la tabla con esa unidad'));
    		isValid = false;
    	}else{
    		divProducto.removeClass('has-error').find("small").remove();
    		divProducto.addClass('has-success');
    	}
    	
    	return isValid;
    }
    
    function validarCantidadExtend(cantidad, stock, factor, nroLote){
			const divCantidad = $('#txtCantidad').closest('.form-group');
     	
     	if(cantidad <= 0 || !cantidad || !factor || !stock){
				return;
     	}else if((cantidad*factor)+cantidadTotalLote(nroLote)>stock){
     		divCantidad.removeClass('has-success');
     		divCantidad.removeClass('has-error').find("small").remove();
     		divCantidad.addClass('has-error').append($('<small>').addClass('help-block').text('La cantidad es mayor al stock'));
     	}else{
     		divCantidad.removeClass('has-error');
     		divCantidad.removeClass('has-error').find("small").remove();
     		divCantidad.addClass('has-success');
     	}
    }
    
    function validarCantidad(cantidad, stock, factor, nroLote){
    	let isValid = true;
     	const divCantidad = $('#txtCantidad').closest('.form-group');
     	
     	if(cantidad <= 0 || !cantidad){
     		divCantidad.removeClass('has-success');
     		divCantidad.removeClass('has-error').find("small").remove();
     		divCantidad.addClass('has-error').append($('<small>').addClass('help-block').text('Ingrese una cantidad valida'));
     		isValid = false;
     	}else if((cantidad*factor)+cantidadTotalLote(nroLote)>stock){
     		divCantidad.removeClass('has-success');
     		divCantidad.removeClass('has-error').find("small").remove();
     		divCantidad.addClass('has-error').append($('<small>').addClass('help-block').text('La cantidad es mayor al stock'));
     		isValid = false;
     	}else{
     		divCantidad.removeClass('has-error');
     		divCantidad.removeClass('has-error').find("small").remove();
     		divCantidad.addClass('has-success');
     	}
    	
    	return isValid;
    }
    
    function validarCantidadTabla(cantidad, div, factor, stock, nroLote){
    	let isValid = true;
    	if(cantidad <= 0 || !cantidad){
    		div.removeClass('has-success');
    		div.removeClass('has-error').find("small").remove();
    		div.addClass('has-error').append($('<small>').addClass('help-block').text('Ingrese una cantidad valida'));
    		isValid = false;
    	}else if(cantidadTotalLote(nroLote)>stock){
     		div.removeClass('has-success');
     		div.removeClass('has-error').find("small").remove();
     		div.addClass('has-error').append($('<small>').addClass('help-block').text('La cantidad es mayor al stock'));
     		isValid = false;
     	}else{
     		div.removeClass('has-error');
    		div.removeClass('has-error').find("small").remove();
    		div.addClass('has-success');
    	}
    	
    	return isValid;
    }
    
    function validarUnidad(codUnidad){
    	let isValid = true;
    	const divUnidaMedida = $('#cboUnidadMedida').closest('.form-group');
    	
    	if(codUnidad === ''){
    		divUnidaMedida.removeClass('has-success');
    		divUnidaMedida.removeClass('has-error').find("small").remove();
    		divUnidaMedida.addClass('has-error').append($('<small>').addClass('help-block').text('Seleccione una unidad de medida'));
    		isValid = false;
    	}else{
    		divUnidaMedida.removeClass('has-error').find("small").remove();
    		divUnidaMedida.addClass('has-success');
    	}
    	
    	return isValid;
    }
    
    function existeLoteEnTabla(nroLote, nroUnidad){
    	let loteEncontrado = false;
    	$('#mydatatable tbody tr').each(function(){
    		const loteEnTabla = $(this).find('.codigo input').val();
    		const unidadEnTabla = $(this).find('.unidad input').val();
    		if(loteEnTabla == nroLote && nroUnidad == unidadEnTabla){
    			loteEncontrado = true;
    			return;
    		}
    	});
    	return loteEncontrado;
    }
    
    function actualizarTotales(){
    	let subtotal = 0;
    	let igv = 0;
    	let total = 0;
    	
    	$('#mydatatable tbody tr').each(function(){
    		subtotal += parseFloat($(this).find('.importe').text());
    	});
    	
    	igv = subtotal*0.18;
    	total=subtotal+igv;
    	
    	
    	$('#txtSubtotal').val((subtotal).toFixed(2));
    	$('#txtIgv').val((igv).toFixed(2));
    	$('#txtTotal').val((total).toFixed(2));
    }
    
    function anadirNuevoDetalle(nroLote, nombreProducto, abtrUnidad, codUnidad, cantidad, factorUnidad, precio, stock){
    	// Crear un nueva fila
			var nuevaFila = $('<tr>');
    	
    	console.log(nroLote);
			
			// Añadir la celda del nroLote a la fila
			var nroloteTd = $('<td>').addClass('codigo').css('width', '150px');
			nroloteTd.append($('<input>').addClass('form-control border-0').attr('type', 'number').attr('name', 'nroLote[]').val(nroLote).prop('readonly', true));
			nuevaFila.append(nroloteTd);
			
			// Añadir la celda de nombre del producto a la fila
			nuevaFila.append($('<td>').addClass('nombre').text(nombreProducto));
			
			//Añadir la celda de unidad seleccionada a la fila
			var unidadTd = $('<td>').addClass('unidad').css('width', '150px').text(abtrUnidad);
			unidadTd.append($('<input>').addClass('form-control border-0').attr('type', 'hidden').attr('name', 'unidad[]').val(codUnidad).prop('readonly', true));
			nuevaFila.append(unidadTd);
			
			var cantidadPresTd = $('<td>').addClass('cantidad cantidadPresDiv form-group').css('width', '150px');
			cantidadPresTd.append($('<input>').addClass('form-control border-0 cantidadPres').attr('type', 'number').attr('name', 'cantidadPres[]').val(cantidad).prop('readonly', true));
			nuevaFila.append(cantidadPresTd);
			
			// Añadir la celda de cantidad a la fila
			var cantidadTd = $('<td>').addClass('cantidad form-group').css('width', '150px');
			cantidadTd.append($('<input>').addClass('form-control border-0 cantidadBase').attr('name', 'cantidadBase[]').val(cantidad*factorUnidad).prop('readonly', true));
			cantidadTd.append($('<input>').addClass('form-control border-0 factor').attr('type', 'hidden').attr('name', 'factor').val(factorUnidad).prop('readonly', true));
			cantidadTd.append($('<input>').addClass('form-control border-0 stock').attr('type', 'hidden').attr('name', 'stock').val(stock).prop('readonly', true));
			nuevaFila.append(cantidadTd);
			
			// Añadir la celda de precio a la fila
			var precioTd = $('<td>').addClass('precio').css('width', '150px').text((precio*factorUnidad).toFixed(2));
			precioTd.append($('<input>').addClass('form-control border-0').attr('type', 'hidden').attr('name', 'precio[]').val(precio).prop('readonly', true));
			nuevaFila.append(precioTd);
			
			// Añadir la importe a la fila
			nuevaFila.append($('<td>').addClass('importe').text((precio*factorUnidad*cantidad).toFixed(2)));
			
			// Añadir la celda con los botones editar y eliminar a la fila
			var accionesTd = $('<td>');
			accionesTd.append($('<button>').addClass('btn btn-dark btnEditar me-2').attr('type', 'button').text('Editar'));
			accionesTd.append($('<button>').addClass('btn btn-danger btnEliminar').attr('type', 'button').text('Eliminar'));
			nuevaFila.append(accionesTd);
			
			$('#mydatatable tbody').append(nuevaFila);
    }

    function limpiarCajasAgregarProducto(){
    	$("#txtCantidad").val("");
    }

    function cantidadTotalLote(nroLote){
    	let cant = 0;
    	$('#mydatatable tbody tr').each(function(){
    		const loteEnTabla = $(this).find('.codigo input').val();
    		const cantidad = parseInt($(this).find('.cantidad .cantidadBase').val());
    		if(loteEnTabla == nroLote){
    			cant+=cantidad;
    		}
    	});
    	return cant;
    }
		
		//Añadir validaciones al formulario de ventas
		$('#frmVentas').bootstrapValidator({
			message: 'This value is not valid',
      feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
      },
      fields:{
    	  cliente:{
    		  validators:{
    			  notEmpty:{
    				  message: 'Cliente es obligatorio'
    			  }
    		  }
    	  },
    	  metodo_pago:{
    		  validators:{
    			  notEmpty:{
    				  message: 'metodo es obligatorio'
    			  }
    		  }
    	  }
      }
		}).on('success.form.bv', function(e){
				// Validar que todos los input con clase cantidadPres de la tabla sea un numero valido
				let cantidadesValidas = true;
		    $('#mydatatable tbody tr').each(function() {
		        const cantidad = $(this).find('.cantidadPres').val();
		        const factor = $(this).find('.factor').val();
		        const stock = $(this).find('.stock').val();
		        
		        if (cantidad <= 0 || !cantidad || factor*cantidad>stock) {
		            cantidadesValidas = false;
		            return;
		        }
		    });
		    
		    if (!cantidadesValidas) {
		        e.preventDefault();
		        Swal.fire({
		            icon: 'error',
		            title: 'Oops...',
		            text: 'Una o más cantidades en la tabla no son válidas. Por favor, ingrese cantidades válidas.',
		            showConfirmButton: true,
		            timer: 2000
		        });
		        $("#frmVentas").data('bootstrapValidator').resetForm(); 	
		    }
		
			   if ($('#mydatatable tbody tr').length === 0) {
			       e.preventDefault();
			       Swal.fire({
			           icon: 'error',
			           title: 'Oops...',
			           text: 'No hay datos en la tabla, agregue productos antes de vender.',
			           showConfirmButton: true,
			           timer: 2000
			       });
			       $("#frmVentas").data('bootstrapValidator').resetForm();
			   }
		   
		});
		
		// Activar Bootstrap Select
		$('.selectpicker').selectpicker();
		
		$('#cboLote').on('change', function(e){
			const nroLote = $('#cboLote').val();
			const codPro = $('#cboLote option:selected').data('codpro');
			const precio = $('#cboLote option:selected').data('precio');
			const stock = $('#cboLote option:selected').data('stock');
			
			//Enviar datos a las cajas precio y stock al seleccionar el producto
			enviarDatosProducto(nroLote, precio, stock);
			
			//Enviar las unidades de medida disponibles del producto seleccionado
			solicitarUmProducto(codPro, function(){
				const stock = $('#cboLote option:selected').data('stock');
			  const valor = $('#txtCantidad').val();
			  const factorUnidad = $('#cboUnidadMedida option:selected').data('factor');
				validarCantidadExtend(valor, stock, factorUnidad, nroLote);
			});
			
			
			//Validar
			validarNroLote(nroLote);
		});
		
		$('#cboUnidadMedida').on('change', function(e){
			const codUnidad = $('#cboUnidadMedida').val();
			const nroLote = $('#cboLote').val();
			
	   	const valor = $('#txtCantidad').val();
	   	const factorUnidad = $('#cboUnidadMedida option:selected').data('factor');
	   	const stock = $('#cboLote option:selected').data('stock');
	   	
			//Validar
			validarUnidad(codUnidad);
			validarCantidadExtend(valor, stock, factorUnidad, nroLote);
		});
		
		// Modificar cantidad al hacer clic en el botón editar
    $('#mydatatable').on('click', '.btnEditar', function() {
    		const nroLote = $(this).closest('tr').find('.codigo input').val();
        const cantidadPresInput = $(this).closest('tr').find('.cantidad input.cantidadPres');
        const cantidadBaseInput = $(this).closest('tr').find('.cantidad input.cantidadBase');
        const factor = $(this).closest('tr').find('.cantidad input.factor').val();
        const stock = $(this).closest('tr').find('.cantidad input.stock').val();
        cantidadPresInput.prop('readonly', false).focus();

      	// Actualizar el importe al modificar la cantidad
        cantidadPresInput.on('input', function() {
            let cantidad = $(this).val();
            let precio = $(this).closest('tr').find('.precio').text();

            let importe = cantidad * parseFloat(precio);
            
            $(this).closest('tr').find('.importe').text(importe.toFixed(2));
            
		        cantidadBaseInput.val(cantidadPresInput.val()*factor);
		        actualizarTotales();
		        
		        const isValid = validarCantidadTabla(cantidad, $(this).closest('tr').find('.cantidadPresDiv'), factor, stock, nroLote);
		        
		        if(!isValid){
		        	 $(this).focus();
		        }
        });

     		// Volver a desactivar campo cantidad al dar 'enter'
        cantidadPresInput.keydown(function(e){
        	
            if(e.keyCode === 13){
                $(this).blur();
            }
        });
     		
      	// Volver a desactivar campo cantidad al perder foco
        cantidadPresInput.blur(function(){
        	let cantidad = $(this).val();
        	const isValid = validarCantidadTabla(cantidad, $(this).closest('tr').find('.cantidadPresDiv'),factor, stock, nroLote);
        	if(!isValid){
	        	 $(this).focus();
	        	 return;
	        }
          $(this).prop('readonly', true);
          return;
        });
      	
    });

    // Eliminar registro del detalle
    $('#mydatatable').on('click', '.btnEliminar', function() {
        $(this).closest('tr').remove();
        
        actualizarTotales()
    });
    
    //Campo cantidad solo se escribe valores enteros positivos
    $('#txtCantidad').on('input', function(){
    	const valor = $(this).val();
    	const nroLote = $('#cboLote').val();
    	const factorUnidad = $('#cboUnidadMedida option:selected').data('factor');
    	const stock = $('#cboLote option:selected').data('stock');
    	
    	validarCantidad(valor, stock, factorUnidad, nroLote);
    });
    
    // Agregar producto al detalle de venta
    $('#btnAgregarProducto').on('click', function(){
    	const nroLote = $('#cboLote').val();
    	const nombreProducto = $('#cboLote option:selected').data('nombre');
    	const codPro = $('#cboLote option:selected').data('codpro');
    	const cantidad = parseInt($('#txtCantidad').val());
    	const precio = $('#cboLote option:selected').data('precio');
    	const codUnidad = $('#cboUnidadMedida').val();
    	const abtrUnidad = $('#cboUnidadMedida option:selected').data('abtr');
    	const factorUnidad = $('#cboUnidadMedida option:selected').data('factor');
    	const stock = $('#cboLote option:selected').data('stock');
    	
    	if(validarIngresoProductoEnTabla(nroLote, codUnidad, cantidad, stock, factorUnidad)){
    		anadirNuevoDetalle(nroLote, nombreProducto, abtrUnidad, codUnidad, cantidad, factorUnidad, precio, stock);
    		actualizarTotales();
    		limpiarCajasAgregarProducto()
    	}

    });

	});
	</script>
  <c:if test="${not empty sessionScope.title}">
	  <script type="text/javascript">
	      $(document).ready(function(){   
	          Swal.fire({
	              position: "center",
	              icon: "<%=request.getSession().getAttribute("icon")%>",
	              title: "<%=request.getSession().getAttribute("title")%>",
	              text:	"<%=request.getSession().getAttribute("text")%>",
	              showConfirmButton: true,
	              timer: 2000
	          });
	      });
	  </script>
	  <% session.removeAttribute("title"); %>
	  <% session.removeAttribute("text"); %>
	  <% session.removeAttribute("icon"); %>
	</c:if>
</body>
</html>