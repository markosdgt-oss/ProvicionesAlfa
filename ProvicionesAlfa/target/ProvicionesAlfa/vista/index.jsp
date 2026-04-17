<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ProvicionesAlfa - Menú Principal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .header-banner {
                background-color: aqua;
                padding: 2rem 0;
            }
            .navbar-custom {
                background-color: #007bff;
            }
            .logo-container img {
                max-height: 400px;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>

        <div class="header-banner text-center w-100">
            <h1 class="text-white fw-bold">PROVICIONES ALFA</h1>
            <p class="text-white-50">Sistema de Gestión Comercial</p>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom shadow-sm">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><i class="fas fa-sparkles"></i> Soluciones Efectivas</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="menu.jsp"><i class="fas fa-home"></i> Inicio</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-box-open"></i> Productos
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="consultarProducto.jsp">Consultar Productos</a></li>
                                <li><a class="dropdown-item" href="registrarProducto.jsp">Registrar Nuevo</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="../productoControl?accion=listar">Ver Todo el Inventario</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container text-center mt-5">
            <div class="mt-4">
                <h2 class="text-secondary">Bienvenido al Panel de Control</h2>
                <p class="lead">Seleccione una opción en el menú superior para comenzar.</p>
            </div>
        </div>
        
        <div class="container text-center mt-4">
            <img src="./img/Provicion_logo.jpg" 
            alt="Logo ProvicionesAlfa" 
            class="img-fluid" 
            style="max-height: 400px; width: auto; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>