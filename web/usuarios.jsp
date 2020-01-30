<%-- 
    Document   : usuarios
    Created on : 20-01-2020, 06:10:07 PM
    Author     : ServicioSocial
--%>

<% 
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Usuario"%>
<%@page import="com.modelo.DaoUsuario"%>
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
     <script>
           
        
                
            function cargar(codigo, nombre,pass, privilegio,estado)
            {
                document.frmUsuario.txtCod.value = codigo;
                document.frmUsuario.txtNombre.value = nombre;
                document.frmUsuario.txtpass.value = pass;
                document.frmUsuario.cmbPrivilegios.value = privilegio;
                document.frmUsuario.txtEstado.value = estado;
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
        DaoUsuario daoU = new DaoUsuario();
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
                        <li>
                            <a class="nav-link" href="Home.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>                        
                        <li  class="nav-item active">
                            <a class="nav-link" href="usuarios.jsp">
                                <i class="nc-icon nc-single-02"></i>
                                <p>USUARIOS</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="solicitudes.jsp">
                                <i class="nc-icon nc-single-copy-04"></i>
                                <p>SOLICITUDES </p>
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
                        <a class="navbar-brand" href="" style="color: white"> Usuarios </a>
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
                    <div class="container-fluid" style=" background-color: currentColor; border-radius: 20px; " >
                        <form action="procesarUsuario" name="frmUsuario"  method="get">
                            <div class="row" style="color: white">

                                <div class="col-md-6 ">
                                    <input type="text" name="txtCod"  id="txtCod" class="required form-control"   value="0" hidden="true" /><br>
                                    Usuario<input type="text" name="txtNombre"  class=" required form-control "  maxlength="500" /><br>
                                    <label id="error" style="color:red"></label><br>
                                    
                                    Password<input type="password" name="txtpass"  class=" required form-control "  /><br> 
                                    <label id="error2" style="color:red"></label><br>
                                </div>
                                <div class="col-md-6">
                                    <br>
                                    Privilegios<select  name="cmbPrivilegios" class="form-control">
                                        <option value="0">--Seleccione--</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Invitado</option>
                                    </select>   <br><br>                          
                                    <input type="submit" onclick="return validar();" name="btnInsertar" id="btnInsertar" value="Insertar" class="btn btn-primary">
                                    <input type="submit" name="btnModificar" value="Modificar" class="btn btn-dark">
                                    <input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-facebook">
                                    <input type="text" name="txtEstado"  id="txtEstado" class="required form-control  " hidden="true" value="1"  /><br>
                                </div>
                                <script type="text/javascript">
                                    function validar(){
                                        
                                        
                                        
                                       if(!validar_nombre() ||!validar_Password()){
                                           
                                           validar_nombre(); 
                                           validar_Password();
                                           
                                           return false;
                                           
                                       }
                                        
                                    }
                                    
                                    function validar_nombre(){
                                        
                                        var nombre =document.frmUsuario.txtNombre.value;
                                        var error=document.getElementById("error");
                                        var valida=/^[0-9]+*{1,50}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar nombre";
                                            return  false;
                                            
                                        }else if(nombre.length>50){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                           function validar_Password(){
                                        
                                        var password =document.frmUsuario.txtpass.value;
                                        var error2=document.getElementById("error2");
                                        
                                        if(password ===""){
                                            error2.textContent="* Error necesita ingresar password";
                                            return  false;
                                            
                                        }else if(password.length>50){
                                             error2.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else{
                                            return true;
                                        }
                                    }
                                    
                                    
                                </script>
                                
                            </div>
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table  class="table table-dark table-hover" style="background-color: captiontext; border-radius: 10px;">
                                        <thead>
                                            <tr>
                                                <th>Id Usuario</th>
                                                <th>Nombre de usuario</th>
                                                <th>Password</th>
                                                <th>Privilegios</th>
                                                <th>Estado</th>
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Usuario> list = daoU.mostrarUsuario();
                                                for (Usuario u : list) {
                                            %>
                                            <tr>
                                                <td><%= u.getCodigoU()%></td>
                                                <td><%= u.getUsuario()%></td>
                                                <td><%= u.getContrasenia()%></td>
                                                <td><%= u.getPrivilegio()%></td>
                                                <td><%= u.getEstado()%></td>

                                                <td><a href="javascript:cargar
                                                       (<%= u.getCodigoU()%>,
                                                       '<%= u.getUsuario()%>',
                                                      ' <%= u.getContrasenia()%>',
                                                       '<%= u.getPrivilegio()%>','<%= u.getEstado()%>')">Seleccionar
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

<script src="https://account.snatchbot.me/script.js"></script>
<script>window.sntchChat.Init(79375)</script>
</html>

