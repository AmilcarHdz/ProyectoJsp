<%-- 
    Document   : Home
    Created on : 20-01-2020, 09:16:23 PM
    Author     : ServicioSocial
--%>

<%@page import="com.modelo.DaoEstudiante"%>
<%@page import="com.modelo.Carrera"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.ControlHoras"%>
<%@page import="com.modelo.DaoControlHoras"%>
<!-- Las configuracion del estilo y demas puedes encontrarlos en la carpeta assets-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
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



        function cargar(Id, sedes, estudiante, escuela, carrera, carnet, estado)
        {
            document.frmHoras.txtCodigo.value = Id;
            document.frmHoras.sede.value = sedes;
            document.frmHoras.txtNombre.value = estudiante;
            document.frmHoras.Escuela.value = escuela;
            document.frmHoras.selectCarrera.value = carrera;
            document.frmHoras.txtCarnet.value = carnet;
            document.frmHoras.txtEstado.value = estado;
              document.getElementById("txtCarnet").hidden= true;
                document.getElementById("btnInsertar").disabled = true;
        }

        function cargar2(Id, IdH, fecha, actividades, horas, estadoA)
        {

            document.frmAct.txtIdAct.value = Id;
            document.frmAct.txtCarnetAct.value = IdH;
            document.frmAct.txtfechact.value = fecha;
            document.frmAct.txtAct.value = actividades;
            document.frmAct.txtHoras.value = horas;
            document.frmAct.txtEstadoAct.value = estadoA;
            document.getElementById("txtCarnetAct").hidden = true;
            document.getElementById("btnInsertarAct").disabled = true;
        }
    </script>
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
                        <a href="Home.jsp" class="simple-text">
                            CONTROL DE HORAS
                        </a>
                    </div>
                    <!--Listado de paginas a la cuales podemos acceder-->
                    <ul class="nav">
                        <li >
                            <a class="nav-link" href="Home.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li  class="nav-item active">
                            <a class="nav-link" href="ControlHoras.jsp">
                                <i class="nc-icon nc-bullet-list-67"></i>
                                <p>CONTROL HORAS</p>
                            </a>
                        </li>
                        <!--<li>
                            <a class="nav-link" href="reportes.jsp">
                                <i class="nc-icon nc-notes"></i>
                                <p>REPORTES</p>
                            </a>
                        </li>-->                       
                            <!--Insercion de logotipo en nuestro menu lateral-->
                            <center><!--centramos la imagen-->
                                <img src="assets/img/faces/3.png" alt="" class="logotipo"/><!--Imagen que sive como logotipo-->
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
                                        <% HttpSession sesion = request.getSession();
                                            String usuario;
                                            String nivel;
                                            if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                                                usuario = sesion.getAttribute("user").toString();
                                                nivel = sesion.getAttribute("nivel").toString();
                                                if (nivel == "2") {
                                                    response.sendRedirect("Invitado.jsp");
                                                }
                                                out.print("<a href='index.jsp?cerrar=true'><button class='btn btn-danger' style='color: white' >Cerrar Sesion</button></a>");
                                            } else {
                                                response.sendRedirect("index.jsp");
                                            }
                                            DaoControlHoras daoH = new DaoControlHoras();
                                            ControlHoras Ch = new ControlHoras();
                                            DaoEstudiante daoE = new DaoEstudiante();
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
                        <form action="procesarControlHoras" name="frmHoras"  method="POST">
                            <div class="row" style="color: white">
                                <div class="col-md-6 ">
                                    Sede   <select name="sede" class="form-control" required="true" id="sede" required="true">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Sede Santa Tecla">Sede Santa Tecla</option>
                                        <option value="Regional La Union">Regional La Union</option>
                                        <option value="Regional San Miguel">Regional San Miguel</option>
                                        <option value="Regional Santa Ana">Regional Santa Ana</option>
                                        <option value="Regional Zacatecoluca">Regional Zacatecoluca</option>
                                    </select>                                  
                                   
                                   Nombre<input type="text" name="txtNombre"  class=" required form-control " pattern="[A-Za-z]*"  required="true"/>
                                   <label id="error47" style="color:blue"></label><br>
                                   Escuela  <select name="Escuela" class="form-control" required="true" id="Escuela" required="true">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Computacion">Computacion</option>
                                        <option value="Mecatronica">Mecatronica</option>
                                        <option value="Mecanica">Mecanica</option>
                                        <option value="Arquitectura">Arquitectura</option>
                                        <option value="Gastronomia">Gastronomia</option>
                                        <option value="Quimica">Quimica</option>
                                    </select> 
                                    <br>
                                    <input type="text" name="txtCodigo"  id="txtCodigo" class="required form-control  "  required="true" value="0" hidden="true" /><br>
                                </div>
                                <div class="col-md-6">
                                  
                                    Carrera <select name="selectCarrera" class="form-control" required="true" id="selectCarrera" required="true">
                                        <%
                                            List<Carrera> listC = daoE.listarCarreras();
                                            for (Carrera c : listC) {
                                        %>
                                        <option value="<%=c.getNombre()%>">
                                            <%=c.getNombre()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select><br>
                                      Carnet Estudiante<input type="text" name="txtCarnet"  id="txtCarnet" class="required form-control  " required="true"  />
                                    <label id="error10" style="color:blue"></label><br>
                                    <input type="text" name="txtEstado" id="txtEstado" class="form-control"  required="true" value="1" hidden="true"/><br>                                   
                                    <input type="submit" onclick="return validar();" name="btnInsertar" id="btnInsertar" value="Insertar" class="btn btn-primary">
                                    <input type="submit" name="btnModificar" value="Modificar" class="btn btn-dark">
                                    <input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-facebook">
                                </div>
                                    
                                    
                                    
                               <script type="text/javascript">
                                    function validar(){
                                        
                                        
                                      if(!validar_nombre() || !validar_carnet()){
                                          
                                          validar_nombre();
                                          validar_carnet();
                                          
                                          return false;
                                        
                                    }
                                      
                                      
                                    function validar_nombre(){
                                        
                                        var nombre =document.frmHoras.txtNombre.value;
                                        var error=document.getElementById("error47");
                                        var valida=/^[a-z-A-Z]$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar nombre";
                                            return  false;
                                            
                                        }
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                           function validar_carnet(){
                                        
                                        var password =document.frmHoras.txtCarnet.value;
                                        var error10=document.getElementById("error10");
                                        
                                        if(password ===""){
                                            error10.textContent="* Error necesita ingresar Carnet";
                                            return  false;
                                            
                                        }else if(password.length>50){
                                             error10.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else{
                                            return true;
                                        }
                                    }
                                    
                                    
                                </script>     
                                    
                                    
                                    
                                    
                                    
                            </div>
                        </form>
                    </div><br><br>
                    <div class="container-fluid" style=" background-color: currentColor; border-radius: 20px; " >
                        <form action="#" name="frmbus" method="get"><br>
                            <div class="row" style="color: white">
                                <div class="col-md-6">
                                    Carnet Estudiante
                                    <input type="text" name="txtCarnetBus"  class=" required form-control "  value=" "/><br>
                                <label id="error11" style="color:red"></label>
                                </div>
                                <div class="col-md-6">
                                    <br>
                                    <input type="submit" onclick="return valid();" name="btnBuscar" id="btnBuscar" value="Buscar" class="btn btn-primary" >   
                                </div>
                                
                       <script>
      
                                     function valid(){
                                        
                                        
                                       return valid_buscar();
                                        
                                    }
                                    
                                    function valid_buscar(){
                                        
                                        var nombre =document.frmbus.txtCarnetBus.value;
                                        var error11=document.getElementById("error11");
                                       
                                        if(nombre ===""){
                                            error11.textContent="* Error necesita ingresar carnet";
                                            return  false;
                                            
                                        }else if(nombre.length>11){
                                             error11.textContent="* Error demaciados carracteres";
                                            return  false;
                                        
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                 
                                    
                                    
                                </script>
                                
                                
                                
                                
                                
                            </div>
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px;">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Sede</th>
                                                <th>Estudiante</th>
                                                <th>Escuela</th>
                                                <th>Carrera</th>
                                                <th>Carnet Estudiante</th>
                                                <th>Estado</th>                                                                                               
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (request.getParameter("btnBuscar") != null) {
                                                    Ch.setIdEstudiante(Integer.parseInt(request.getParameter("txtCarnetBus")));
                                                    List<ControlHoras> list = daoH.mostrarHoarasB(Ch);
                                                    for (ControlHoras co : list) {
                                            %>
                                            <tr>
                                                <td><%= co.getIdRegistroHoras()%></td>
                                                <td><%= co.getSedeEstudio()%></td>
                                                <td><%= co.getNombreEstudiante()%></td>                                             
                                                <td><%= co.getEscuela()%></td>
                                                <td><%= co.getNombreCarrera()%></td>
                                                <td><%= co.getIdEstudiante()%></td>
                                                <td><%= co.getEstadollenar()%></td>
                                                <td><a href="javascript:cargar
                                                       ('<%= co.getIdRegistroHoras()%>',
                                                       '<%= co.getSedeEstudio()%>',
                                                       '<%= co.getNombreEstudiante()%>',
                                                       '<%= co.getEscuela()%>',
                                                       '<%= co.getNombreCarrera()%>',
                                                       '<%= co.getIdEstudiante()%>',
                                                       '<%= co.getEstadollenar()%>')">Seleccionar
                                                    </a>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </form>                                                                            
                    </div><br><br>
                    <div class="container-fluid" style=" background-color: currentColor; border-radius: 20px; " >
                        <form action="procesarControlHoras" name="frmAct"  method="POST">
                            <div class="row" style="color: white">
                                <div class="col-md-6 ">
                                    Fecha<input type="text" name="txtfechact" id="txtfechact"  class=" required form-control " placeholder="yyyy-MM-dd"  />   
                                    
                                    Activida Realizada<textarea  name="txtAct" id="txtAct"  class=" required form-control "  ></textarea><br>
                                    <label id="error12" style="color:red"></label><br>
                                    <input type="submit"onclick="return validar();" name="btnInsertarAct" id="btnInsertarAct" value="Insertar" class="btn btn-primary">
                                    <input type="submit" name="btnModificarAct" value="Modificar" class="btn btn-dark">
                                    <input type="submit" name="btnEliminarAct" value="Eliminar" class="btn btn-danger">
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-facebook">
                                    <br><br>
                                </div> 
                                <div class="col-md-6 ">
                                    Horas Diarias<input type="number" name="txtHoras" id="txtHoras"  class=" required form-control "  /> 
                                    <label id="error13" style="color:red"></label><br>
                                   
                               Carnet Estudiante<input type="text" name="txtCarnetAct"  id="txtCarnetAct" class=" required form-control "  /><br>
                                    <input type="text" name="txtEstadoAct"  id="txtEstadoAct" class=" required form-control "  value="1" hidden="true"/>
                                    <input type="text" name="txtIdAct"  id="txtIdAct" class=" required form-control " required="true" value="0" hidden="true"/>
                                    <br>                   
                                </div> 
                               </div>
                                <script type="text/javascript">
                                 function validar(){
                                        
                                        
                                        
                                       if(!validar_Actividad() ||!validar_horas()){
                                           
                                           validar_Actividad(); 
                                           validar_horas();
                                           
                                           return false;
                                           
                                       }
                                        
                                    }
                                    
                                    function validar_Actividad(){
                                        
                                        var nombreAc =document.frmAct.txtNombre.value;
                                        var error=document.getElementById("error12");
                                        var valida=/^[a-z-A-Z]$/;
                                        if(nombreAc ===""){
                                            error.textContent="* Error necesita ingresar Actividad";
                                            return  false;
                                            
                                        
                                        }else if(!valida.test(nombreAc)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                           function validar_horas(){
                                        
                                        var horas =document.frmAct.txtHoras.value;
                                        var error2=document.getElementById("error13");
                                         
                                        if(password ===""){
                                            error12.textContent="* Error necesita ingresar Horas";
                                            return  false;
                                            
                                        }else if(horas.length>50){
                                             error12.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else{
                                            return true;
                                        }
                                    }
                                    
                                    
                                </script>
                                
                            </div>
                       </form>
                        <br>
                    </div>
                    <br>
                    <br>
                    <div class="container-fluid" style=" background-color: currentColor; border-radius: 20px; " >
                        <form action="#"name="frmss" method="get" ><br>
                            <div class="row" style="color: white">
                                <div class="col-md-6">
                                    Carnet Estudiante
                                    <input type="text" name="txtCarnetBusAct"  class=" required form-control " /><br>
                                <label id="error13" style="color:red"></label><br>
                                </div>
                                <div class="col-md-6">
                                    <br>
                                    <input type="submit" onclick="return validar();" name="btnBuscarAct" id="btnBuscarAct" value="Buscar" class="btn btn-primary" >   
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
                                        
                                        var nombre =document.frmss.txtCarnetBusAct.value;
                                        var error13=document.getElementById("error13");
                                        var valida=/^[0-9]{1,11}$/;
                                        if(nombre ===""){
                                            error13.textContent="* Error necesita ingresar carnet de estudiante";
                                            return  false;
                                            
                                        }else if(nombre.length>11){
                                             error13.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error13.textContent="* Error solo se permite Numeros";
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
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px;">
                                        <thead>
                                            <tr>
                                                <th>Id </th>
                                                <th>Id Registro</th>
                                                <th>Fecha</th>
                                                <th>Actividad</th>
                                                <th>Horas Diarias</th>                                                
                                                <th>Estado</th>                                                                                               
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (request.getParameter("btnBuscarAct") != null) {
                                                    int ca = Integer.parseInt(request.getParameter("txtCarnetBusAct"));
                                                    int cw = daoH.buscarHoras(ca);
                                                    if (daoH.buscarHoras(ca) > 0) {
                                                        List<ControlHoras> list = daoH.mostrarHorACT(cw);
                                                        for (ControlHoras co : list) {
                                            %>
                                            <tr>
                                                <td><%= co.getIdLlenar()%></td>
                                                <td><%= co.getIdRHoras()%></td>
                                                <td><%= co.getFechaAct()%></td>                                             
                                                <td><%= co.getActividad()%></td>
                                                <td><%= co.getHorasD()%></td>
                                                <td><%= co.getEstadoDetalleH()%></td>
                                                <td><a href="javascript:cargar2
                                                       ('<%= co.getIdLlenar()%>',
                                                       '<%= ca%>',
                                                       '<%= co.getFechaAct()%>',
                                                       '<%= co.getActividad()%>',
                                                       '<%= co.getHorasD()%>',
                                                       '<%= co.getEstadoDetalleH()%>')">Seleccionar
                                                    </a>
                                                </td>
                                            </tr>
                                            <%
                                                        }
                                                    }
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
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<script src="assets/js/demo.js"></script>
<script src="https://account.snatchbot.me/script.js">
    
</script>
</html>

