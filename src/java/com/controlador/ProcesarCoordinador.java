package com.controlador;

import com.modelo.Coordinador;
import com.modelo.DaoCoordinador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre de la clase: ProcesarCoordinador
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
@WebServlet(name = "ProcesarCoordinador", urlPatterns = {"/procesarCoordinador"})
public class ProcesarCoordinador extends HttpServlet {

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
        Coordinador coor = new Coordinador();
        DaoCoordinador daoC = new DaoCoordinador();
        String msj="";
        
        try 
        {
            coor.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
            coor.setNombre(request.getParameter("txtNombre"));
            coor.setEdad(Integer.parseInt(request.getParameter("txtEdad")));
            coor.setSexo(request.getParameter("txtSexo"));
            coor.setCorreo(request.getParameter("txtCorreo"));
            
            if(request.getParameter("btnInsertar")!=null)
            {
                daoC.insertarCoordinador(coor);
                msj="Datos insertados correctamente";
            }
            else if(request.getParameter("btnModificar")!=null)
            {
                daoC.modificarCoordinador(coor);
                msj="Datos Modificados correctamente";
            }
            else
            {
                daoC.eliminarCoordinador(coor);
                msj="Datos Eliminados correctamente";
            }
            
            rd=request.getRequestDispatcher("Coordinador.jsp");
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
