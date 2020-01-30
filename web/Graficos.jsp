<%-- 
    Document   : Graficos
    Created on : 20-01-2020, 03:45:29 AM
    Author     : ServicioSocial
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %> 
<%@page import="org.jfree.chart.*" %> 
<%@page import="org.jfree.chart.plot.*" %> 
<%@page import="org.jfree.data.general.*" %> 
<%@include file="../src/java/com/conexion/Conexion.java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <% //try catch : controla los errores 
        try {
          //Crear un objeto del tipo de grafico circular 
          DefaultPieDataset data = new DefaultPieDataset();
          //corre los datos del ResultSet
          while(rs.next()){
            //agregar los datos correspodientes
            data.setValue(rs.getString("marca"), rs.getInt(2));
          }
          //generar grafico
          JFreeChart grafico = ChartFactory.createPieChart("Cantidad Productos", data,true,true,true);
          //"poner titulo", poner data, visualizar la leyenda,letreros emergentes, enlaces url
          //la salida sea en una imagen
          response.setContentType("image/JPEG");
          OutputStream sa = response.getOutputStream();//obejto de salida
          //Dibujo de la imagen
          ChartUtilities.writeChartAsJPEG(sa, grafico, 600, 600);
        }catch(Exception ex){
            out.print(ex);//muestra los errores
        }
        %>
    </body>
</html>
