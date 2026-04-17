package com.mycompany.provicionesalfa.controlador;

import com.mycompany.provicionesalfa.DAO.productoDAO;
import com.mycompany.provicionesalfa.modelo.producto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/productoControl")
public class productoControl extends HttpServlet {

    productoDAO dao = new productoDAO();
    producto p = new producto();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    // Recupera todos los productos para la tabla principal
                    List listaTotal = dao.listar();
                    request.setAttribute("misProductos", listaTotal);
                    request.getRequestDispatcher("vista/consultarProducto.jsp").forward(request, response);
                    break;

                case "buscar_nombre":
                    String nombre = request.getParameter("txtBuscar");
                    List listaBusqueda = dao.buscar(nombre);
                    request.setAttribute("misProductos", listaBusqueda);
                    // IMPORTANTE: Se agrega 'vista/' a la ruta
                    request.getRequestDispatcher("vista/consultarProducto.jsp").forward(request, response);
                    break;

                case "agregar":
                    // 1. Recibimos los datos del formulario registrarProducto.jsp
                    String nom = request.getParameter("txtNombre");
                    String precioStr = request.getParameter("txtPrecio");
                    
                    if (nom != null && precioStr != null) {
                        p.setNombre(nom);
                        p.setPrecio(Double.parseDouble(precioStr));
                        
                        // 2. Llamamos al DAO para insertar
                        dao.agregar(p);
                    }
                    // 3. Después de agregar, volvemos a listar para ver el nuevo producto
                    response.sendRedirect("productoControl?accion=listar");
                    break;

                case "buscar_por_id":
                    String idStr = request.getParameter("txtIdProducto");
                    if (idStr != null && !idStr.isEmpty()) {
                        int idBusqueda = Integer.parseInt(idStr);
                        p = dao.listarId(idBusqueda);
                        request.setAttribute("productoEncontrado", p);
                    }
                    request.getRequestDispatcher("vista/consultarProducto.jsp").forward(request, response);
                    break;

                default:
                    request.getRequestDispatcher("vista/menu.jsp").forward(request, response);
            }
        } else {
            // Si no hay acción, mandamos al menú por defecto
            request.getRequestDispatcher("vista/menu.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}