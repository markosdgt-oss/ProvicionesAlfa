<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrar Producto - ProvicionesAlfa</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body { background-color: #f4f7f6; }
            /* Estilo acorde a ProvicionesAlfa */
            .card-header { background-color: #343a40; color: white; }
            .btn-primary-custom { background-color: #007bff; color: white; }
            .btn-primary-custom:hover { background-color: #0056b3; color: white; }
        </style>
    </head>
    <body class="container mt-5">

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-header text-center">
                        <h3 class="mb-0"><i class="fas fa-boxes"></i> ProvicionesAlfa</h3>
                        <small>Registro de Nuevo Producto</small>
                    </div>
                    <div class="card-body">
                        <form action="../productoControl" method="POST">
                            
                            <div class="form-group">
                                <label for="txtNombre" class="font-weight-bold">Nombre del Producto:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-barcode"></i></span>
                                    </div>
                                    <input type="text" name="txtNombre" id="txtNombre" class="form-control" 
                                           placeholder="Nombre del artículo" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="txtPrecio" class="font-weight-bold">Precio Unitario:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                    </div>
                                    <input type="number" name="txtPrecio" id="txtPrecio" class="form-control" 
                                           placeholder="0.00" step="0.01" required>
                                </div>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" name="accion" value="agregar" class="btn btn-primary btn-block">
                                    <i class="fas fa-save"></i> Guardar en Inventario
                                </button>
                                <a href="consultarProducto.jsp" class="btn btn-outline-secondary btn-block mt-2">
                                    <i class="fas fa-undo"></i> Regresar a la Lista
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

                <c:if test="${not empty mensaje}">
                    <div class="alert alert-info mt-3 shadow-sm text-center">
                        <i class="fas fa-info-circle"></i> ${mensaje}
                    </div>
                </c:if>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>