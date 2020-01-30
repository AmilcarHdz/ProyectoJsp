package com.controlador;

import com.modelo.Carrera;
import com.modelo.DaoEstudiante;
import com.modelo.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre de la clase: ProcesarEstudiante
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarEstudiante", urlPatterns = {"/procesarEstudiante"})
public class ProcesarEstudiante extends HttpServlet {

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
        RequestDispatcher rd=null;
        Estudiante es = new Estudiante();
        Carrera car =new Carrera();
        DaoEstudiante daoE = new DaoEstudiante();
        String msj= null;
        
        try 
        {
            es.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
            es.setNombre(request.getParameter("txtNombre"));
            es.setEdad(Integer.parseInt(request.getParameter("txtEdad")));
            es.setSexo(request.getParameter("txtSexo"));
            es.setCorreo(request.getParameter("txtCorreo"));
            es.setEstado(request.getParameter("txtEstado"));
            es.setSede(request.getParameter("txtSede"));
            car.setCodigo(Integer.parseInt(request.getParameter("selectCarrera")));
            es.setCarrera(car);
            
            if(request.getParameter("btnInsertar")!=null)
            {
                daoE.insertarEstudiante(es);
                msj="Datos insertados correctamente";
            }
             else if(request.getParameter("btnModificar")!=null)
            {
                daoE.modificarEstudiante(es);
                msj="Datos Modificados correctamente";
            }
            else
            {
               daoE.eliminarEstudiante(es);
                msj="Datos Eliminados correctamente";
            }
            
            rd=request.getRequestDispatcher("Coordinador.jsp");
            request.setAttribute("msj", msj);
            rd=request.getRequestDispatcher("Estudiante.jsp");
            request.setAttribute("msj", msj);
        }
        catch (Exception e)
        {
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
