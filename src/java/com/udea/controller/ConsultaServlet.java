/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.controller;

import com.udea.servicio.Producto;
import com.udea.servicio.ProductoWebService;
import com.udea.servicio.ProductoWebService_Service;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daemonsoft
 */
public class ConsultaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String tab = "active";
        String result;
        if (request.getParameter("buscar") != null) {
            request.setAttribute("tab1", tab);
            try {
                ProductoWebService_Service service = new ProductoWebService_Service();
                ProductoWebService port = service.getProductoWebServicePort();
                // TODO initialize WS operation arguments here
                String codigo = request.getParameter("codigo");
                // TODO process result here
                String cod = port.buscarProducto(codigo).getCodigo();
                String nom = port.buscarProducto(codigo).getNombre();
                String des = port.buscarProducto(codigo).getDescripcion();
                Double pre = port.buscarProducto(codigo).getPrecio();
                Integer sto = port.buscarProducto(codigo).getStock();

                request.setAttribute("cod", cod);
                request.setAttribute("nom", nom);
                request.setAttribute("des", des);
                request.setAttribute("pre", pre);
                request.setAttribute("sto", sto);
                //out.println("<font color = 'blue'>" + "Resultado de la consulta: " + cod +"</font>");
            } catch (Exception ex) {
                result = "No existe el producto";
                request.setAttribute("msg1", result);
            }
        } else if (request.getParameter("ingresar") != null) {

            request.setAttribute("tab3", tab);
            try {
                ProductoWebService_Service service = new ProductoWebService_Service();
                ProductoWebService port = service.getProductoWebServicePort();
                // TODO initialize WS operation arguments here
                String codigo = request.getParameter("codigoi");
                String nombre = request.getParameter("nombre");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                String descripcion = request.getParameter("descripcion");
                // TODO process result here
                result = port.ingresarProducto(codigo, nombre, precio, stock, descripcion);
                request.setAttribute("msg3", result);
            } catch (Exception ex) {
                result = "Debe ingresar los datos correctamente";
                request.setAttribute("msg3", result);
            }
        } else if (request.getParameter("borrar") != null) {
            request.setAttribute("tab4", tab);
            try {
                ProductoWebService_Service service = new ProductoWebService_Service();
                ProductoWebService port = service.getProductoWebServicePort();
                // TODO initialize WS operation arguments here
                java.lang.String codigo = request.getParameter("codigob");
                // TODO process result here
                result = port.borrarProducto(codigo);
                request.setAttribute("msg4", result);
            } catch (Exception ex) {
                result = "No existe el producto";
                request.setAttribute("msg4", result);
            }
        } else if (request.getParameter("buscara") != null) {
            request.setAttribute("tab5", tab);
            try {
                ProductoWebService_Service service = new ProductoWebService_Service();
                ProductoWebService port = service.getProductoWebServicePort();

                String codigo = request.getParameter("codigoa");
                // TODO process result here
                String nom = port.buscarProducto(codigo).getNombre();
                String des = port.buscarProducto(codigo).getDescripcion();
                Double pre = port.buscarProducto(codigo).getPrecio();
                Integer sto = port.buscarProducto(codigo).getStock();

                request.setAttribute("coda", codigo);
                request.setAttribute("noma", nom);
                request.setAttribute("desa", des);
                request.setAttribute("prea", pre);
                request.setAttribute("stoa", sto);
                // TODO process result here

            } catch (Exception ex) {
                result = "No existe el producto";
                request.setAttribute("msg5", result);
            }
        } else if (request.getParameter("actualizar") != null) {
            request.setAttribute("tab5", tab);
            try {
                ProductoWebService_Service service = new ProductoWebService_Service();
                ProductoWebService port = service.getProductoWebServicePort();
                String codigo = request.getParameter("codigoac");
                String nombre = request.getParameter("nombre");
                String precio = request.getParameter("precio");
                String stock = request.getParameter("stock");
                String descripcion = request.getParameter("descripcion");

                result = port.actualizarProducto(codigo, nombre, Double.parseDouble(precio), Integer.parseInt(stock), descripcion);
                request.setAttribute("msg5", result);

            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        }

        try {
            ProductoWebService_Service service = new ProductoWebService_Service();
            ProductoWebService port = service.getProductoWebServicePort();
            // TODO process result here
            List<Producto> resultl = port.consultarProductos();
            if (resultl.isEmpty()) {
                result = "No hay productos para mostar";
                request.setAttribute("msg2", result);
            } else {
                request.setAttribute("todosP", resultl);
            }
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }

        request.getRequestDispatcher("/consulta.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
