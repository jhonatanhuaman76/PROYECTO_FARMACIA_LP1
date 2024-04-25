<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cliente</title>
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
                            <h5 class="modal-title">Registrar/Modificar Cliente</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="frmCliente">
                                <div class="mb-3">
                                    <label for="codigo" class="form-label">Codigo</label>
                                    <input type="text" class="form-control" id="codigo" name="codigo" readonly value="0">
                                </div>
                                <div class="mb-3">
                                    <label for="dni" class="form-label">DNI</label>
                                    <input type="text" class="form-control" id="dni" name="dni" placeholder="Ingrese el DNI">
                                </div>
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre">
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Apellido</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingrese el apellido">
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
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">DNI</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Nombre</th>
                        <th scope="col" style="background-color: #AFAFAF; border-right: 1px solid black;" class="text-center">Apellido</th>
                        <th scope="col" style="background-color: #AFAFAF;" class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- se agregan los detalles desde la base de datos -->
                    <tr>
                        <td class="text-center">Código </td>
                        <td class="text-center">DNI </td>
                        <td class="text-center">Nombre </td>
                        <td class="text-center">Apellido </td>
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
                        <td class="text-center">codigo</td>
                        <td class="text-center">DNI</td>
                        <td class="text-center">nombre</td>
                        <td class="text-center">apellido</td>
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

<!-- no logra funcionar -->

<script type="text/javascript">
$(document).ready(function() {
    $('#frmCliente').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields:{
            codigo:{
                validators:{
                    notEmpty:{
                        message:'El código es obligatorio'
                    },
                    stringLength:{
                        min:1,
                        max:10,
                        message:'El código debe tener entre 1 y 10 caracteres'
                    }
                }
            },
            dni:{
                validators:{
                    notEmpty:{
                        message:'El DNI es obligatorio'
                    },
                    stringLength:{
                        min:8,
                        max:8,
                        message:'El DNI debe tener 8 dígitos'
                    },
                    regexp:{
                        regexp:/^\d+$/,
                        message:'El DNI solo puede contener números'
                    }
                }
            },
            nombre:{
                validators:{
                    notEmpty:{
                        message:'El nombre es obligatorio'
                    },
                    stringLength:{
                        min:3,
                        max:50,
                        message:'El nombre debe tener entre 3 y 50 caracteres'
                    }
                }
            },
            apellido:{
                validators:{
                    notEmpty:{
                        message:'El apellido es obligatorio'
                    },
                    stringLength:{
                        min:3,
                        max:50,
                        message:'El apellido debe tener entre 3 y 50 caracteres'
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>
