<%-- 
    Document   : repEstudiantes
    Created on : 21-01-2020, 01:39:03 AM
    Author     : ServicioSocial
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%
Conexion c = new Conexion();
File f = new File(application.getRealPath("reportes/Estudiante.jasper"));
Map parametro = new HashMap();
parametro.put("", request.getParameter(""));
byte[] bytes= JasperRunManager.runReportToPdf(f.getPath(), parametro,c.con());
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream outp = response.getOutputStream();
outp.write(bytes,0,bytes.length);
outp.flush();
outp.close();

%>