package Controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.ClassProductoImp;
import model.TblProductosusti;

@WebServlet("/ControladorProducto")
public class ControladorProducto extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClassProductoImp crudimp = new ClassProductoImp();

    public ControladorProducto() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.isEmpty()) {
                List<TblProductosusti> listadoProductos = crudimp.ListadoProductos();
                request.setAttribute("listado", listadoProductos);
                request.getRequestDispatcher("listarProductos.jsp").forward(request, response);
            } else if ("editar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("idproductosusti"));
                TblProductosusti producto = new TblProductosusti();
                producto.setIdproductosusti(id);
                TblProductosusti productoEncontrado = crudimp.BuscarProducto(producto);
                request.setAttribute("producto", productoEncontrado);
                request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
            } else if ("eliminar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("idproductosusti"));
                TblProductosusti producto = new TblProductosusti();
                producto.setIdproductosusti(id);
                crudimp.EliminarProducto(producto);
                response.sendRedirect("ControladorProducto");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la solicitud");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("registrar".equals(action)) {
                TblProductosusti producto = new TblProductosusti();
                producto.setNombresusti(request.getParameter("nombresusti"));
                producto.setDescripsusti(request.getParameter("descripsusti"));
                producto.setEstadosusti(request.getParameter("estadosusti"));
                producto.setPreciocompsusti(Double.parseDouble(request.getParameter("preciocompsusti")));
                producto.setPrecioventasusti(Double.parseDouble(request.getParameter("precioventasusti")));
                crudimp.RegistrarProducto(producto);
                response.sendRedirect("ControladorProducto");
            } else if ("actualizar".equals(action)) {
                TblProductosusti producto = new TblProductosusti();
                producto.setIdproductosusti(Integer.parseInt(request.getParameter("idproductosusti")));
                producto.setNombresusti(request.getParameter("nombresusti"));
                producto.setDescripsusti(request.getParameter("descripsusti"));
                producto.setEstadosusti(request.getParameter("estadosusti"));
                producto.setPreciocompsusti(Double.parseDouble(request.getParameter("preciocompsusti")));
                producto.setPrecioventasusti(Double.parseDouble(request.getParameter("precioventasusti")));
                crudimp.ActualizarProducto(producto);
                response.sendRedirect("ControladorProducto");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar el formulario");
        }
    }
}
