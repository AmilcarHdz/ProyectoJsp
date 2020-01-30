package com.controlador;

import com.modelo.DaoHorarioYAct;
import com.modelo.HorarioYAct;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre de la clase: ProcesarHorasYAct
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarHorasYAct", urlPatterns = {"/procesarHorasYAct"})
public class ProcesarHorasYAct extends HttpServlet {

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
        String msj = null;
        DaoHorarioYAct dc = new DaoHorarioYAct();
        HorarioYAct c = new HorarioYAct();
        
        try {
            //Insertar informacion
            if (request.getParameter("btnInsertar") != null) {
                int car=Integer.parseInt(request.getParameter("txtCarnetEstudiante"));
                if(dc.buscarHYActExist(car)){
                 msj = "Los datos ya existen";
                rd = request.getRequestDispatcher("HorasYAct.jsp");
                }else{
                c.setCarneEstudiante(Integer.parseInt(request.getParameter("txtCarnetEstudiante")));
                c.setActR(request.getParameter("txtAct"));
                c.setObjetivo(request.getParameter("txtObj"));
                c.setEstadoS(request.getParameter("txtSolicitud"));
                c.setMeta(request.getParameter("txtMeta"));
                c.setDuracion(Integer.parseInt(request.getParameter("txtDuracion")));
                c.setNombreEstudiante(request.getParameter("txtNom"));
                c.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
                c.setLunes(request.getParameter("txtLunes"));
                c.setMartes(request.getParameter("txtMartes"));
                c.setMiercoles(request.getParameter("txtMiercoles"));
                c.setJueves(request.getParameter("txtJueves"));
                c.setViernes(request.getParameter("txtViernes"));
                c.setSabado(request.getParameter("txtSabado"));
                c.setDomingo(request.getParameter("txtDomingo"));
                dc.insertarYAct(c);
                msj = "Datos Insertados correctamente";
                rd = request.getRequestDispatcher("HorasYAct.jsp");}
            }
             if (request.getParameter("btnModificar") != null) {
                c.setCarneEstudiante(Integer.parseInt(request.getParameter("txtCarnetEstudiante")));
                c.setActR(request.getParameter("txtAct"));
                c.setObjetivo(request.getParameter("txtObj"));
                c.setEstadoS(request.getParameter("txtSolicitud"));
                c.setMeta(request.getParameter("txtMeta"));
                c.setDuracion(Integer.parseInt(request.getParameter("txtDuracion")));
                c.setNombreEstudiante(request.getParameter("txtNom"));
                c.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
                c.setLunes(request.getParameter("txtLunes"));
                c.setMartes(request.getParameter("txtMartes"));
                c.setMiercoles(request.getParameter("txtMiercoles"));
                c.setJueves(request.getParameter("txtJueves"));
                c.setViernes(request.getParameter("txtViernes"));
                c.setSabado(request.getParameter("txtSabado"));
                c.setDomingo(request.getParameter("txtDomingo"));
                c.setIdA(Integer.parseInt(request.getParameter("txtCodigo")));
                dc.modificarCH(c);
                msj = "Datos Modificados correctamente";
                rd = request.getRequestDispatcher("HorasYAct.jsp");
            }
             if (request.getParameter("btnEliminar") != null) {
                c.setIdA(Integer.parseInt(request.getParameter("txtCodigo")));
                dc.EliminadoLogico(c);
                msj = "Datos Eliminados correctamente";
                rd = request.getRequestDispatcher("HorasYAct.jsp");
            }
  request.setAttribute("msj", msj);
        } catch (Exception e) {
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
