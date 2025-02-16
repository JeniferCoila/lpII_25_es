package Interfaces;

import java.util.List;
import model.TblProductosusti;

public interface IProducto {

    // Métodos a implementar
    void RegistrarProducto(TblProductosusti producto);
    void ActualizarProducto(TblProductosusti producto);
    void EliminarProducto(TblProductosusti producto);
    List<TblProductosusti> ListadoProductos();
    TblProductosusti BuscarProducto(TblProductosusti producto);
}