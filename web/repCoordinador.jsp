

<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>

<%
Conexion c = new Conexion();
File f = new File(application.getRealPath("reportes/Coordinador.jasper"));
Map parametro = new HashMap();
parametro.put("id", request.getParameter("txtparametro"));
byte[] bytes= JasperRunManager.runReportToPdf(f.getPath(), parametro,c.con());
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream outp = response.getOutputStream();
outp.write(bytes,0,bytes.length);
outp.flush();
outp.close();

%>

