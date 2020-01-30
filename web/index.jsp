<%-- 
    Document   : index
    Created on : 20-01-2020, 11:38:36 AM
    Author     : ServicioSocial
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="com.modelo.Validar"%>
<%@page import="javax.persistence.Convert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Estilo/Login.css" rel="stylesheet" type="text/css"/>
    
    </head>
    <body >
        
    <div class="page" id="fondo">
          <form action="procesarLoguin" method="get">
  <div class="container">
    <div class="left" style="background-color: rgba(255, 255, 255, 0.7);">
      <div class="login">Login</div>
      <div class="eula" style="color: black">Bienvenido al portal de control de horas sociales!!!</div>
    </div>
    <div class="right" style="background-color: rgba(25, 25, 25, 0.6);">
     
      <div class="form">
        <label for="Usuario">Usuario</label>
        <input type="text" id="Usuario" name="txtUsuario">
        <label for="password">Password</label> 
        <input type="password" id="password" name="txtPassword" >
        <input type="submit" id="submit" value="Submit" name="btnEnviar">
      </div>
    </div>
  </div>
</div>
        </form>
    </body>
     
</html>
<%  
    Validar obj = new Validar();
    if(request.getParameter("btnEnviar")!=null){
        String usuario= request.getParameter("txtUsuario");
        String clave= request.getParameter("txtPassword");
        String clavemd5=DigestUtils.md5Hex(clave); 
        HttpSession sesion=request.getSession();
        switch(obj.validarUsuario(usuario, clavemd5)){
            case 1:
                sesion.setAttribute("user", "usuario");
                sesion.setAttribute("nivel", "1");
                response.sendRedirect("Home.jsp");
            break;
            case 2:
                sesion.setAttribute("user", "usuario");
                sesion.setAttribute("nivel", "2");
                response.sendRedirect("Invitado.jsp");
            break;
            default:
                out.write("Usuario no exite o contraseña incorrecta");
                break;
        }
    }



    if(request.getParameter("cerrar")!=null){
        session.invalidate();
    }
%>