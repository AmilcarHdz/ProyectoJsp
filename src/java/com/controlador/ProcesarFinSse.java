package com.controlador;

import com.modelo.DaoFinSse;
import com.modelo.FinSse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Nombre de la clase: ProcesarFinSse
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarFinSse", urlPatterns = {"/procesarFinSse"})
public class ProcesarFinSse extends HttpServlet {

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
        DaoFinSse df = new DaoFinSse();
        FinSse fs = new FinSse();
        try {
            //Insertar informacion
            if (request.getParameter("btnInsertar") != null) {
                int ca=Integer.parseInt(request.getParameter("txtCarnet"));
                if(df.buscarFinExist(ca)){
                     msj = "Los datos ya existen";
                rd = request.getRequestDispatcher("FinSse.jsp");
                }else{
                fs.setEstudiante(request.getParameter("txtNombre"));
              fs.setEscuela(request.getParameter("Escuela"));
              fs.setSede(request.getParameter("sede"));
               fs.setCarrera(request.getParameter("selectCarrera"));
             fs.setCarnet(Integer.parseInt(request.getParameter("txtCarnet")));
               fs.setJornada(request.getParameter("Jornada"));
                fs.setAnioEstudio(request.getParameter("anio"));
                fs.setTelefonoEst(request.getParameter("txtTelefono"));
                fs.setCorreo(request.getParameter("txtCorreo"));
                fs.setInstitucion(request.getParameter("txtInstitucion"));
                fs.setDireccion(request.getParameter("txtDireccion"));
                fs.setTelefonoIns(request.getParameter("txtTelefonos"));
                fs.setSitioWeb(request.getParameter("txtSitioweb"));
                fs.setFechaInicio(request.getParameter("txtInicioH"));
                fs.setFechaFin(request.getParameter("txtFinalizacionH"));
                fs.setOservaciones(request.getParameter("txtOservaciones"));
                fs.setEncargadoIns(request.getParameter("txtEncargado"));
                fs.setCoordinador(request.getParameter("txtCoordinador"));
                fs.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
  
               df.insertarSse(fs);
              
               msj = "Datos Insertados correctamente";
                rd = request.getRequestDispatcher("FinSse.jsp");}
            }
            if (request.getParameter("btnModificar") != null) {
               fs.setEstudiante(request.getParameter("txtNombre"));
              fs.setEscuela(request.getParameter("Escuela"));
              fs.setSede(request.getParameter("sede"));
               fs.setCarrera(request.getParameter("selectCarrera"));
             fs.setCarnet(Integer.parseInt(request.getParameter("txtCarnet")));
               fs.setJornada(request.getParameter("Jornada"));
                fs.setAnioEstudio(request.getParameter("anio"));
                fs.setTelefonoEst(request.getParameter("txtTelefono"));
                fs.setCorreo(request.getParameter("txtCorreo"));
                fs.setInstitucion(request.getParameter("txtInstitucion"));
                fs.setDireccion(request.getParameter("txtDireccion"));
                fs.setTelefonoIns(request.getParameter("txtTelefonos"));
                fs.setSitioWeb(request.getParameter("txtSitioweb"));
                fs.setFechaInicio(request.getParameter("txtInicioH"));
                fs.setFechaFin(request.getParameter("txtFinalizacionH"));
                fs.setOservaciones(request.getParameter("txtOservaciones"));
                fs.setEncargadoIns(request.getParameter("txtEncargado"));
                fs.setCoordinador(request.getParameter("txtCoordinador"));
                fs.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
                fs.setIdF(Integer.parseInt(request.getParameter("txtId")));
               df.modificarFinSse(fs);
                msj = "Datos Modificados  correctamente";
                 rd = request.getRequestDispatcher("FinSse.jsp");
            }
            if (request.getParameter("btnEliminar") != null) {
                 fs.setIdF(Integer.parseInt(request.getParameter("txtId")));
               df.EliminadoLogicoFinSse(fs);
                msj = "Datos Eliminados correctamente";
                 rd = request.getRequestDispatcher("FinSse.jsp");
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
