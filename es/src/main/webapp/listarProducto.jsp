<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <%@ page import="java.util.*"%>
    <style>
        body {
            background: #f8f9fa;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-sm {
            margin: 2px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <a href="login.jsp" class="btn btn-success">Cerrar sesión</a>
    
        <h1 class="text-center text-primary">Listado de Productos</h1>
        
        <div class="d-flex justify-content-between mb-3">
            <h4 class="text-secondary">Gestión de productos</h4>
            <a href="addProducto.jsp" class="btn btn-success">Registrar Producto</a>
        </div>
        
        <div class="table-responsive">
            <table class="table table-hover table-bordered bg-white">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Precio Compra</th>
                        <th>Precio Venta</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<model.TblProductosusti> productos = (List<model.TblProductosusti>) request.getAttribute("listado");
                    if (productos != null && !productos.isEmpty()) {
                        for (model.TblProductosusti producto : productos) {
                    %>
                    <tr>
                        <td><%= producto.getIdproductosusti() %></td>
                        <td><%= producto.getNombresusti() %></td>
                        <td><%= producto.getDescripsusti() %></td>
                        <td><%= producto.getEstadosusti() %></td>
                        <td><%= producto.getPreciocompsusti() %></td>
                        <td><%= producto.getPrecioventasusti() %></td>
                        <td>
                            <a href="ControladorProducto?action=editar&idproductosusti=<%= producto.getIdproductosusti() %>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="ControladorProducto?action=eliminar&idproductosusti=<%= producto.getIdproductosusti() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este producto?');">Eliminar</a>
                        </td>
                    </tr>
                    <% 
                        }
                    } else { 
                    %>
                    <tr>
                        <td colspan="7" class="text-center text-muted">No hay productos registrados</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
