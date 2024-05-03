<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Empleado</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mt-4 ">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control w-75" placeholder="Escriba aqui" aria-label="Input" aria-describedby="basic-addon2">
                        <span class="input-group-text">
                            <img src="img/lupa.png" alt="Imagen" style="max-height: 30px;">
                        </span>
                    </div>
                </div>
                <div class="col d-flex justify-content-end mb-3"> 
                    <button id="mostrarFormulario" type="button" class="btn btn-secondary btn-lg" style="margin-right: 90px;">Agregar</button>
                </div>
            </div>
            
            
        </div>
 

<div class="container mt-4 mb-4">
    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Código</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">DNI</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Nombre</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Apellido</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Telefono</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Correo</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Dirección</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Tipo de Usuario</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Nombre de Usuario</th>
                        <th scope="col" style="background-color: #AFAFAF;" class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- se agregan los detalles desde la base de datos -->
                    <c:forEach var="datos" items="${lista_empleados}">
	                    <tr>
	                        <td class="text-center">${datos.getCod_emp()}</td>
	                        <td class="text-center">${datos.getDni_emp()}</td>
	                        <td class="text-center">${datos.getNom_emp()}</td>
	                        <td class="text-center">${datos.getApe_emp()}</td>
	                        <td class="text-center">${datos.getTelf_emp()}</td>
	                        <td class="text-center">${datos.getCorreo_emp()}</td>
	                        <td class="text-center">${datos.getDire_emp()}</td>
	                        <td class="text-center">${datos.getTipo_usu()}</td>
	                        <td class="text-center">${datos.getNom_usu()}</td>
	                        <td class="text-center"> 
	                            <div class="d-flex justify-content-center">
	                                <button type="submit" class="btn btn-icon btn-light mr-5 p-0" id="mostrarFormulario2">
	                                    <img src="img/editar.png" alt="Editar" class="img-fluid" style="max-height: 30px;">                                
	                                    <%--href="gestionEmpleado?accion=Editar&id=${datos.getCod_emp()}"--%>
	                                </button>
	                                <button type="button" class="btn btn-icon btn-light p-0">
	                                    <img src="img/eliminar.png" alt="Eliminar" class="img-fluid" style="max-height: 30px;">
	                                </button>
	                            </div>
	                        </td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
   </div>
</div>

<div id="modalRegistro" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Registrar/Modificar Empleado</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="frmCliente" action="gestionEmpleado" method="post">
                                <div class="mb-3">
                                    <label for="codigo" class="form-label">Codigo</label>
                                    <input type="text" value="${miEmpleado.getCod_emp()}" class="form-control" id="codigo" name="codigo" readonly value="0">
                                </div>
                                    <div class="mb-3">
                                    <label for="dni" class="form-label">DNI</label>
                                    <input type="text" value="${miEmpleado.getDni_emp()}" class="form-control" id="dni" name="txtDNI" placeholder="Ingrese DNI">
                                </div>
                                <div class="mb-3">
                                    <label for="dni" class="form-label">Nombre</label>
                                    <input type="text" value="${miEmpleado.getNom_emp()}" class="form-control" id="Nombre" name="txtNombre" placeholder="Ingrese nombre">
                                </div>
                                    <div class="mb-3">
                                    <label for="dni" class="form-label">Apellido</label>
                                    <input type="text" value="${miEmpleado.getApe_emp()}" class="form-control" id="Apellido" name="txtApellido" placeholder="Ingrese Apellido">
                                </div>
                                    <div class="mb-3">
                                    <label for="dni" class="form-label">Teléfono</label>
                                    <input type="text" value="${miEmpleado.getTelf_emp()}" class="form-control" id="telefono" name="txtTelef" placeholder="Ingrese telefono">
                                </div>
                                    <div class="mb-3">
                                    <label for="dni" class="form-label">Correo</label>
                                    <input type="text" value="${miEmpleado.getCorreo_emp()}" class="form-control" id="correo" name="txtCorreo" placeholder="Ingrese correo">
                                </div>
                                    <div class="mb-3">
                                    <label for="dni" class="form-label">Direccion</label>
                                    <input type="text" value="${miEmpleado.getDire_emp()}" class="form-control" id="dire" name="txtDireccion" placeholder="Ingrese direccion">
                                </div>
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Tipo de ususario</label>
                                    <select class="form-select" aria-label="Default select example" name="txtTipo">
										  <option selected>Seleccionar</option>
										  <option value="">V</option>
										  <option value="">A</option>
										  <option value="">S</option>
									</select>
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Nombre de usuario</label>
                                    <input type="text" value="${miEmpleado.getNom_usu()}" class="form-control" id="NombreUsuario" name="txtUser" placeholder="Ingrese el usuario">
                                </div>
                                 <div class="mb-3">
                                    <label for="apellido" class="form-label">Contraseña Usuario</label>
                                    <input type="text"  value="${miEmpleado.getPas_usu()}" class="form-control" id="contrasenia" name="txtPassword" placeholder="Ingrese la contraseña">
                                </div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="submit" class="btn btn-secondary btn-lg" name="accion" value="Agregar" id="btnGuardarEditar">Guardar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    document.getElementById('mostrarFormulario').addEventListener('click', function() {
        var modal = new bootstrap.Modal(document.getElementById('modalRegistro'), {
            backdrop: 'static'
        });
        modal.show();
    });
</script>

</body>
</html>
