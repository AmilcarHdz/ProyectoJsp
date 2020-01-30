<%-- 
    Document   : Estudiante
    Created on : 20-01-2020, 06:15:25 PM
    Author     :ServicioSocial
--%>
<% 
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Carrera"%>
<%@page import="com.modelo.DaoEstudiante"%>
<%@page import="com.modelo.Estudiante"%>
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
            function cargar(codigo, nombre, edad, sexo, correo, estado, sede, carrera)
            {
                document.frmEstudiante.txtCodigo.value = codigo;
                document.frmEstudiante.txtNombre.value = nombre;
                document.frmEstudiante.txtEdad.value = edad;
                document.frmEstudiante.txtSexo.value = sexo;
                document.frmEstudiante.txtCorreo.value = correo;
                document.frmEstudiante.txtEstado.value = estado;
                document.frmEstudiante.txtSede.value = sede;
                document.frmEstudiante.selectCarrera.value = carrera;
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
        DaoEstudiante daoE = new DaoEstudiante();
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
                            <a class="nav-link" href="Estudiante.jsp">
                                <i class="nc-icon nc-attach-87"></i>
                                <p>ESTUDIANTE</p>
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
                        <a class="navbar-brand" href="" style="color: white"> Estudiante </a>
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
                    <div class="container-fluid" style="background-color: currentColor; border-radius: 20px; " >
                        <form action="procesarEstudiante" name="frmEstudiante" method="POST">
                            <div class="row" style="color: white">
                                <div class="col-md-6 ">      
                                    Codigo<input type="text" name="txtCodigo" value="" class="form-control" pattern="[0-9]*" required="true"/><br>
                                    Nombre<input type="text" name="txtNombre" value="" class="form-control" pattern="[A-Za-z]*" required="true"/><br>

                                    Sede<input type="text" name="txtSede" value="" class="form-control"  required="true"/><br>  
                                    Sexo: &nbsp;
                                    Masculino<input type="radio" name="txtSexo" value="Masculino"  class="radio-inline" required="true">
                                    Femenino<input type="radio" name="txtSexo" value="Femenino"  class="radio-inline"  required="true">     <br>
                                     Correo<input type="text" name="txtCorreo" class="form-control"  /><br>
                                </div>
                                <div class="col-md-6">
                                    Edad<input type="text" name="txtEdad" value="" class="form-control" pattern="[0-9]*"/><br>          
                                    Estado <select name="txtEstado"  class="form-control" required="true">
                                         <option value="Seleccione">Seleccione</option>
                                        <option value="En Curso">En curso</option>
                                        <option value="Finalizada">Finalizada</option>
                                    </select><br>
                                    Carrera <select name="selectCarrera" class="form-control" required="true">
                                        <%
                                            List<Carrera> listC = daoE.listarCarreras();
                                            for (Carrera c : listC) {
                                        %>
                                        <option value="<%=c.getCodigo()%>">
                                            <%=c.getNombre()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select><br>
                                    <input type="submit" name="btnInsertar" value="Insertar" class="btn btn-primary">
                                    <input type="submit" name="btnModificar" value="Modificar" class="btn btn-dark">
                                    <input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-facebook">
                                </div>
                            </div>
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px;">
                                        <thead>
                                            <tr>
                                                <th>Codigo Estudiante</th>
                                                <th>Nombre</th>
                                                <th>Edad</th>
                                                <th>Sexo</th>
                                                <th>Correo</th>
                                                <th>Estado</th>
                                                <th>Sede</th>
                                                <th>Carrera</th>
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Estudiante> list = daoE.mostrarEstudiante();
                                                for (Estudiante es : list) {
                                            %>
                                            <tr>
                                                <td><%= es.getCodigo()%></td>
                                                <td><%= es.getNombre()%></td>
                                                <td><%= es.getEdad()%></td>
                                                <td><%= es.getSexo()%></td>
                                                <td><%= es.getCorreo()%></td>
                                                <td><%= es.getEstado()%></td>
                                                <td><%= es.getSede()%></td>
                                                <td><%= es.getCarrera().getCodigo()%></td>

                                                <td><a href="javascript:cargar
                                                       (<%= es.getCodigo()%>,
                                                       '<%= es.getNombre()%>',
                                                       <%=es.getEdad()%>,
                                                       '<%= es.getSexo()%>',
                                                       '<%= es.getCorreo()%>',
                                                       '<%= es.getEstado()%>',
                                                       '<%= es.getSede()%>',
                                                       '<%= es.getCarrera().getCodigo()%>')">Seleccionar
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
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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

