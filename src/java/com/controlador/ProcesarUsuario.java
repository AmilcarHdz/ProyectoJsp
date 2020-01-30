package com.controlador;

import com.modelo.DaoUsuario;
import com.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * Nombre de la clase: ProcesarUsuario
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class ProcesarUsuario extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = null;
        Usuario us = new Usuario();
        DaoUsuario daoU = new DaoUsuario();
        String msj = "";
        try {  
             String pass=request.getParameter("txtpass");
            us.setUsuario(request.getParameter("txtNombre"));
                  String clavemd5=DigestUtils.md5Hex(pass); 
                 us.setContrasenia(clavemd5);
                 us.setContrasenia(clavemd5);
                us.setPrivilegio(Integer.parseInt(request.getParameter("cmbPrivilegios")));
                us.setEstado(Integer.parseInt(request.getParameter("txtEstado")));        
            if (request.getParameter("btnInsertar") != null) {               
                daoU.insertarUsuario(us);
                msj = "Datos  correctamente";
            } else if (request.getParameter("btnModificar") != null) {
                us.setCodigoU(Integer.parseInt(request.getParameter("txtCod")));              
                daoU.modificarUsuario(us);
                msj = "Datos Modificados correctamente";
            } else {
                us.setCodigoU(Integer.parseInt(request.getParameter("txtCod")));             
               daoU.EliminadoLogico(us);
                msj = "Datos eliminados correctamente";
            }

            rd = request.getRequestDispatcher("usuarios.jsp");
            request.setAttribute("msj", msj);
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
        }
        rd.forward(request, response);
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
