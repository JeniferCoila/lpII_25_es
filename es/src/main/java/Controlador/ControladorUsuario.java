package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ClassUsuarioImp;
import model.TblUsuariosusti;

/**
 * Servlet implementation class ControladorUsuario
 */
@WebServlet("/ControladorUsuario")
public class ControladorUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorUsuario() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        ClassUsuarioImp crud = new ClassUsuarioImp();

        try {
            TblUsuariosusti user = crud.validarUsuario(usuario, password);
            if (user != null) {
                // Usuario válido guarda en sesión y redirige
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "¡Bienvenido " + user.getUsuariosusti() + "!");
                session.setAttribute("usuario", user);

                // Redirigir al controlador de proveedores
                response.sendRedirect("ControladorProveedor");
            } else {
                // Usuario inválido: redirigir al login con error
                response.sendRedirect("login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar el login.");
        }
    }
}