<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Producto</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    /* Estilo para centrar la tabla */
    .table-container {
        overflow-x: auto; /* Agrega scroll horizontal si el contenido es demasiado ancho */
    }
    /* Estilo para ajustar el ancho de las columnas */
    .table th, .table td {
        width: 10%; /* Cambia el valor según sea necesario */
    }
       .container {
        max-width: 90%; /* Cambia el valor según sea necesario */
    }
</style>
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
                            <h5 class="modal-title">Registrar/Modificar Producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="frmCliente">
                                <div class="mb-3">
                                    <label for="codigo" class="form-label">Codigo</label>
                                    <input type="text" class="form-control" id="codigo" name="txtcodigo" readonly value="0">
                                </div>
                                <div class="mb-3">
                                    <label for="dni" class="form-label">Numero de Categoria</label>
                                    <input type="text" class="form-control" id="cat" name="txtcategoria" readonly value="0">
                                </div>
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Producto </label>
                                    <input type="text" class="form-control" id="pro" name="txtpro" placeholder="Ingrese producto">
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Precio unitario de compra</label>
                                    <input type="text" class="form-control" id="PUC" name="txtPUC" placeholder="Ingrese Precio unitario de compra">
                                </div>
                                  <div class="mb-3">
                                    <label for="nombre" class="form-label">Precio unitario de venta</label>
                                    <input type="text" class="form-control" id="PUV" name="txtPUV" placeholder="Ingrese Precio unitario de venta">
                                </div>
                                  <div class="mb-3">
                                    <label for="nombre" class="form-label">Stock Mínimo</label>
                                    <input type="text" class="form-control" id="SM" name="txtSMin" placeholder="Ingrese Stock mínimo">
                                </div>
                                  <div class="mb-3">
                                    <label for="nombre" class="form-label">Stock Máximo</label>
                                    <input type="text" class="form-control" id="SM" name="txtSMax" placeholder="Ingrese Stock Máximo">
                                </div>
                                   <div class="mb-3">
                                    <label for="codigo" class="form-label">Codigo Marca</label>
                                    <input type="text" class="form-control" id="codigoM" name="txtcodigoM" readonly value="0">
                                </div>
              					<div class="mb-3">
                                    <label for="nombre" class="form-label">Presentación</label>
                                    <input type="text" class="form-control" id="presentacion" name="txtpresentacion" placeholder="Ingrese presentación">
                                </div>
                              	<div class="mb-3">
                                    <label for="nombre" class="form-label">M_Controlado</label>
                                    <input type="text" class="form-control" id="MC" name="txtMC" placeholder="Ingrese Controlado">
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
 

<div class="container mt-4 mb-4 d-flex justify-content-center align-items-center">
    <div class="card">
        <div class="card-body">
          <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Código</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Numero de Categoria</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Productos</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Precio Unitario de compra</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Precio unitario de venta</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Stock Mínimo</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Stock Máximo</th> 
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Codigo de Marca </th> 
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">Presentación</th> 
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black; width: 10%;" class="text-center">M_controlado</th> 
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
                              <td class="text-center">XXXXXXXXXXXX</td>
                              <td class="text-center">XXXXXXXXXXXX</td>
                              <td class="text-center">XXXXXXXXXXXX</td>
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
                        <td class="text-center">XXXXXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXXXXX</td>
                        <td class="text-center">XXXXXXXXXXXX</td>
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