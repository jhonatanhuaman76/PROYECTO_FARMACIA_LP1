<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<title>Punto de venta | FarmaPlus</title>
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
</style>
</head>
<body>
	<div class="container">
		<%@ include file="componentes/menu.jsp" %>
		<form class="mt-4" action="#" role="form" method="post">
			<h1>Punto de Venta FarmaPlus</h1>
	    <div class="mt-4">
	      <label for="txtCliente" class="form-label">Cliente</label><button type="button" class="btn text-primary fw-bold border-0" data-bs-toggle="button">[+ Nuevo]</button>
	      <select class="selectpicker w-100" name="cliente" data-placeholder="Elije un cliente" data-live-search="true" id="txtCliente">
				  <option value="1">Angel Huaman</option>
				  <option value="2">Emilio Cabrera</option>
				  <option value="3">Sebastian Bernales</option>
				  <option value="4">Gerad Guardales</option>
				</select>
	    </div>
	    <div class="mt-4">
	      <label for="txtProducto" class="form-label">Producto</label>
	      <select class="selectpicker w-100" name="producto" data-placeholder="Elije un producto" data-live-search="true" id="txtProducto">
				  <option value="1">Amoxicilina</option>
				  <option value="2">Paracetamol</option>
				  <option value="3">Ibuprofeno</option>
				  <option value="5">Naproxeno</option>
				  <option value="6">Naproxeno</option>
				  <option value="7">Naproxeno</option>
				  <option value="8">Naproxeno</option>
				  <option value="9">Naproxeno</option>
				  <option value="10">Naproxeno</option>
				  <option value="11">Naproxeno</option>
				  <option value="12">Naproxeno</option>
				  <option value="13">Naproxeno</option>
				  <option value="14">Naproxeno</option>
				</select>
	    </div>
	    <div class="mt-4 row g-3">
	    	<div class="col-md">
			    <label for="txtCantidad" class="form-label">Cantidad</label>
			    <input type="number" class="form-control" id="txtCantidad">
			  </div>
			  <div class="col-md">
			    <label for="txtPrecio" class="form-label">Precio</label>
			    <input type="number" class="form-control" id="txtPrecio">
			  </div>
			  <div class="col-md">
			    <label for="txtStock" class="form-label">Stock</label>
			    <input type="number" class="form-control" id="txtStock">
			  </div>
			  <div class="col-md d-flex align-items-end">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary">
					  + Agregar producto
					</button>
			  </div>
	    </div>
	    <div class="table-responsive mt-4 outer">
	    	<table class="table table-striped display responsive nowrap" id="mydatatable">
	    		<thead>
		    		<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Unidades</th>
							<th>Cantidad</th>
							<th>Precio</th>
							<th>Importe</th>
							<th>Acciones</th>	    		
		    		</tr>
					</thead>
					<tbody style="height:200px;overflow:auto">
						<tr>
							<td class="codigo">1</td>
							<td class="nombre">Amoxicilina</td>
							<td class="unidades">UND</td>
							<td class="cantidad" style="width:150px">
								<input type="number" class="form-control" value=10 disabled>
							</td>
							<td class="precio">1.5</td>
							<td class="importe">15</td>
							<td class="">
								<button type="button" class="btn btn-dark btnEditar">Editar</button>
								<button type="button" class="btn btn-danger btnEliminar">Eliminar</button>
							</td>
						</tr>
						<tr>
							<td class="codigo">1</td>
							<td class="nombre">Amoxicilina</td>
							<td class="unidades">UND</td>
							<td class="cantidad" style="width:150px">
								<input type="number" class="form-control" value=10 disabled>
							</td>
							<td class="precio">1.5</td>
							<td class="importe">15</td>
							<td class="">
								<button type="button" class="btn btn-dark btnEditar">Editar</button>
								<button type="button" class="btn btn-danger btnEliminar">Eliminar</button>
							</td>
						</tr>
						<tr>
							<td class="codigo">1</td>
							<td class="nombre">Amoxicilina</td>
							<td class="unidades">UND</td>
							<td class="cantidad" style="width:150px">
								<input type="number" class="form-control" value=10 disabled>
							</td>
							<td class="precio">1.5</td>
							<td class="importe">15</td>
							<td class="">
								<button type="button" class="btn btn-dark btnEditar">Editar</button>
								<button type="button" class="btn btn-danger btnEliminar">Eliminar</button>
							</td>
						</tr>
						<tr>
							<td class="codigo">1</td>
							<td class="nombre">Amoxicilina</td>
							<td class="unidades">UND</td>
							<td class="cantidad" style="width:150px">
								<input type="number" class="form-control" value=10 disabled>
							</td>
							<td class="precio">1.5</td>
							<td class="importe">15</td>
							<td class="">
								<button type="button" class="btn btn-dark btnEditar">Editar</button>
								<button type="button" class="btn btn-danger btnEliminar">Eliminar</button>
							</td>
						</tr>
						<tr>
							<td class="codigo">1</td>
							<td class="nombre">Amoxicilina</td>
							<td class="unidades">UND</td>
							<td class="cantidad" style="width:150px">
								<input type="number" class="form-control" value=10 disabled>
							</td>
							<td class="precio">1.5</td>
							<td class="importe">15</td>
							<td class="">
								<button type="button" class="btn btn-dark btnEditar">Editar</button>
								<button type="button" class="btn btn-danger btnEliminar">Eliminar</button>
							</td>
						</tr>
						<tr>
							<td class="codigo">2</td>
							<td class="nombre">Amoxicilina</td>
							<td class="unidades">UND</td>
							<td class="cantidad" style="width:150px">
								<input type="number" class="form-control" value=10 disabled>
							</td>
							<td class="precio">1.5</td>
							<td class="importe">15</td>
							<td class="">
								<button type="button" class="btn btn-dark btnEditar">Editar</button>
								<button type="button" class="btn btn-danger btnEliminar">Eliminar</button>
							</td>
						</tr>
						
					</tbody>
	    	</table>
	    </div>
	    <div class="mt-4 d-md-flex flex-column align-items-md-end gap-2">
	    	<div class="">
			    <label for="txtxSubtotal" class="form-label">txtxSubtotal</label>
			    <input type="number" class="form-control" id="txtStock" disabled>
			  </div>
			  <div class="">
			    <label for="txtIgv" class="form-label">Importe IGV</label>
			    <input type="number" class="form-control" id="txtIgv" disabled>
			  </div>
			  <div class="">
			    <label for="txtTotal" class="form-label">Importe Total</label>
			    <input type="number" class="form-control" id="txtTotal" disabled>
			  </div>
	    </div>
	    <div class="my-4 d-md-flex justify-content-md-end gap-2">
			  <button type="submit" class="btn btn-outline-secondary">Limpiar</button>
			  <button type="submit" class="btn btn-outline-dark">Imprimir</button>
			  <button type="submit" class="btn btn-success">Vender</button>
	    </div>
		</form>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		// Activar Bootstrap Select
		$('.selectpicker').selectpicker();
		$('.selectpicker').on('change', function(e){
			console.log(e.target.value);
		});
		
		// Modificar cantidad al hacer clic en el botón editar
    $('#mydatatable').on('click', '.btnEditar', function() {
        const cantidadInput = $(this).closest('tr').find('.cantidad input');
        cantidadInput.prop('disabled', false).focus();

      // Actualizar el importe al modificar la cantidad
        cantidadInput.on('input', function() {
            let cantidad = $(this).val();
            let precio = $(this).closest('tr').find('.precio').text();

            let importe = cantidad * parseFloat(precio);
            
            $(this).closest('tr').find('.importe').text(importe.toFixed(2));
        });

     		// Volver a desactivar campo cantidad al dar 'enter'
        cantidadInput.keydown(function(e){
            if(e.keyCode === 13){
                $(this).blur();
            }
        });
     		
      	// Volver a desactivar campo cantidad al perder foco
        cantidadInput.blur(function(){
            $(this).prop('disabled', true);
        });
    });

    // Eliminar registro del detalle
    $('#mydatatable').on('click', '.btnEliminar', function() {
        $(this).closest('tr').remove();
    })
	});
	</script>
</body>
</html>