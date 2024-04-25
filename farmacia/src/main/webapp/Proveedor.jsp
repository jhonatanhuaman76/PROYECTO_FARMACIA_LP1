<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Proveedor</title>
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
            <div id="modalRegistro" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Registrar/Modificar Proveedor</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="frmCliente">
                                <div class="mb-3">
                                    <label for="codigo" class="form-label">Codigo</label>
                                    <input type="text" class="form-control" id="codigo" name="codigo" readonly value="0">
                                </div>
                                <div class="mb-3">
                                    <label for="dni" class="form-label">RUC</label>
                                    <input type="text" class="form-control" id="ruc" name="ruc" placeholder="Ingrese RUC">
                                </div>
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese nombre">
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Teléfono</label>
                                    <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese telefono">
                                </div>
                                  <div class="mb-3">
                                    <label for="nombre" class="form-label">Dirección</label>
                                    <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ingrese Dirección">
                                </div>
                                  <div class="mb-3">
                                    <label for="nombre" class="form-label">correo</label>
                                    <input type="text" class="form-control" id="correo_pro" name="correo_pro" placeholder="Ingrese correo">
                                </div>
                                  <div class="mb-3">
                                    <label for="nombre" class="form-label">Web</label>
                                    <input type="text" class="form-control" id="web" name="web" placeholder="Ingrese web">
                                </div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="button" class="btn btn-secondary btn-lg">Guardar</button>
                                </div>
                            </form>
                        </div>
                    </div>
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
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">RUC</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Nombre</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Telefono</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Direccion</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Correo</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Web</th> 
                        <th scope="col" style="background-color: #AFAFAF;" class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- se agregan los detalles desde la base de datos -->
                    <tr>
                        <td class="text-center">XXXXXX </td>
                        <td class="text-center">XXXXXXXXXX </td>
                        <td class="text-center">XXXXXXXXX </td>
                        <td class="text-center">XXXXXXXXXX </td>
                          <td class="text-center">XXXXXXXXXX </td>
                            <td class="text-center">XXXXXXXXXXXX </td>
                              <td class="text-center">XXXXXXXX </td>
                        <td class="text-center"> 
                            <div class="d-flex justify-content-center">
                                <button type="button" class="btn btn-icon btn-light mr-5 p-0">
                                    <img src="img/editar.png" alt="Editar" class="img-fluid" style="max-height: 30px;">
                                </button>
                                <button type="button" class="btn btn-icon btn-light p-0">
                                    <img src="img/eliminar.png" alt="Eliminar" class="img-fluid" style="max-height: 30px;">
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">XXXXXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXXX</td>
                        <td class="text-center"> 
                            <div class="d-flex justify-content-center">
                                <button type="button" class="btn btn-icon btn-light mr-5 p-0">
                                    <img src="img/editar.png" alt="Editar" class="img-fluid" style="max-height: 30px;">
                                </button>
                                <button type="button" class="btn btn-icon btn-light p-0">
                                    <img src="img/eliminar.png" alt="Eliminar" class="img-fluid" style="max-height: 30px;">
                                </button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
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