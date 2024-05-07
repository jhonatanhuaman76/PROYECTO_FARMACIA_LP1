<%@page import="com.farmacia.dao.EmpleadoDAO"%>
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

<title>Gestion de empleado | Farma Plus</title>
<link rel="icon" type="image/x-icon" href="img/logo-icon.ico">

<style type="text/css">
	.icon-ns{
  	width: 25px;
  }
</style>

</head>
<body>

<div class="container">
	<c:set var="lista_empl" value="<%= new EmpleadoDAO().listadoEmpleado() %>" />
	
	<%@ include file="componentes/menu.jsp" %>
	
	<div class="row mt-4">
		<div class="col-md-9">
			<h1>Gestion de empleados</h1>				
		</div>
		<div class="col-md-3 align-self-center">
			<button id="btnAgregar" type="button" class="btn btn-success d-flex align-items-center gap-2 justify-content-center" data-bs-toggle="modal" data-bs-target="#modalRegistro">
				<img src="img/agregar-blanco.png" class="icon-ns" >Agregar Empleado
			</button>
		</div>
	</div>
	
	<div class="table-responsive mt-4">
		<table class="table table-striped display responsive nowrap" id="mydatatable"  style="width:100%">
	 		<thead>
		  		<tr>
						<th>Codigo</th>
						<th>DNI</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Teléfono</th>
						<th>Correo</th>
						<th>Dirección</th>
						<th>Tipo</th>
						<th>Usuario</th>
						<th>Clave</th>
						<th>Acciones</th>
		  		</tr>
			</thead>
			<tbody>
				<c:forEach var="empl" items="${pageScope.lista_empl}">
					<tr>
						<td>${empl.getCod_emp()}</td>
						<td>${empl.getDni_emp()}</td>
						<td>${empl.getNom_emp()}</td>
						<td>${empl.getApe_emp()}</td>
						<td>${empl.getTelf_emp()}</td>
						<td>${empl.getCorreo_emp()}</td>
						<td>${empl.getDire_emp()}</td>
						<td>${empl.getTipo_usu()}</td>
						<td>${empl.getNom_usu()}</td>
						<td>${empl.getPas_usu()}</td>
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
        <h5 class="modal-title" id="titleModalRegistro">Registrar/Modificar Empleado</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.servletContext.contextPath}/gestionEmpleado" role="form" method="post" class="d-flex flex-column gap-4" id="frmCliente">
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
	     			<div class="form-group">
	      			<label>Teléfono</label>
	      			<input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese el telefono">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Correo</label>
	      			<input type="text" class="form-control" id="correo" name="correo" placeholder="Ingrese el correo">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Direccion</label>
	      			<input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ingrese la direccion">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Tipo usuario</label>
	      			<input type="text" class="form-control" id="tipoUsuario" name="tipoUsuario" placeholder="Empleado, Admin o SuperAdmin">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Nombre usuario</label>
	      			<input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" placeholder="Ingrese el nombre de Usuario">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Clave</label>
	      			<input type="text" class="form-control" id="password" name="password" placeholder="Ingrese la clave">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label>Confirmar clave</label>
	      			<input type="text" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Ingrese la confirmación de clave">
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
        <form id="frmEliminarCliente" action="gestionEmpleado" method="post">
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
//Función de validación personalizada para el campo TipoUser
function validarTipo(value) {
    // Elimina espacios en blanco y guiones (si los hay)
    const tipoSinFormato = value.replace(/\s|-/g, '');

    // Comprueba si el Usuario es válido
    if ((tipoSinFormato === 'Empleado')||(tipoSinFormato === 'Admin')||(tipoSinFormato === 'SuperAdmin')) {
        return {
            valid: true,
            message: 'Tipo usuario válido'
        };
    } else {
        return {
            valid: false,
            message: 'El tipo de usuario debe ser igual a Empleado, Admin o SuperAdmin'
        };
    }
}
	$(document).ready(function(){
		
		// Aplicando validaciones
		$('#frmCliente').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		  },
		  fields:{
			  dni:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'DNI es obligatorio'
	  			  },
		  	      regexp: {
		  	           regexp: /^[0-9]{8}$/,
		  	           message: 'El DNI debe tener 8 dígitos'
		  	         }
				  }
			  },
			  nombre:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Nombre es obligatorio' 
	  			  },
				  stringLength:{
					  message:'El nombre completo debe tener entre 3 a 40 caracteres. ',
					  min:3,
					  max:40
				  },
				  regexp: {
	                  regexp: /^([-a-zA-ZÉÍÑÓÚÜáéíóúüñ\s])+$/,
	                  message: 'El nombre completo puede tener letras mayúsculas, minúsculas con y sin tilde; y espacio. '
	              }
				  }
			  },
			  apellido:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Apellido es obligatorio'
	  			  },
				  stringLength:{
					  message:'El apellido debe tener entre 3 a 40 caracteres. ',
					  min:3,
					  max:40
				  },
				  regexp: {
	                  regexp: /^([-a-zA-ZÉÍÑÓÚÜáéíóúüñ\s])+$/,
	                  message: 'El apellido puede tener letras mayúsculas, minúsculas con y sin tilde; y espacio. '
	              }
				  }
			  },
			  telefono:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Teléfono es obligatorio'
	  			  },
		  	        regexp: {
		  	             regexp: /^[0-9]{9}$/,
		  	             message: 'El teléfono debe tener 9 dígitos'
		  	         }
				  }
			  },
			  correo:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Correo es obligatorio'
	  			  },
				  stringLength:{
					  message:' ',
					  min:5,
					  max:40
				  },
                  emailAddress: {
                      message: 'Correo debe tener entre 5 a 40 caracteres y debe ser válido"'
                  }
				  }
			  },
			  direccion:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Dirección es obligatorio'
	  			  },
				  stringLength:{
					  message:'Dirección debe tener entre 5 a 40 caracteres. ',
					  min:5,
					  max:40
				  },
				  regexp: {
	                  regexp: /^([-a-zA-Z0-9ÉÍÑÓÚÜáéíóúüñ\s])+$/,
	                  message: 'Dirección acepta texto, números, eñes y tildes.'
	              }
				  }
			  },
			  tipoUsuario:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Tipo usuario es obligatorio'
	  			  },
	                // Agrega la validación personalizada
	                callback: {
	                    message: 'El tipo de usuario debe ser igual a Empleado, Admin o SuperAdmin',
	                    callback: validarTipo
	                }
				  }
			  },
			  nombreUsuario:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Nombre usuario es obligatorio'
	  			  },
				  stringLength:{
					  message:'El usuario debe tener entre 3 a 20 caracteres. ',
					  min:3,
					  max:20
				  },
				  regexp: {
	                  regexp: /^[a-zA-Z0-9_.-]+$/,
	                  message: 'El usuario debe aceptar alfabético, número, punto y guión bajo.'
	              }
				  }
			  },
			  password:{
				  validators:{
	  			  notEmpty:{
	  				  message: 'Clave es obligatorio'
	  			  },
	  			  identical: {
                      field: 'confirmPassword',
                      message: 'La clave y la confirmación no son iguales, sólo acepta alfabético, número, punto, guión bajo y 20 dígitos'
                  },
  				  regexp: {
	                  regexp: /^[a-zA-Z0-9_.-]+$/,
	                  message: ' '
	              },
				  stringLength:{
					  message:'La clave debe tener de 5 a 20 caracteres',
					  min:5,
					  max:20
				  }
				  }
			  },confirmPassword: {
	                validators: {
	                    notEmpty: {
	                    	message: 'Confirmar clave es obligatorio'
	                    },
	                    identical: {
	                        field: 'password',
	                        message: 'La clave y la confirmación no son iguales, sólo acepta alfabético, número, punto, guión bajo y 20 dígitos'
	                    },
	  				  regexp: {
		                  regexp: /^[a-zA-Z0-9_.-]+$/,
		                  message: ' '
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
		    { responsivePriority: 1, targets: 10 }
		  ]
		});
		
		$('.btnEditar').on('click', function(){
			const cod = $(this).parents("tr").find("td")[0].innerHTML;
			const dni = $(this).parents("tr").find("td")[1].innerHTML;
			const nombre = $(this).parents("tr").find("td")[2].innerHTML;
			const apellido = $(this).parents("tr").find("td")[3].innerHTML;
			const telef = $(this).parents("tr").find("td")[4].innerHTML;
			const correo = $(this).parents("tr").find("td")[5].innerHTML;
			const dire = $(this).parents("tr").find("td")[6].innerHTML;
			const tipo = $(this).parents("tr").find("td")[7].innerHTML;
			const nomUser = $(this).parents("tr").find("td")[8].innerHTML;
			const clave = $(this).parents("tr").find("td")[9].innerHTML;
			
			$('#codigo').val(cod);
			$('#dni').val(dni);
			$('#nombre').val(nombre);
			$('#apellido').val(apellido);
			$('#telefono').val(telef);
			$('#correo').val(correo);
			$('#direccion').val(dire);
			$('#tipoUsuario').val(tipo);
			$('#nombreUsuario').val(nomUser);
			$('#password').val(clave);
			$('#confirmPassword').val(clave);
			
			$('#btnActualizar').removeClass('d-none');
		  $('#btnGuardar').addClass('d-none');
		  
		  $('#titleModalRegistro').text('Modificar Empleado');
		});
		
		$('#btnAgregar').on('click', function(){
		  $('#btnGuardar').removeClass('d-none');
		  $('#btnActualizar').addClass('d-none');
		  
		  $('#titleModalRegistro').text('Registrar Empleado');
		});
		
		$('.btnEliminar').on('click', function(){
			const cod = $(this).parents("tr").find("td")[0].innerHTML;
			
			console.log(cod);
			
			$("#cod-eliminar").val(cod);
		});
		
		//PARA Q LUEGO DE EDITAR NO SE VEAN LOS CAMPOS DE AGREGAR AFECTADOS
		$('.btn-close').on('click', function(){
			$('#codigo').val("");
			$('#dni').val("");
			$('#nombre').val("");
			$('#apellido').val("");
			$('#telefono').val("");
			$('#correo').val("");
			$('#direccion').val("");
			$('#tipoUsuario').val("");
			$('#nombreUsuario').val("");
			$('#password').val("");
			$('#confirmPassword').val("");
		});
		
		$('.btn-info').on('click', function(){
			$('#codigo').val("");
			$('#dni').val("");
			$('#nombre').val("");
			$('#apellido').val("");
			$('#telefono').val("");
			$('#correo').val("");
			$('#direccion').val("");
			$('#tipoUsuario').val("");
			$('#nombreUsuario').val("");
			$('#password').val("");
			$('#confirmPassword').val("");
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
