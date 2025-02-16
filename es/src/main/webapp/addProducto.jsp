<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
            <h2 class="text-center text-primary mb-4">Agregar Producto</h2>
            <form action="ControladorProducto" method="post">
                <input type="hidden" name="action" value="registrar">
                
                <!-- Campo Nombre -->
                <div class="mb-3">
                    <label for="nombresusti" class="form-label">Nombre del Producto</label>
                    <input type="text" class="form-control" id="nombresusti" name="nombresusti" required>
                </div>

                <!-- Campo Descripción -->
                <div class="mb-3">
                    <label for="descripsusti" class="form-label">Descripción del Producto</label>
                    <input type="text" class="form-control" id="descripsusti" name="descripsusti" required>
                </div>

                <!-- Campo Precio Compra -->
                <div class="mb-3">
                    <label for="preciocompsusti" class="form-label">Precio de Compra</label>
                    <input type="number" step="0.01" class="form-control" id="preciocompsusti" name="preciocompsusti" required>
                </div>

                <!-- Campo Precio Venta -->
                <div class="mb-3">
                    <label for="precioventasusti" class="form-label">Precio de Venta</label>
                    <input type="number" step="0.01" class="form-control" id="precioventasusti" name="precioventasusti" required>
                </div>

                <!-- Campo Estado -->
                <div class="mb-3">
                    <label for="estadosusti" class="form-label">Estado del Producto</label>
                    <select class="form-select" id="estadosusti" name="estadosusti" required>
                        <option value="Activo">Activo</option>
                        <option value="Inactivo">Inactivo</option>
                    </select>
                </div>

                <!-- Campo Fecha de Ingreso -->
                <div class="mb-3">
                    <label for="feingproducto" class="form-label">Fecha de Ingreso</label>
                    <input type="text" class="form-control" id="feingproducto" name="feingproducto" required>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Registrar</button>
                    <a href="ControladorProducto" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        flatpickr("#feingproducto", {
            dateFormat: "Y-m-d",
            locale: "es",
            allowInput: true
        });
    </script>
</body>
</html>
