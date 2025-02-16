<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <style>
        body {
            background: #f8f9fa;
        }
        .form-container {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="form-container">
            <h2 class="text-center text-primary mb-4">Editar Producto</h2>
            <form action="ControladorProducto" method="post">
                <input type="hidden" name="action" value="actualizar">
                <input type="hidden" name="idproductosusti" value="<%= (request.getAttribute("producto") != null) ? ((model.TblProductosusti) request.getAttribute("producto")).getIdproductosusti() : "" %>">
                
                <div class="mb-3">
                    <label for="nombresusti" class="form-label">Nombre del Producto</label>
                    <input type="text" class="form-control" id="nombresusti" name="nombresusti" 
                        value="<%= (request.getAttribute("producto") != null) ? ((model.TblProductosusti) request.getAttribute("producto")).getNombresusti() : "" %>" required>
                </div>
                
                <div class="mb-3">
                    <label for="descripsusti" class="form-label">Descripción</label>
                    <textarea class="form-control" id="descripsusti" name="descripsusti" required>
                        <%= (request.getAttribute("producto") != null) ? ((model.TblProductosusti) request.getAttribute("producto")).getDescripsusti() : "" %>
                    </textarea>
                </div>
                
                <div class="mb-3">
                    <label for="preciocompsusti" class="form-label">Precio de Compra</label>
                    <input type="number" step="0.01" class="form-control" id="preciocompsusti" name="preciocompsusti" 
                        value="<%= (request.getAttribute("producto") != null) ? ((model.TblProductosusti) request.getAttribute("producto")).getPreciocompsusti() : "" %>" required>
                </div>
                
                <div class="mb-3">
                    <label for="precioventasusti" class="form-label">Precio de Venta</label>
                    <input type="number" step="0.01" class="form-control" id="precioventasusti" name="precioventasusti" 
                        value="<%= (request.getAttribute("producto") != null) ? ((model.TblProductosusti) request.getAttribute("producto")).getPrecioventasusti() : "" %>" required>
                </div>
                
                <div class="mb-3">
                    <label for="estadosusti" class="form-label">Estado</label>
                    <select class="form-control" id="estadosusti" name="estadosusti" required>
                        <option value="Activo" <%= (request.getAttribute("producto") != null && ((model.TblProductosusti) request.getAttribute("producto")).getEstadosusti().equals("Activo")) ? "selected" : "" %>>Activo</option>
                        <option value="Inactivo" <%= (request.getAttribute("producto") != null && ((model.TblProductosusti) request.getAttribute("producto")).getEstadosusti().equals("Inactivo")) ? "selected" : "" %>>Inactivo</option>
                    </select>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                    <a href="listarProductos.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
