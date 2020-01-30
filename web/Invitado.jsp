<%-- 
    Document   : Home
    Created on : 21-01-2020, 09:16:23 PM
    Author     : ServicioSocial
--%>
<% 
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
<!-- Las configuracion del estilo y demas puedes encontrarlos en la carpeta assets-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
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
    </head>

    <body>
        <!-- Contenedor principal-->
        <div class="wrapper">
            <!--Barra lateral conde se encuentran las paginas a las que podemos acceder-->
            <div class="sidebar" data-image="assets/img/faces/fondo.jpeg" data-color="black">

                <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
    
            Tip 2: you can also add an image using data-image tag
                -->
                <!--Inicia contenedor para la barra lateral-->
                <div class="sidebar-wrapper" >
                    <!--Encabezado -->
                    <div class="logo">
                        <a href="Invitado.jsp" class="simple-text">
                            CONTROL DE HORAS
                        </a>
                    </div>
                    <!--Listado de paginas a la cuales podemos acceder-->
                    <ul class="nav">
                        <!--La clase active me permite remarcar o resaltar un elemento al cargar la pagina en este caso
                        se usa para indicar la pagina en la que nos encontramos-->
                        <li class="nav-item active">
                            <a class="nav-link" href="Invitado.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                          <li>
                            <a class="nav-link" href="solicitudes.jsp">
                                <i class="nc-icon nc-single-copy-04"></i>
                                <p>SOLICITUDES </p>
                            </a>
                        </li>
                        <li >
                            <a class="nav-link" href="llenarHSS.jsp">
                                <i class="nc-icon nc-tap-01"></i>
                                <p>SERVICIO SOCIAL</p>
                            </a>
                        </li>
                        <li >
                            <a class="nav-link" href="ControlHoras.jsp">
                                <i class="nc-icon nc-bullet-list-67"></i>
                                <p>CONTROL HORAS</p>
                            </a>
                        </li>
                        <li >
                             <a class="nav-link" href="HorasYAct.jsp">
                                <i class="nc-icon nc-paper-2"></i>
                                <p>HORARIO Y ACTIVIDADES</p>
                            </a>
                        </li>
                          <li  >
                            <a class="nav-link" href="FinSse.jsp">
                                <i class="nc-icon nc-puzzle-10"></i>
                                <p>FORMULARIO FINAL SSE </p>
                            </a>
                        </li>
                      <li>
                            <a class="nav-link" href="reportes.jsp">
                                <i class="nc-icon nc-notes"></i>
                                <p>REPORTES</p>
                            </a>
                        </li>    
                        <!--Insercion de logotipo en nuestro menu lateral-->
                        <center><!--centramos la imagen-->
                        <img src="assets/img/faces/12.png" alt="" class="logotipo"/><!--Imagen que sive como logotipo-->
                        </center>
                    </ul>

                </div><!--fin del contenedo de nuestro menu lateral-->
            </div><!--Fin del contenedor padre de barra lateral-->
            <!--Header-->
            
            <div class="main-panel" style="background-image: url('assets/img/faces/fondo.jpeg')"  >
                <!-- Navbar en header -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500" style="background-color:#D50B0B" ><!--con la propiedad background defino el colo de fondo del header-->
                    <div class="container-fluid"  >
                         <!--Inicio del contenido del header-->
                        <a class="navbar-brand" href="" style="color: white"> Dashboard </a>
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
                                    <a class="nav-link" href="#pablo">
                                        <span class="no-icon" style="color: white">Account</span>
                                    </a>
                                </li>
                                <!--  <li class="nav-item dropdown">
                                       <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                           <span class="no-icon">Dropdown</span>
                                       </a>
                                       <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                           <a class="dropdown-item" href="#">Action</a>
                                           <a class="dropdown-item" href="#">Another action</a>
                                           <a class="dropdown-item" href="#">Something</a>
                                           <a class="dropdown-item" href="#">Something else here</a>
                                           <div class="divider"></div>
                                           <a class="dropdown-item" href="#">Separated link</a>
                                       </div>
                                   </li>-->
                                <li class="nav-item">
                                    <a class="nav-link" href="#pablo">
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
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <!--Espacio para el contenido-->
                <div class="content"  >
                    <div class="container-fluid" >
                        <div class="row">
                            <div class="col-md-4" >
                                <!--Inserte contenido aqui-->
                            </div>
                            <div class="col-md-8">
<!--Inserte contenido aqui-->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
<!--Inserte contenido aqui-->
                        </div>
                        <div class="col-md-6">
<!--Inserte contenido aqui-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin de espacio de contenido-->
            <!-- Footer-->
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <!--Inicio de contenido en footer-->
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
                            <script><!--Scrip que permite obrtener la fecha del ordenador y mostrarla -->
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
<script src="assets/js/demo.js"></script>
<script type="text/javascript"><!--Scrip de mensaje flotante que muestra texto de bienvenida se configura en /js/demo.js funcion hasta el final de es documento-->
                                $(document).ready(function () {
                                    // Javascript method's body can be found in assets/js/demos.js
                                    demo.initDashboardPageCharts();

                                    demo.showNotification();

                                });
</script>
<script src="https://account.snatchbot.me/script.js"></script>

</html>

