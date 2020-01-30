<%-- 
    Document   : reporteHoras
    Created on : 21-01-2020, 01:00:08 AM
    Author     : ServicioSocial
--%>

<%@page import="com.modelo.DaoControlHoras"%>
<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<%@page import="javax.servlet.ServletResponse"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            DaoControlHoras dc = new DaoControlHoras();
            int ca = Integer.parseInt(request.getParameter("txtparametro"));
            int idh = dc.buscarHoras(ca);

            if (dc.buscarHoras(ca) > 0) {
                Conexion c = new Conexion();
                File f = new File(application.getRealPath("reportes/reportesHoras1.jasper"));
                Map parametro = new HashMap();
                parametro.put("nombre", idh);
                byte[] bytes = JasperRunManager.runReportToPdf(f.getPath(), parametro, c.con());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outp = response.getOutputStream();
                outp.write(bytes, 0, bytes.length);
                outp.flush();
                outp.close();
            } else {
                out.println("error");
            }


        %>

    </body>
</html>