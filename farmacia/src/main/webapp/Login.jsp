<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Estilos del login -->
<link rel="stylesheet" href="css/login.css">

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

<!-- Librería moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<title>Login FarmaPlus</title>	
<link rel="icon" type="image/x-icon" href="img/logo-icon.ico">		
</head>
<body>

<section class="background-radial-gradient overflow-hidden w-auto p-3 min-vh-100 d-flex align-items-center">
  <div class="container px-4 px-md-5 text-center text-lg-start w-100">
    <div class="d-flex row gx-lg-5 align-items-center">
      <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
        <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
          FARMA PLUS<br/>
          <span style="color: hsl(218, 81%, 75%)">Siempre contigo</span>
        </h1>
        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%); text-align: justify">
          El personal de Farma Plus está comprometido a ofrecer una atención de calidad,
          trabajando de la mano con laboratorios de prestigio, ya que tienen claros sus 
          principios éticos y valores, con el objetivo de proporcionar una alta calidad de fármacos 
          a nuestros clientes.
        </p>
      </div>
      
      <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
        <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
        <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

        <div class="card bg-glass">
          <div class="card-body px-4 py-5 px-md-5">
            <form id="frmUsuario" role="form" action="gestionAcceso" method="post">
              <!-- 2 column grid layout with text inputs for the first and last names -->
         		<div style="text-align: center; margin-bottom: 30px">
         		<h1 style="margin-bottom: 20px;color: white">INICIAR SESIÓN</h1>
         		<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="white" class="bi bi-person-circle" viewBox="0 0 16 16">
  					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
  					<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
				</svg>
         		</div>
	              <div data-mdb-input-init class="form-outline mb-4">
	                <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" placeholder="Ingrese el nombre de usuario"/>
	                <label class="form-label" style="color: white;">Usuario</label>
	              </div>
	              <div data-mdb-input-init class="form-outline mb-4">
	                <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Ingrese contraseña"/>
	                <label class="form-label" style="color: white;">Contraseña</label>
	              </div>

	             <div style="display: flex; flex-direction: column; align-items: center;">
	             <button type="submit" class="button_slide slide_right" style="margin-bottom:20px; color: white;" name="accion" value="Ingresar">
			     	Ingresar 
			     </button>
	             
			     <a href="#" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover" data-bs-toggle="modal" data-bs-target="#modalDatos">¿Olvidé mi contraseña?</a>
	             </div>
                          
		    </form>
		    
		   </div>
		   </div>
		   </div>
		</div>
	</div>
</section>
            
		
<!-- Modal -->
<div class="modal fade" id="modalDatos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content bg-glass">
      <div class="modal-header">
        <h3 class="modal-title" style="color: white">FARMA PLUS - ENVIAR DATOS</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="gestionAcceso" method="post" role="form" class="d-flex flex-column gap-4" id="frmEmpleado"><!-- action="XXXXXXXXXXXX" method="XXXX"  -->
        	<div class="row">
	        	<div class="form-group">
	      			<label style="color: white">NOMBRES</label>
	      			<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese los nombres completos">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label style="color: white">APELLIDOS</label>
	      			<input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingrese los apellidos completos">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label style="color: white">CORREO</label>
	      			<input type="text" class="form-control" id="correo" name="correo" placeholder="Ingrese el correo">
	     			</div>
        	</div>
        	<div class="row">
	     			<div class="form-group">
	      			<label style="color: white">NOMBRE USUSARIO</label>
	      			<input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" placeholder="Ingrese el nombre de Usuario">
	     			</div>
        	</div>
        	<div class="row">
	        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	             <button type="submit" name="accion" value="Recuperar" class="btn btn-primary" id="btnGuardar">Enviar</button> <!--type="submit" name="accion" value="XXXXXX"  onclick="enviarDatos()" -->
	             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
	         	</div>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- LAS VALIDACIONES ESTAN MAL TENEMOS QUE CAMBIAR LOS ID DE LOS CAMPOS DE TEXTO  -->

<script type="text/javascript">
	$(document).ready(function(){
		
		// Aplicando validaciones
		$('#frmEmpleado').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		  },
		  fields:{
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
			  }
	    }
		});
		
		//PARA Q LUEGO DE EDITAR NO SE VEAN LOS CAMPOS DE AGREGAR AFECTADOS
		$('.btn-close').on('click', function(){
			$('#nombre').val("");
			$('#apellido').val("");
			$('#correo').val("");
			$('#nombreUsuario').val("");
		});
		
		$('.btn-secondary').on('click', function(){
			$('#nombre').val("");
			$('#apellido').val("");
			$('#correo').val("");
			$('#nombreUsuario').val("");
		});
	});
	
	

	//función sweetAlert
	document.getElementById('frmEmpleado').addEventListener('submit', function(event) {
    	event.preventDefault(); // Evitar que el formulario se envíe automáticamente

    // Realizar cualquier validación del formulario aquí si es necesario
		let titleClav = "<%=request.getSession().getAttribute("title1")%>";
	    let textClav = "<%=request.getSession().getAttribute("text1")%>";
	    let iconText = "<%=request.getSession().getAttribute("icon1")%>";

	        if (titleClav && textClav && iconText) {
	            Swal.fire({
	                title: titleClav,
	                text: textClav,
	                icon: iconText
             })/*.then(() => {
	                window.location.reload();
	            });*/
	        } else {
	            // Manejar el caso en el que no hay valores para titleClav, textClav o iconText
         }
});
	
	<%--function enviarDatos(){
	       let titleClav = "<%=request.getSession().getAttribute("title1")%>";
	        let textClav = "<%=request.getSession().getAttribute("text1")%>";
	        let iconText = "<%=request.getSession().getAttribute("icon1")%>";

	        if (titleClav && textClav && iconText) {
	            Swal.fire({
	                title: titleClav,
	                text: textClav,
	                icon: iconText
             }).then(() => {
	                window.location.reload(); // Recargar la página
	            });
	        } else {
	            // Manejar el caso en el que no hay valores para titleClav, textClav o iconText
         }
	}--%>
	
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






