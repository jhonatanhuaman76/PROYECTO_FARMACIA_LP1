<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- LINK DE DICEÑOS BOOTSTRAP -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- LINK DE JAVASCRIPT BOOTSTRAP -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	
<!-- libreria para validar -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.1/js/bootstrapValidator.min.js"></script>
						
						
						<title>LOGIN FARMA PLUS</title>
						
						
						
</head>
<body>

	<section class="background-radial-gradient overflow-hidden w-auto p-3">
  
 
  <style>
    .background-radial-gradient {
      background-color: hsl(218, 41%, 15%);
      background-image: radial-gradient(650px circle at 0% 0%,
          hsl(218, 41%, 35%) 15%,
          hsl(218, 41%, 30%) 35%,
          hsl(218, 41%, 20%) 75%,
          hsl(218, 41%, 19%) 80%,
          transparent 100%),
        radial-gradient(1250px circle at 100% 100%,
          hsl(218, 41%, 45%) 15%,
          hsl(218, 41%, 30%) 35%,
          hsl(218, 41%, 20%) 75%,
          hsl(218, 41%, 19%) 80%,
          transparent 100%);
          
    }

    #radius-shape-1 {
      height: 220px;
      width: 220px;
      top: -60px;
      left: -130px;
      background: radial-gradient(#44006b, #ad1fff);
      overflow: hidden;
    }

    #radius-shape-2 {
      border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
      bottom: -60px;
      right: -110px;
      width: 300px;
      height: 300px;
      background: radial-gradient(#44006b, #ad1fff);
      overflow: hidden;
    }

    .bg-glass {
      background-color: hsla(0, 0%, 100%, 0.4) !important;
      backdrop-filter: saturate(200%) blur(25px);
    }
    
.button_slide {
    color: #A569BD;
    border: 2px solid rgb(7253, 254, 254 );
    border-radius: 20px;
    padding: 10px 25px;
    display: inline-block;
    font-family: "Lucida Console", Monaco, monospace;
    font-size: 14px;
    letter-spacing: 1px;
    cursor: pointer;
    background-color: transparent; /* Relleno transparente */
    box-shadow: inset 0 0 0 0 #D80286;
    transition: ease-out 0.4s;
}

.button_slide:hover {
    box-shadow: inset 400px 0 0 0 #007bff; /* Cambio de color a azul */
    
    
}
  </style>
  

  <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
    <div class="row gx-lg-5 align-items-center mb-5">
      <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
        <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
          FARMA PLUS<br />
          <span style="color: hsl(218, 81%, 75%)">Siempre contigo</span>
        </h1>
        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
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
            <form></form>
              <!-- 2 column grid layout with text inputs for the first and last names -->
         		<div>
         		<center><h1>Iniciar Sesión</h1></center>
         		<br>
         		</div>
              <!-- Email input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="email" id="form3Example3" class="form-control" id="id_email" name="email" placeholder="Ingrese correo"/>
                <label class="form-label" for="form3Example3"style="color: white;">Email</label>
              </div>

              <!-- Password input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="password" id="form3Example4" class="form-control" id="id_contraseña" name="contraseña" placeholder="Ingrese contraseña"/>
                <label class="form-label" for="form3Example4"style="color: white;">Contraseña</label>
              </div>

              <!-- Checkbox -->
              
      


              <!-- Submit button -->
              <center>               
              <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-4">
               	Ingresar
              </button>
              <br>
              
			</center>
			 <br>
			  <br>
             <button type="button" class="button_slide slide_right"style="color: white;"box-shadow: inset 400px 0 0 0 #D80286;" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		     Regístrese aquí 
		     </button>
				
   
			</section>
			
			
			</form>
            
		
		<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				 <div class="modal-dialog">
				    <div class="modal-content bg-glass">

		        <div class="modal-header">
		       <h5 class="modal-title fst-italic" id="staticBackdropLabel" style="color: white;">FARMA PLUS</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		   
		      <div class="modal-body">
		      <form>
            
            <div>
         		<h3>Registre su datos</h3>
         	</div>
            
              <!-- 2 column grid layout with text inputs for the first and last names -->
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div data-mdb-input-init class="form-outline">
                    <input type="text" id="form3Example1" class="form-control" />
                    <label class="form-label" for="form3Example1" style="color: white;">Nombre</label>
                  </div>
                </div>
                <div class="col-md-6 mb-4">
                  <div data-mdb-input-init class="form-outline">
                    <input type="text" id="form3Example2" class="form-control" />
                    <label class="form-label" for="form3Example2"style="color: white;">Apellidos</label>
                  </div>
                </div>
              </div>

              <!-- Email input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="email" id="form3Example3" class="form-control" />
                <label class="form-label" for="form3Example3"style="color: white;">Email</label>
              </div>

              <!-- Password input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="password" id="form3Example4" class="form-control" />
                <label class="form-label" for="form3Example4"style="color: white;">Contraseña</label>
              </div>

          

              <!-- Submit button -->
          

            </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
		        <button type="button" class="btn btn-primary">Registrar</button>
		      </div>
			  </div>
			  </div>
			  </div>
		              
              </div>

            
            
           </div>
	       </div>
		   </div>
		   </div>
		   </div>
			
			
			
			<!-- Section: Design Block -->
			<center>
			  
			   </center>  



<!-- LAS VALIDACIONES ESTAN MAL TENEMOS QUE CAMBIAR LOS ID DE LOS CAMPOS DE TEXTO  -->

<script  type="text/javascript">
    $(document).ready(function() {
    $('#frmEmpleado').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
  //Validando los campos
	fields:{
		email:{
			validators:{
				noEmpty:{
					massage:'Email es obligatorio'
				},
				emailAddress:{
					message:'El formato es incorrecto'
				}
			}
		},
		contraseña:{
			validators:{
				noEmpty:{
					messege:'La contraseña es obligatorio'
				},
				contraseñaAnddress:{
					message:'La contraseña debe ser más grande'
				}
			}
		}
		//siguiente campo
	}

  );
    
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    
    }//bootstrapValidator
    }//function()

</script>




</body>
</html>






