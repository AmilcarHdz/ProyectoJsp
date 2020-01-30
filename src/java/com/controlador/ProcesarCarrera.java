package com.controlador;

import com.modelo.Carrera;
import com.modelo.DaoCarrera;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre de la clase: ProcesarCarrera
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarCarrera", urlPatterns = {"/procesarCarrera"})
public class ProcesarCarrera extends HttpServlet {

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
        Carrera car = new Carrera();
        DaoCarrera daoC = new DaoCarrera();
        String msj = "";

        try {
            car.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
            car.setNombre(request.getParameter("txtNombre"));
            car.setTipoCarrera(request.getParameter("radioTipo"));

            if (request.getParameter("btnInsertar") != null) {
                String nombre=request.getParameter("txtNombre");
                String tipo=request.getParameter("radioTipo");
               
                if( daoC.buscarCarreraExist(nombre,tipo)){
                    msj = "La carrera ya existe"; 
                }else{
                daoC.insertarCarrera(car);
                msj = "Datos insertados correctamente";}
            } else if (request.getParameter("btnModificar") != null) {
                String nombre=request.getParameter("txtNombre");
                String tipo=request.getParameter("radioTipo");
               
                if( daoC.buscarCarreraExist(nombre,tipo)){
                    msj = "La carrera ya existe"; 
                }else{
                    daoC.modificarCarrera(car);
                msj = "Datos Modificados correctamente";
               }
                
            } else {
                daoC.EliminadoLogico(car);
                msj = "Datos Eliminados correctamente";
            }

            rd = request.getRequestDispatcher("Carrera.jsp");
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
