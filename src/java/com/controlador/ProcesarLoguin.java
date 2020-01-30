package com.controlador;

import com.modelo.Validar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Nombre de la clase: ProcesarLoguin
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarLoguin", urlPatterns = {"/procesarLoguin"})
public class ProcesarLoguin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       String nombre;
       String contra;
       int nivel=0;
       RequestDispatcher rd=null;  
       Validar obj= new Validar();
       if(request.getParameter("btnEnviar")!=null){
       nombre=request.getParameter("txtUsuario");
       contra=request.getParameter("txtClave");
    nivel=obj.validarUsuario(nombre, contra);
       request.setAttribute("nivel",nivel);
       request.setAttribute("nombre",nombre);
       rd=request.getRequestDispatcher("index.jsp");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProcesarLoguin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProcesarLoguin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
