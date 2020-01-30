package com.controlador;

import com.modelo.ControlHoras;
import com.modelo.DaoControlHoras;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre de la clase: ProcesarControlHoras
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarControlHoras", urlPatterns = {"/procesarControlHoras"})
public class ProcesarControlHoras extends HttpServlet {

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
        DaoControlHoras dc = new DaoControlHoras();
        ControlHoras c = new ControlHoras();
        try {
            //Insertar informacion
            if (request.getParameter("btnInsertar") != null) {
                int carnet = Integer.parseInt(request.getParameter("txtCarnet"));
                if (dc.buscarControlExist(carnet)) {
                    msj = "Los datos ya existen";
                    rd = request.getRequestDispatcher("ControlHoras.jsp");
                } else {
                    c.setSedeEstudio(request.getParameter("sede"));
                    c.setNombreEstudiante(request.getParameter("txtNombre"));
                    c.setEscuela(request.getParameter("Escuela"));
                    c.setIdEstudiante(Integer.parseInt(request.getParameter("txtCarnet")));
                    c.setNombreCarrera(request.getParameter("selectCarrera"));
                    c.setEstadollenar(Integer.parseInt(request.getParameter("txtEstado")));
                    dc.insertarCh(c);
                    msj = "Datos Insertados correctamente";
                    rd = request.getRequestDispatcher("ControlHoras.jsp");
                }
            }
            //Insertar actividades
            if (request.getParameter("btnInsertarAct") != null) {
                int ca = Integer.parseInt(request.getParameter("txtCarnetAct"));
                int idh = dc.buscarHoras(ca);
                if (dc.buscarHoras(ca) > 0) {
                    c.setFechaAct(request.getParameter("txtfechact"));
                    c.setActividad(request.getParameter("txtAct"));
                    c.setHorasD(Double.parseDouble(request.getParameter("txtHoras")));
                    c.setIdRHoras(idh);
                    c.setEstadoDetalleH(Integer.parseInt(request.getParameter("txtEstadoAct")));
                    dc.insertarChAct(c);
                    msj = "Datos Insertados correctamente";
                    rd = request.getRequestDispatcher("ControlHoras.jsp");
                } else {

                }
            }
            //modificar actividades
            if (request.getParameter("btnModificarAct") != null) {              
                c.setFechaAct(request.getParameter("txtfechact"));
                c.setActividad(request.getParameter("txtAct"));
                c.setHorasD(Double.parseDouble(request.getParameter("txtHoras")));
                c.setEstadoDetalleH(Integer.parseInt(request.getParameter("txtEstadoAct")));
                c.setIdLlenar(Integer.parseInt(request.getParameter("txtIdAct")));
                dc.modificarAc(c);
                msj = "Datos modificados correctamente";
                rd = request.getRequestDispatcher("ControlHoras.jsp");
            }
            //modifica informacion
            if (request.getParameter("btnModificar") != null) {
                int carnet = Integer.parseInt(request.getParameter("txtCarnet"));
                if (dc.buscarControlExist(carnet)) {
                      msj = "Los datos ya existen";
                rd = request.getRequestDispatcher("ControlHoras.jsp");
                }else{
                c.setSedeEstudio(request.getParameter("sede"));
                c.setNombreEstudiante(request.getParameter("txtNombre"));
                c.setEscuela(request.getParameter("Escuela"));
                c.setIdEstudiante(Integer.parseInt(request.getParameter("txtCarnet")));
                c.setNombreCarrera(request.getParameter("selectCarrera"));
                c.setEstadollenar(Integer.parseInt(request.getParameter("txtEstado")));
                c.setIdRegistroHoras(Integer.parseInt(request.getParameter("txtCodigo")));
                dc.modificarCH(c);
                msj = "Datos modificados correctamente";
                rd = request.getRequestDispatcher("ControlHoras.jsp");
                }
            }
            //eliminar informacion
            if (request.getParameter("btnEliminar") != null) {
                c.setIdRegistroHoras(Integer.parseInt(request.getParameter("txtCodigo")));
                dc.EliminadoLogico(c);
                msj = "Datos eliminados correctamente";
                rd = request.getRequestDispatcher("ControlHoras.jsp");
            }
            //eliminar actividades
            if (request.getParameter("btnEliminarAct") != null) {
                c.setIdLlenar(Integer.parseInt(request.getParameter("txtIdAct")));
                dc.EliminadoLogicoAct(c);
                msj = "Datos eliminados correctamente";
                rd = request.getRequestDispatcher("ControlHoras.jsp");
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
