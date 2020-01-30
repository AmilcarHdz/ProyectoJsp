package com.controlador;

import com.modelo.DaoSse;
import com.modelo.Sse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre de la clase:ProcesarSse
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarSse", urlPatterns = {"/procesarSse"})
public class ProcesarSse extends HttpServlet {

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
        Sse se = new Sse();
        DaoSse daoS = new DaoSse();
        String msj = null;
        try {
           
            if (request.getParameter("btnInsertar") != null) {
                 int carnet = Integer.parseInt(request.getParameter("txtCarnete"));
                if (daoS.buscarSseExist(carnet)) {
                    msj = "Los datos ya existen";
                    rd = request.getRequestDispatcher("llenarHSS.jsp");
                } else {
                 se.setFecha(request.getParameter("txtfecha"));
            se.setSede(request.getParameter("sede"));
            se.setNombreEstudiante(request.getParameter("txtNombre"));
            se.setNombreIns(request.getParameter("txtInstitucion"));
            se.setDestinatarios(request.getParameter("txtDestinatario"));
            se.setCarnetEstudiante(Integer.parseInt(request.getParameter("txtCarnete")));
            se.setComentarios(request.getParameter("txtComentarios"));
            se.setEstadoSol(request.getParameter("txtEstadoSol"));
            se.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
                daoS.insertarSse(se);
                msj = "Datos Insertados correctamente";
                 rd = request.getRequestDispatcher("llenarHSS.jsp");}
            }
             if (request.getParameter("btnModificar") != null) {                 
              se.setFecha(request.getParameter("txtfecha"));
            se.setSede(request.getParameter("sede"));
            se.setNombreEstudiante(request.getParameter("txtNombre"));
            se.setNombreIns(request.getParameter("txtInstitucion"));
            se.setDestinatarios(request.getParameter("txtDestinatario"));         
            se.setComentarios(request.getParameter("txtComentarios"));
            se.setEstadoSol(request.getParameter("txtEstadoSol"));
            se.setEstado(Integer.parseInt(request.getParameter("txtEstado")));          
            se.setIdSse(Integer.parseInt(request.getParameter("txtId")));
           daoS.modificarSse(se);           
               msj = "Datos modificados correctamente";
                rd = request.getRequestDispatcher("llenarHSS.jsp");
            }
             if (request.getParameter("btnModificarC") != null) {
            
            se.setSede(request.getParameter("sede"));
            se.setNombreEstudiante(request.getParameter("txtNombre"));                  
            se.setComentarios(request.getParameter("txtComentarios"));
            se.setEstadoSol(request.getParameter("txtEstadoSol"));
            se.setEstado(Integer.parseInt(request.getParameter("txtEstado")));          
            se.setIdSse(Integer.parseInt(request.getParameter("txtId")));
           daoS.modificarSseC(se);           
               msj = "Datos modificados correctamente";
                rd = request.getRequestDispatcher("solicitudes.jsp");
            }
             if(request.getParameter("btnEliminar")!=null){
              se.setIdSse(Integer.parseInt(request.getParameter("txtId")));
              daoS.EliminadoLogico(se);
                msj = "Datos eliminados correctamente";
                 rd = request.getRequestDispatcher("llenarHSS.jsp");
             }

           
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
