
<%-- 
    Document   : Carrera
    Created on : 20-01-2020, 09:39:45 PM
    Author     : ServicioSocial
--%>
<% 
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
<%@page import="com.modelo.DaoCoordinador"%>
<%@page import="com.modelo.Coordinador"%>
<%@page import="com.modelo.DaoCoordinador"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Control de Horas</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" type="text/css"/>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/css/demo.css" rel="stylesheet" type="text/css"/>
           
        <script>
           
        
                
            function cargar(codigo, nombre, edad, sexo, correo)
            {
                document.frmCoordinador.txtCodigo.value = codigo;
                document.frmCoordinador.txtNombre.value = nombre;
                document.frmCoordinador.txtEdad.value = edad;
                document.frmCoordinador.txtSexo.value = sexo;
                document.frmCoordinador.txtCorreo.value = correo;
            }
        </script>
        <%
            if (request.getAttribute("msj") != null) {
        %>
        <script type="text/javascript">
            alert('<%= request.getAttribute("msj")%>');
        </script>
        <%
            }
        %>
    </head>
    <%
        DaoCoordinador daoC = new DaoCoordinador();
    %>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-image="assets/img/faces/fondo.jpeg" data-color="black">

                <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
    
            Tip 2: you can also add an image using data-image tag
                -->
                <div class="sidebar-wrapper" >
                    <div class="logo">
                        <a href="Home.jsp" class="simple-text">
                            CONTROL DE HORAS
                        </a>
                    </div>
                    <ul class="nav">
                        <li >
                            <a class="nav-link" href="Home.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>                       
                        <li class="nav-item active">
                            <a class="nav-link" href="Coordinador.jsp">
                                <i class="nc-icon nc-attach-87"></i>
                                <p>COORDINADOR</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="reportes.jsp">
                                <i class="nc-icon nc-notes"></i>
                                <p>REPORTES</p>
                            </a>
                        </li>  
                        <center>
                            <img src="assets/img/faces/3.png" alt="" class="logotipo"/>
                        </center>
                    </ul>

                </div>
            </div>
            <!--Fin del header-->
            <!--Menu lateral-->
            <div class="main-panel" style="background-image: url('assets/img/faces/fondo.jpeg')"  >
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500" style="background-color:#D50B0B" >
                    <div class="container-fluid"  >
                        <a class="navbar-brand" href="" style="color: white"> Coordinador </a>
                        <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar burger-lines"></span>
                            <span class="navbar-toggler-bar burger-lines"></span>
                            <span class="navbar-toggler-bar burger-lines"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <ul class="nav navbar-nav mr-auto">

                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="nc-icon nc-zoom-split" style="color: white"></i>
                                        <span class="d-lg-block" style="color: white" >&nbsp;Search</span>
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ml-auto">
                                                        
                                <li class="nav-item">
                                   <% HttpSession sesion=request.getSession();
 String usuario;
 String nivel;
 if (sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null) {
         usuario=sesion.getAttribute("user").toString();
         nivel=sesion.getAttribute("nivel").toString();
         out.print("<a href='index.jsp?cerrar=true'><button class='btn btn-danger' style='color: white' >Cerrar Sesion</button></a>");
     }
 else{
     response.sendRedirect("index.jsp");
 }
%> 
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <!--Espacio para el contenido-->
                <div class="content"  >
                    <div class="container-fluid" style=" background-color: currentColor; border-radius: 20px; " >
                        <form action="procesarCoordinador" name="frmCoordinador"  method="POST">
                            <div class="row" style="color: white">

                                <div class="col-md-6 ">
                                    Codigo<input type="text" name="txtCodigo"  id="txtCodigo" class="required form-control  "  required="true" /><br>
                                    Nombre<input type="text" name="txtNombre"  class=" required form-control " pattern="[A-Za-z]*" required="true" /><br>
                                   
                                    Sexo: &nbsp;
                                    Masculino<input type="radio" name="txtSexo" value="Masculino"  class="radio-inline" required="true">
                                    Femenino<input type="radio" name="txtSexo" value="Femenino"  class="radio-inline"  required="true">     
                                </div>
                                <div class="col-md-6">
                                    Edad<input type="text" name="txtEdad" class="form-control" pattern="[0-9]*" required="true"/><br>
                                    Correo<input type="text" name="txtCorreo" class="form-control"  required="true"/><br>
                                    <input type="submit" name="btnInsertar" id="btnInsertar" value="Insertar" class="btn btn-primary">
                                    <input type="submit" name="btnModificar" value="Modificar" class="btn btn-dark">
                                    <input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-facebook">
                                </div>
                            </div>
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table  class="table table-dark table-hover" style="background-color: captiontext; border-radius: 10px;">
                                        <thead>
                                            <tr>
                                                <th>Codigo Coordinador</th>
                                                <th>Nombre</th>
                                                <th>Edad</th>
                                                <th>Sexo</th>
                                                <th>Correo</th>
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Coordinador> list = daoC.mostrarCoordinador();
                                                for (Coordinador c : list) {
                                            %>
                                            <tr>
                                                <td><%= c.getCodigo()%></td>
                                                <td><%= c.getNombre()%></td>
                                                <td><%= c.getEdad()%></td>
                                                <td><%= c.getSexo()%></td>
                                                <td><%= c.getCorreo()%></td>

                                                <td><a href="javascript:cargar
                                                       (<%= c.getCodigo()%>,
                                                       '<%= c.getNombre()%>',
                                                       <%= c.getEdad()%>,
                                                       '<%= c.getSexo()%>',
                                                       '<%=c.getCorreo()%>')">Seleccionar
                                                    </a>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>

                            </div>

 </form>
                    </div>
                   
                </div>
            </div>
            <!-- Fin de espacio de contenido-->
            <!-- Footer-->
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul class="footer-menu">
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                        <p class="copyright text-center">
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="https://www.itca.edu.sv/">ITCA-FEPADE</a>
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
    <!--   -->

</body>

<!--   Core JS Files   -->
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>
<script src="https://account.snatchbot.me/script.js">
    
</script><script>window.sntchChat.Init(79375)</script>














