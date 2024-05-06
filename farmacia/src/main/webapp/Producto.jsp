<%@page import="com.farmacia.dao.CategoriaDAO"%>
<%@page import="com.farmacia.dao.ProductoDAO"%>
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

<title>Gestion de producto | Farma Plus</title>
<link rel="icon" type="image/x-icon" href="img/logo-icon.ico">

<style type="text/css">
	.icon-ns{
  	width: 25px;
  }
</style>

</head>
<body>

<div class="container">
	<c:set var="lista_producto" value="<%= new ProductoDAO().listadoProducto() %>" />
	<c:set var="lista_categoria" value="<%= new CategoriaDAO().listadoCategoria() %>" />
	
	<%@ include file="componentes/menu.jsp" %>
	
	<div class="row mt-4">
		<div class="col-md-9">
			<h1>Gestion de Productos</h1>				
		</div>
		<div class="col-md-3 align-self-center">
			<button id="btnAgregar" type="button" class="btn btn-success d-flex align-items-center gap-2 justify-content-center" data-bs-toggle="modal" data-bs-target="#modalRegistro">
				<img src="img/agregar-blanco.png" class="icon-ns" >Agregar Producto
			</button>
		</div>
	</div>
	
	<div class="table-responsive mt-4">
		<table class="table table-striped display responsive nowrap" id="mydatatable"  style="width:100%">
	 		<thead>
		  		<tr>
						<th>Codigo</th>
						<th>Categoria</th>
						<th>Producto</th>
						<th>Precio Unitario de Compra</th>
						<th>Precio Unitario de Venta</th>
						<th>Stock Mínimo</th>
						<th>Stock Máximo</th>
						<th>Presentación</th>
						<th>M_Controlado</th>
						<th>Acciones</th>
					
		  		</tr>
			</thead>
			<tbody>
				<c:forEach var="pro" items="${pageScope.lista_producto}">
					<tr>
						<td>${pro.getCod_pro()}</td>
						<td>${pro.getNum_cate()}</td>
						<td>${pro.getNom_pro()}</td>
						<td>${pro.getPre_unit_compra()}</td>
						<td>${pro.getPre_unit_venta()}</td>
						<td>${pro.getStock_min()}</td>
						<td>${pro.getStock_max()}</td>
						<td>${pro.getPres()}</td>
						<td>${pro.getM_control()}</td>
						<td>
							<button 
								type="button" 
								class="btn btn-dark btnEditar" 
								data-bs-toggle="modal" 
								data-bs-target="#modalRegistro"
							>Editar</button>
							<button 
								type="button" 
								class="btn btn-danger btnEliminar" 
								data-bs-toggle="modal" 
								data-bs-target="#eliminarModal"
							>Eliminar</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
	 	</table>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalRegistro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="titleModalRegistro">Registrar/Modificar Producto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.servletContext.contextPath}/gestionProducto" role="form" method="post" class="d-flex flex-column gap-4" id="frmProducto">
      		<input type="hidden" class="form-control" id="codigo" name="codigo">
        	<div class="form-group">
				<label for="exampleInputPassword1" class="form-label">Categoria</label>
					<select class="form-select"  name="txtcategoria" id="categoria">
						<option value="">[Seleccione categoria]</option>
						<c:forEach items="${lista_categoria}" var="datos">
								<option value="${datos.getNum_cate()}">${datos.getNom_cate()}</option>
						</c:forEach>
					</select>
			</div>
        	<div class="row">
	        	<div class="form-group">
	      			<label>Producto</label>
	      			<input type="text" class="form-control" id="producto" name="txtpro" placeholder="Ingrese Producto">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Precio Unitario de Compra</label>
	      			<input type="text" class="form-control" id="puc" name="txtPUC" placeholder="Ingrese el Precio Unitario de Compra">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Precio Unitario de Venta</label>
	      			<input type="text" class="form-control" id="puv" name="txtPUV" placeholder="Ingrese el Precio Unitario de Venta">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Stock Mínimo</label>
	      			<input type="text" class="form-control" id="stockmin" name="txtSMin" placeholder="Ingrese el Stock Mínimo">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Stock Máximo</label>
	      			<input type="text" class="form-control" id="stockmax" name="txtSMax" placeholder="Ingrese la Stock Máximo">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Presentación</label>
	      			<input type="text" class="form-control" id="presentacion" name="txtpresentacion" placeholder="Ingrese Presentacion">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>M_Controlado</label>
	      			<input type="text" class="form-control" id="M_controlado" name="txtMC" placeholder="Ingrese M_controlado">
	     			</div>
        	</div>
        	<div class="row">
	        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	             <button type="submit" class="btn btn-success d-none" name="accion" value="Actualizar" id="btnActualizar">Actualizar</button>
	             <button type="submit" class="btn btn-success" name="accion" value="Agregar" id="btnGuardar">Guardar</button>
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
        <form id="frmEliminarCliente" action="gestionProducto" method="post">
        	<input type="hidden" class="form-control" name="codigo" id="cod-eliminar">
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
		
		// Aplicando validaciones
		$('#frmProducto').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		  },
		  fields:{
			  categoria:{
				  validators:{
					  notEmpty:{
						  message:"Categoria es obligatorio"
					  }
				  }
			  },
			  txtpro:{
				  validators:{
					  notEmpty:{
						  message:"Producto es obligatorio"
					  },
					  regexp: {
	                        regexp: /^([-a-zA-ZÉÍÑÓÚÜáéíóúüñ\s])+$/,
	                        message: 'El Producto puede letras mayúsculas, minúsculas con y sin tilde; y espacio'
	                    }
				  }
			  },
			  txtPUC:{
				  validators:{
					  notEmpty:{
						  message:"Precio Unitario de Compra es Obligatorio"
					  },
					  regexp:{
						  regexp:/^[0-9]*\.?[0-9]{1,2}$/,
					      message:'Ingrese un dato valido'
					  }
				  }
			  },
			  txtPUV:{
				  validators:{
					  notEmpty:{
						  message:"El Precio Unitario de Venta es Obligatoria"
					  },
					  regexp:{
						  regexp:/^[0-9]*\.?[0-9]{1,2}$/,
					      message:'Ingrese un dato valido'
					  }
				  }
			  },
			  txtSMin:{
				  validators:{
					  notEmpty:{
						  message:"El Stock Minimo es obligatorio"
					  },
					  regexp:{
						  regexp:/^[0-9]/,
						  message:"Ingrese un dato valido"
					  }
				  }
			  },
			  txtSMax:{
				  validators:{
					  notEmpty:{
						  message:"El Stock Maximo es obligatorio"
					  },
					  regexp:{
						  regexp:/^[0-9]/,
						  message:"Ingrese un dato valido"
					  }
				  }
			  },
			  txtpresentacion:{
				  validators:{
					  notEmpty:{
						  message:"La presentacion es obligatoria"
					  },
					  stringLength:{
						  message:'Maximo 20 caracteres',
						  max:20
					  },
					  regexp:{
						  regexp:/^([-a-zA-Z0-9ÉÍÑÓÚÜáéíóúüñ\s])+$/,
						  message:'Campo no valido'

					  }
				  }
			  },
			  txtMC:{
				  validators:{
					  notEmpty:{
						  message:"El  M_controlado es obligatorio"
					  },
					  StringLength:{
						  message:"MaXIMO",
						  max:1
					  },
					  regexp:{
						  regexp:/^[0-9]/,
						  message:"Ingrese un dato valido"
					  }
					  
				  }
			  }
			  
			  
		  }//fin de fields
		});
		
		$('#mydatatable').DataTable({
			language: {
				url: '//cdn.datatables.net/plug-ins/2.0.3/i18n/es-ES.json',
			},
			responsive: true,
			columnDefs: [
			    { responsivePriority: 1, targets: 9 }
			]
		});
		
		
		$('.btnEditar').on('click', function(){
			const cod = $(this).parents("tr").find("td")[0].innerHTML;
			const cat = $(this).parents("tr").find("td")[1].innerHTML;
			const pro = $(this).parents("tr").find("td")[2].innerHTML;
			const puc = $(this).parents("tr").find("td")[3].innerHTML;
			const puv = $(this).parents("tr").find("td")[4].innerHTML;
			const stckmin = $(this).parents("tr").find("td")[5].innerHTML;
			const stckmax = $(this).parents("tr").find("td")[6].innerHTML;
			const pre = $(this).parents("tr").find("td")[7].innerHTML;
			const con = $(this).parents("tr").find("td")[8].innerHTML;
			console.log('HOLA');
			
			
			$('#codigo').val(cod);
			$('#categoria').val(cat);
			$('#producto').val(pro);
			$('#puc').val(puc);
			$('#puv').val(puv);
			$('#stockmin').val(stckmin);
			$('#stockmax').val(stckmax);
			$('#presentacion').val(pre);
			$('#M_controlado').val(con);
			
			$('#btnActualizar').removeClass('d-none');
		  $('#btnGuardar').addClass('d-none');
		  
		  $('#titleModalRegistro').text('Modificar Producto');
		});
		
		$('#btnAgregar').on('click', function(){
		  $('#btnGuardar').removeClass('d-none');
		  $('#btnActualizar').addClass('d-none');
		  
		  $('#titleModalRegistro').text('Registrar Producto');
		});
		
		$('.btnEliminar').on('click', function(){
			const cod = $(this).parents("tr").find("td")[0].innerHTML;
			
			console.log(cod);
			
			$("#cod-eliminar").val(cod);
		});
		
		//PARA Q LUEGO DE EDITAR NO SE VEAN LOS CAMPOS DE AGREGAR AFECTADOS
		$('.btn-close').on('click', function(){
			$('#codigo').val("");
			$('#categoria').val("");
			$('#producto').val("");
			$('#puc').val("");
			$('#puv').val("");
			$('#stockmin').val("");
			$('#stockmax').val("");
			$('#presentacion').val("");
			$('#M_controlado').val("");
			
		});
		
		$('.btn-info').on('click', function(){
			$('#codigo').val("");
			$('#categoria').val("");
			$('#producto').val("");
			$('#puc').val("");
			$('#puv').val("");
			$('#stockmin').val("");
			$('#stockmax').val("");
			$('#presentacion').val("");
			$('#M_controlado').val("");
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