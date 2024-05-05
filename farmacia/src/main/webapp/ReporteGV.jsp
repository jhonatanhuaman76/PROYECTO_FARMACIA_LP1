
<%@page import="com.farmacia.dao.EmpleadoDAO"%>
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

<title>Repote General de Productos | Farma Plus</title>
</head>
<body>
	<c:set var="lista_emp" value="<%= new EmpleadoDAO().reporteGeneralEmpleado() %>" />
	
	<div class="container">
		<%@ include file="componentes/menu.jsp" %>
		<div class="row mt-4">
			<div class="col-md-9">
				<h1>Reporte General de Empleados</h1>				
			</div>
		</div>
		<div class="table-responsive mt-4">
		<table class="table table-striped display responsive nowrap" id="mydatatable" style="width:100%">
	 		<thead>
		  		<tr>
						<th >Codigo</th>
						<th>DNI</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>telf</th>
						<th>Nro ventas</th>
		  		</tr>
			</thead>
			<tbody>
				<c:forEach var="emp" items="${pageScope.lista_emp}">
					<tr>
						<td>${emp.getCod_emp()}</td>
						<td>${emp.getDni_emp()}</td>
						<td>${emp.getNom_emp()}</td>
						<td>${emp.getApe_emp()}</td>
						<td>${emp.getTelf_emp()}</td>
						<td>${emp.getTotal_ventas()}</td>
					</tr>
				</c:forEach>
			</tbody>
	 	</table>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			const TABLE_CONFIG = {
					language: {
						url: '//cdn.datatables.net/plug-ins/2.0.3/i18n/es-ES.json',
					},
					responsive: true,
					columnDefs: [
					    { responsivePriority: 1, targets: 5 }
					]
			}
			
			let table = $('#mydatatable').DataTable(TABLE_CONFIG);
		});
	</script>
</body>
</html>