<%@page import="com.farmacia.dao.ProductoDAO"%>
<%@page import="com.farmacia.dao.LoteDAO"%>
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

<title>Inventario | Farma Plus</title>

<style type="text/css">
  .icon-ns{
  	width: 25px;
  }
  
  textarea{
  resize: none;
  }
  
  .bootstrap-select .dropdown-toggle:focus, .bootstrap-select>select.mobile-device:focus+.dropdown-toggle{
	    outline: none!important;
	}
</style>

</head>
<body>

<c:set var="lista_lote" value="<%= new LoteDAO().listadoLote() %>" />
<c:set var="lista_pro" value="<%= new ProductoDAO().listadoProducto() %>" />

<div class="container">
	<%@ include file="componentes/menu.jsp" %>
	<div class="row mt-4">
		<div class="col-md-9">
			<h1>Inventario de Lotes</h1>				
		</div>
		<div class="col-md-3 align-self-center">
			<button type="button" class="btn btn-success d-flex align-items-center gap-2 justify-content-center" data-bs-toggle="modal" data-bs-target="#exampleModal">
				<img src="img/agregar-blanco.png" class="icon-ns" >Agregar Lote
			</button>
		</div>
	</div>
	<div class="table-responsive mt-4">
		<table class="table table-striped display responsive nowrap" id="mydatatable" style="width:100%">
	 		<thead>
		  		<tr>
						<th >Nro Lote</th>
						<th>Nombre</th>
						<th>Stock</th>
						<th>Precio Compra (UND)</th>
						<th>Fecha Vencimiento</th>
						<th>Fecha Fabricacion</th>
						<th>Acciones</th>
		  		</tr>
			</thead>
			<tbody>
				<c:forEach var="lote" items="${pageScope.lista_lote}">
					<tr>
						<td>${lote.getNro_lote()}</td>
						<td>${lote.getNom_pro()}</td>
						<td>${lote.getStock()}</td>
						<td>${lote.getPre_unit_compra()}</td>
						<td>${lote.getFecha_venc()}</td>
						<td>${lote.getFecha_fab()}</td>
						<td>
							<button 
								type="button" 
								class="btn btn-danger btnEliminar" 
								data-bs-toggle="modal" 
								data-bs-target="#eliminarModal"
								data-cod="${lote.getNro_lote()}"
							>Eliminar</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
	 	</table>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Lote Producto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.servletContext.contextPath}/gestionLote" role="form" method="post" class="d-flex flex-column gap-4" id="frmLotes">
        	<div class="row">
        		<div class="col form-group">
        			<label>Producto</label>
        			<select class="selectpicker w-100" name="producto" data-placeholder="Elije un producto" data-live-search="true" id="txtProducto">
							  <c:forEach var="pro" items="${pageScope.lista_pro}">
							  	<option value="${pro.getCod_pro()}">${pro.getNom_pro()}</option>
							  </c:forEach>
							</select>
        		</div>
        	</div>
       		<div class="row gap-md-0 gap-4">
       			<div class="col-md-4 form-group">
        			<label>Stock</label>
        			<input type="number" min="1" name="stock" id="txtStock" class="form-control">
       			</div>
       			<div class="col-md-4 form-group">
        			<label>Fecha Vencimiento</label>
        			<input type="text" name="fecha_venc" id="txtFechaVenc" class="form-control">
        			<p class="m-0">(YYYY-MM-DD)</p>
       			</div>
       			<div class="col-md-4 form-group">
        			<label>Fecha Fabricacion</label>
        			<input type="text" name="fecha_fab" id="txtFechaFab" class="form-control">
        			<p class="m-0">(YYYY-MM-DD)</p>
       			</div>
       		</div>
       		<div class="row">
	       		<div class="form-group">
	       			<div class="form-floating">
	        			<textarea class="form-control" style="height:100px;" placeholder="Condiciones de transporte" id="floatingTextarea" name="cond_tran"></textarea>
						  	<label for="floatingTextarea">Condiciones de Transporte</label>
	       			</div>
						</div>
       		</div>
        	<div class="row">
        		<div class="col-12 d-grid d-md-flex justify-content-md-end gap-2">
        			<button type="submit" name="accion" value="Agregar" class="btn btn-success me-md-2 f-btnGuardar">Guardar</button>
			        <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancelar</button>
        		</div>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Eliminar-->
<div class="modal fade" id="eliminarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ADVERTENCIA</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="frmEliminarLote" action="gestionLote" method="post">
        	<input type="hidden" class="form-control" name="cod" id="cod-eliminar">
        	<h3>¿Seguro de eliminar?</h3>
        	<div class="d-md-flex justify-content-md-end gap-2 mt-4">
        		<button type="submit" class="btn btn-primary" name="accion" value="Eliminar">Si</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	// Activar Bootstrap Select
	$('.selectpicker').selectpicker();
	
	$.fn.bootstrapValidator.validators.fechaMayor = {
		    validate: function(validator, $field, options) {
		        var fechaVencimiento = $field.val();
		        var fechaFabricacion = validator.getFieldElements('fecha_fab').val();
		        
		        if (!moment(fechaVencimiento, 'YYYY-MM-DD', true).isValid() || !moment(fechaFabricacion, 'YYYY-MM-DD', true).isValid()) {
		        	validator.updateStatus('fecha_fab', 'VALIDATING', 'fechaMenor');
		        	return true;
		        }
		        
		        var dateVencimiento = new Date(fechaVencimiento);
		        var dateFabricacion = new Date(fechaFabricacion);

		        if (moment(fechaVencimiento).isSameOrBefore(fechaFabricacion, 'day')) {
		        		validator.updateStatus('fecha_fab', 'INVALID', 'fechaMenor');
		            return false;
		        }
        		validator.updateStatus('fecha_fab', 'VALID', 'fechaMenor');
		        return true;
		    }
		};
	
	$.fn.bootstrapValidator.validators.fechaMenor = {
		    validate: function(validator, $field, options) {
	    	var fechaVencimiento = validator.getFieldElements('fecha_venc').val();
	        var fechaFabricacion = $field.val();
	        
	        if (!moment(fechaVencimiento, 'YYYY-MM-DD', true).isValid() || !moment(fechaFabricacion, 'YYYY-MM-DD', true).isValid()) {
		        	validator.updateStatus('fecha_venc', 'VALIDATING', 'fechaMayor');
	            return true;
	        }
	        
	        var dateVencimiento = new Date(fechaVencimiento);
	        var dateFabricacion = new Date(fechaFabricacion);

	        if (moment(fechaFabricacion).isSameOrAfter(fechaVencimiento, 'day')) {
	        	validator.updateStatus('fecha_venc', 'INVALID', 'fechaMayor');
	            return false;
	        }

	        validator.updateStatus('fecha_venc', 'VALID', 'fechaMayor');
	        return true;
	    }
	};

	
	// Aplicando validaciones
	$('#frmLotes').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	  },
	  fields:{
  	  producto:{
  		  validators:{
  			  notEmpty:{
  				  message: 'Producto es obligatorio'
  			  }
  		  }
  	  },
  	  stock:{
  		  validators:{
	  			integer:{
		  			  message:' '
		  		},
  			  notEmpty:{
  				  message: 'stock es obligatorio'
  			  },
  				greaterThan:{
	  			  value:1,
	  			  inclusive:true,
	  			  message:'El stock debe ser mayor o igual a 1'
	  		  },
  		  }
  	  },
	  	fecha_venc:{
			  validators:{
				  notEmpty:{
					  message: 'Fecha vencimiento es obligatorio'
				  },
				  date:{
					  format:'YYYY-MM-DD',
					  message:'La fecha no es valida'
				  },
				  fechaMayor: {
					  message: 'La fecha de vencimiento debe ser posterior a la fecha de fabricación'
			    }
			  }
		  },
		  fecha_fab:{
  		  validators:{
  			  notEmpty:{
  				  message: 'fecha fabricacion es obligatorio'
  			  },
	  			date:{
					  format:'YYYY-MM-DD',
					  message:'La fecha no es valida'
				  },
				  fechaMenor:{
					  message: 'La fecha de fabricación debe ser anterior a la fecha de vencimiento'
				  }
  		  }
  	  },
	  	cond_tran:{
			  validators:{
				  notEmpty:{
					  message: 'Condicion es obligatorio'
				  },
				  regexp: {
              regexp: /^([-a-zA-ZÉÍÑÓÚÜáéíóúüñ\s])+$/,
              message: 'Solo puede letras mayúsculas, minúsculas con y sin tilde; y espacio'
          }
			  }
		  }
    }
	});
	
	$('#mydatatable').DataTable({
		language: {
			url: '//cdn.datatables.net/plug-ins/2.0.3/i18n/es-ES.json',
		},
		responsive: true,
		columnDefs: [
	    { responsivePriority: 1, targets: 6 },
	    { responsivePriority: 1, targets: 4 },
	    { responsivePriority: 1, targets: 1 },
	    { responsivePriority: 1, targets: 0 }
	  ]
	});
	
	$('.btnEliminar').on('click', function(){
		let cod = $(this).data('cod');
		console.log(cod);
		$("#cod-eliminar").val(cod);
	});
	
	$('.f-btnGuardar').on('click', function(e){
	})
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
              timer: 3000
          });
      });
  </script>
  <% session.removeAttribute("title"); %>
  <% session.removeAttribute("text"); %>
  <% session.removeAttribute("icon"); %>
</c:if>
</body>
</html>