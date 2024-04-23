<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro de facturas</title>
<!-- LINK CSS BOOTSTRAP -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Estilos del reporteFacturas -->
<link rel="stylesheet" href="css/reporteFacturas.css">

</head>
<body>

	<header></header>
	
	<main>
		<nav class="navbar bg-body-tertiary">
		  <div class="container-fluid">
		  	<div>
			  	<a class="navbar-brand">REGISTRO DE FACTURAS</a>
			  	<button type="button" class="btn btn-outline-primary">Nueva Factura</button>
		  	</div>
		    <form class="d-flex" role="search">
		      <input class="form-control me-2" type="search" placeholder="Buscar código de factura" aria-label="Search" size="25">
		      <button class="btn btn-outline-success" type="submit">Buscar</button>
		    </form>
		  </div>
		</nav>
	
	
	<div class="centrar_tabla">
		<table class="table table-hover">
		  <thead class="table-dark">
		    <tr>
		      <th scope="col" class="text-center">Nro. Factura</th>
		      <th scope="col" class="text-center">Cod Proveedor</th>
		      <th scope="col" class="text-center">Cod Empleado</th>
		      <th scope="col" class="text-center">Fecha Emisión</th>
		      <th scope="col" class="text-center">Método Pago</th>
		      <th scope="col" class="text-center">Importe Total</th>
		      <th scope="col" class="text-center">Acciones</th>
		    </tr>
		  </thead>
		  <tbody class="table-group-divider">
		    <tr>
		      <th scope="row" class="text-center">1</th>
		      <td class="text-center">001</td>
		      <td class="text-center">001</td>
		      <td class="text-center">10-10-2022</td>
		      <td class="text-center">Factura</td>
		      <td class="text-center">5000</td>
		      <td class="text-center">
		      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar</button>
      			<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row" class="text-center">2</th>
		      <td class="text-center">002</td>
		      <td class="text-center">002</td>
		      <td class="text-center">10-12-2023</td>
		      <td class="text-center">Factura</td>
		      <td class="text-center">6000</td>
		      <td class="text-center">
		      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar</button>
      			<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row" class="text-center">3</th>
		      <td class="text-center">003</td>
		      <td class="text-center">003</td>
		      <td class="text-center">10-10-2024</td>
		      <td class="text-center">Factura</td>
		      <td class="text-center">7000</td>
		      <td class="text-center">
		      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar</button>
      			<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button>
		      </td>
		    </tr>
		  </tbody>
		</table>
	</div>
	
	<!-- MODAL PARA ELIMINAR-->
	<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar registro</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        ¿Deseas eliminar el registro seleccinado?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
	        <button type="button" class="btn btn-danger">Eliminar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<!-- MODAL PARA EDITAR-->
	<div class="modal fade" id="modalEditar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar registro</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Código Proveedor:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Código Empleado:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Fecha Emisión:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Método Pago:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Importe Total:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
	        <button type="button" class="btn btn-primary">Guardar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	</main>
	
	<footer></footer>
	

<!-- LINK JS BOOTSTRAP -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>