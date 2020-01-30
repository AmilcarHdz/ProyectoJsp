<%-- 
    Document   : Solicitudes
    Created on : 21-01-2020, 10:44:30 PM
    Author     : ServicioSocial
--%>
<% 
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
<%@page import="com.modelo.DaoSse"%>
<%@page import="com.modelo.Sse"%>
<%@page import="com.modelo.DaoEstudiante"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Carrera"%>
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



        function cargar(Id, sede, estudiante, institucion, comentarios, destinatario, estadosol, carnet, fecha, estado)
        {
            document.frmSse.txtId.value = Id;
            document.frmSse.sede.value = sede;
            document.frmSse.txtNombre.value = estudiante;
            document.frmSse.txtInstitucion.value = institucion;
             document.frmSse.txtComentarios.value = comentarios;
            document.frmSse.txtDestinatario.value = destinatario;           
             document.frmSse.txtEstadoSol.value = estadosol;
            document.frmSse.txtCarnete.value = carnet;
             document.frmSse.txtfecha.value = fecha;
            document.frmSse.txtEstado.value = estado;
            
           document.getElementById("txtCarnete").disabled=true;
            document.getElementById("sede").disabled=true;
             document.getElementById("txtInstitucion").disabled=true;
              document.getElementById("txtDestinatario").disabled=true;
               document.getElementById("txtfecha").disabled=true;
                
            document.getElementById("txtCarnete").hidden=true;
          
           
        }
          function limpiar()
        {
         
           document.getElementById("frmSse").reset();
     
        }
    </script>
    <%
        DaoEstudiante daoE = new DaoEstudiante();
        DaoSse daoS = new DaoSse();
        Sse se = new Sse();
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
                        
                        <li  class="nav-item active">
                            <a class="nav-link" href="solicitudes.jsp">
                                <i class="nc-icon nc-single-copy-04"></i>
                                <p>SOLICITUDES </p>
                            </a>
                        </li>

                        <!--<li>
                            <a class="nav-link" href="reportes.jsp">
                                <i class="nc-icon nc-notes"></i>
                                <p>REPORTES</p>
                            </a>
                        </li>-->  
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
                        <a class="navbar-brand" href="" style="color: white"> Servicio social </a>
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
                                    <% HttpSession sesion = request.getSession();
                                        String usuario;
                                        String nivel;
                                        if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                                            usuario = sesion.getAttribute("user").toString();
                                            nivel = sesion.getAttribute("nivel").toString();
                                            out.print("<a href='index.jsp?cerrar=true'><button class='btn btn-danger' style='color: white' >Cerrar Sesion</button></a>");
                                        } else {
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
                        <form action="procesarSse" name="frmSse" method="get">
                            <div class="row" style="color: white">
                                <div class="col-md-6 ">
                                    <p>Fecha de solicitud </p> 
                                    <input type="txt" placeholder="yyyy-MM-dd" class="form-control" name="txtfecha" id="txtfecha"  >
                                    <p>Sede </p> 
                                    <select name="sede" class="form-control" required="true" id="sede">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Sede Santa Tecla">Sede Santa Tecla</option>
                                        <option value="Regional La Union">Regional La Union</option>
                                        <option value="Regional San Miguel">Regional San Miguel</option>
                                        <option value="Regional Santa Ana">Regional Santa Ana</option>
                                        <option value="Regional Zacatecoluca">Regional Zacatecoluca</option>
                                    </select>
                                    <p>Nombre completo </p> 
                                    <input type="text" class="form-control"  name="txtNombre" id="txtNombre">            
                                    <label id="error42" style="color:red"></label><br>
                                    
                                    <p>Nombre de la institucion de servicio social </p> 
                                    <input  type="text" name="txtInstitucion" id="txtInstitucion" class="form-control"   >                    
                                      <label id="error43" style="color:red"></label><br>
                                    
                                
                                </div>
                                <div class="col-md-6">
                                    <p>Nombre de destinatario de carta </p> 
                                    <input type="text" name="txtDestinatario" id="txtDestinatario" class="form-control"  >
                                     <label id="error44" style="color:red"></label><br>
                                    
                                    
                                    <p>Numero de carnet </p> 
                                    <input  type="text" name="txtCarnete" id="txtCarnete" class="form-control"   >  
                                     <label id="error45" style="color:red"></label><br>
                                     
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
                                   Estado solicitud <select name="txtEstadoSol"  id="txtEstadoSol" class="form-control">
                                        <option value="Pendiente">Pendiente</option>
                                        <option value="Aprovada">Aprovada</option>
                                        <option value="Revisar">Revisar</option>
                                    </select>
                                   
                                </div>
                            </div>
                            <div class="row" style="color: white">
                                <div class="col-md-6">
                                    <p>Comentarios adicionales:</p>
                                    <textarea class="form-control" style="height:  100px;"  name="txtComentarios" id="txtComentarios">Sin comentarios</textarea>
                                     <label id="error46" style="color:red"></label><br>
                                </div>
                                <div class="col-md-6">   
                                     
                                    <input type="text" class="form-control" name="txtEstado"  id="txtEstado" value="1"  hidden="true">   
                                    <input type="text" class="form-control" name="txtId"  id="txtId" value="0"  hidden="true">  
                                    <input type="submit"onclick="return validar();" class="btn btn-primary" value="Enviar" name="btnInsertar" disabled="true">
                                    <input type="submit" class="btn btn-warning" value="Modificar" name="btnModificarC" >
                                    <input type="submit" class="btn btn-twitter" value="Eliminar" name="btnEliminar" disabled="true" >
                                    <input type="reset" class="btn btn-danger" value="Limpiar" >
                                </div>
                                
                                
                                  <script type="text/javascript">
                                    function validar(){
                                        
                                        
                                     
                                       if(!validar_nombre_completo() ||!validar_nombre_Institucion() || !validar_nombre_comentario() || !validar_Destinatario() || !validar_carnet()){
                                           
                                           validar_nombre_completo();
                                           validar_nombre_Institucion(); 
                                           validar_nombre_comentario(); 
                                           validar_Destinatario(); 
                                           validar_carnet();
                                           
                                           return false;
                                           
                                       }
                                        
                                    }
                                    
                                    function validar_nombre_completo(){
                                        
                                        var nombre =document.frmSse.txtNombre.value;
                                        var error42=document.getElementById("error42");
                                        var valida=/^[a-z-A-Z]{1,50}$/;
                                        if(nombre ===""){
                                            error42.textContent="* Error necesita ingresar nombre";
                                            return  false;
                                            
                                        }else if(nombre.length>50){
                                             error42.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error42.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                         function validar_nombre_Institucion(){
                                        
                                        var nombreins =document.frmSse.txtInstitucion.value;
                                        var error43=document.getElementById("error43");
                                        var valida=/^[a-z-A-Z]{1,70}$/;
                                        if(nombreins ===""){
                                            error43.textContent="* Error necesita ingresar nombre Insitucion";
                                            return  false;
                                            
                                        }else if(nombreins.length>70){
                                             error43.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombreins)){
                                            
                                              error43.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                            function validar_nombre_comentario(){
                                        
                                        var nombrecon =document.frmSse.txtComentarios.value;
                                        var error46=document.getElementById("error46");
                                        var valida=/^[a-z-A-Z]{1,500}$/;
                                        if(nombrecon ===""){
                                            error46.textContent="* Error necesita ingresar Comentario";
                                            return  false;
                                            
                                        }else if(nombrecon.length>500){
                                             error46.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombrecon)){
                                            
                                              error46.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    
                                    function validar_Destinatario(){
                                        
                                        var nombreides=document.frmSse.txtDestinatario.value;
                                        var error44=document.getElementById("error44");
                                        var valida=/^[a-z-A-Z]{1,70}$/;
                                        if(nombreides ===""){
                                            error44.textContent="* Error necesita ingresar nombre de destinatario";
                                            return  false;
                                            
                                        }else if(nombreides.length>70){
                                             error44.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombreides)){
                                            
                                              error44.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    
                                     function validar_carnet(){
                                        
                                        var canet =document.frmSse.txtCarnete.value;
                                        var error45=document.getElementById("error45");
                                        var valida=/^[0-9]*{1,11}$/;
                                        if(canet ===""){
                                            error45.textContent="* Error necesita ingresar carnet";
                                            return  false;
                                            
                                        }else if(canet.length>11){
                                             error45.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(canet)){
                                            
                                              error45.textContent="* Error solo se permite numero";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                         
                                    }
                                    
                                    
                                </script>
                                
                                
                            </div>
                            <br><br> 
 <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px;">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Sede</th>
                                                <th>Estudiante</th>
                                                <th>Insititucion</th>
                                                <th>Destinatario</th>
                                                <th>Comentarios</th>
                                                <th>EstadoSolicitud</th>
                                                <th>Carnet</th>
                                                <th>Fecha</th>
                                                <th>estado</th>
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                

                                                    List<Sse> list = daoS.mostrarSseA();
                                                    for (Sse es : list) {
                                            %>
                                            <tr>
                                                <td><%= es.getIdSse()%></td>
                                                <td><%= es.getSede()%></td>
                                                <td><%= es.getNombreEstudiante()%></td>
                                                <td><%= es.getNombreIns()%></td>
                                                <td><%= es.getDestinatarios()%></td>
                                                <td><%= es.getComentarios()%></td>
                                                <td><%= es.getEstadoSol()%></td>
                                                <td><%= es.getCarnetEstudiante()%></td>
                                                <td><%= es.getFecha()%></td>
                                                <td><%= es.getEstado()%></td>


                                                <td><a href="javascript:cargar
                                                       ('<%= es.getIdSse()%>',
                                                       '<%= es.getSede()%>',
                                                       '<%= es.getNombreEstudiante()%>',                                                       
                                                       '<%= es.getNombreIns()%>',
                                                        '<%= es.getComentarios()%>',
                                                       '<%= es.getDestinatarios()%>', 
                                                       '<%= es.getEstadoSol()%>',
                                                       '<%= es.getCarnetEstudiante()%> ',
                                                       '<%= es.getFecha()%> ',
                                                       '<%= es.getEstado()%>')">Seleccionar
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
                    <br>
                  
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

</script>
</html>


