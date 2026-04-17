<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Productos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body class="container mt-5">
        
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Gestión de Productos</h4>
            </div>
            <div class="card-body">
                <form action="../productoControl" method="GET" class="form-inline mb-4">
                    <div class="form-group mr-2">
                        <label class="mr-2 font-weight-bold">Nombre del Producto:</label>
                        <input type="text" name="txtBuscar" class="form-control" placeholder="Ej: Shampoo" value="${param.txtBuscar}">
                    </div>
                    <button type="submit" name="accion" value="buscar_nombre" class="btn btn-primary">
                        <i class="fas fa-search"></i> Consultar
                    </button>
                    
                    <a href="registrarProducto.jsp" class="btn btn-success ml-auto">
                        <i class="fas fa-plus"></i> Nuevo Producto
                    </a>
                </form>

                <hr>

                <table class="table table-hover table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>PRECIO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${misProductos}">
                            <tr class="text-center">
                                <td>${p.id}</td>
                                <td class="text-left">${p.nombre}</td>
                                <td>$ ${p.precio}</td>
                                <td>
                                    <a href="../productoControl?accion=editar&id=${p.id}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <a href="../productoControl?accion=eliminar&id=${p.id}" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash"></i> Eliminar
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty misProductos && param.accion == 'buscar_nombre'}">
                            <tr>
                                <td colspan="4" class="text-center text-muted py-4">
                                    No se encontraron productos con el nombre: <strong>${param.txtBuscar}</strong>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <a href="menu.jsp" class="btn btn-secondary btn-sm">Volver al Menú</a>
            </div>
        </div>
    </body>
</html>