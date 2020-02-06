<%-- 
    Document   : Home
    Created on : 21-01-2020, 09:16:23 PM
    Author     : ServicioSocial
--%>

<%@page import="com.modelo.HorarioYAct"%>
<%@page import="com.modelo.DaoHorarioYAct"%>
<%@page import="java.util.List"%>
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



        function cargar(Id, Carnet, Actividad, Objetivo, Meta, Duracion, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo, Estudiante, EstadoS, Estado)
        {
            document.frmHorasYAct.txtCodigo.value = Id;
            document.frmHorasYAct.txtCarnetEstudiante.value = Carnet;
            document.frmHorasYAct.txtAct.value = Actividad;
            document.frmHorasYAct.txtObj.value = Objetivo;
            document.frmHorasYAct.txtMeta.value = Meta;
            document.frmHorasYAct.txtDuracion.value = Duracion;
            document.frmHorasYAct.txtLunes.value = Lunes;
            document.frmHorasYAct.txtMartes.value = Martes;
            document.frmHorasYAct.txtMiercoles.value = Miercoles;
            document.frmHorasYAct.txtJueves.value = Jueves;
            document.frmHorasYAct.txtViernes.value = Viernes;
            document.frmHorasYAct.txtSabado.value = Sabado;
            document.frmHorasYAct.txtDomingo.value = Domingo;
            document.frmHorasYAct.txtNom.value = Estudiante;
            document.frmHorasYAct.txtSolicitud.value = EstadoS;
            document.frmHorasYAct.txtEstado.value = Estado; 
  document.getElementById("txtCarnetEstudiante").hidden = true;
    document.getElementById("btnInsertar").disabled = true;
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
                            <a class="nav-link" href="HorasYAct.jsp">
                                <i class="nc-icon nc-paper-2"></i>
                                <p>HORARIO Y ACTIVIDADES</p>
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
                                           DaoHorarioYAct daoH = new DaoHorarioYAct();
                                           HorarioYAct hac=new HorarioYAct();
                                          
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
                        <form action="procesarHorasYAct" name="frmHorasYAct"  method="POST">
                            <div class="row" style="color: white">
                                <div class="col-md-6 ">                                                                    
                                    Carnet Estudiante<input type="text" name="txtCarnetEstudiante" id="txtCarnetEstudiante"  class=" required form-control " pattern="[0-9]+*"  required="ture" />
                                     <label id="error14" style="color:purple"></label><br>
   
                                    Actividad a Realizar<textarea  name="txtAct" id="txtAct"  class=" required form-control " pattern="[A-Za-z]*"   required="ture"></textarea>
                                    <label id="error15" style="color:purple"></label><br>
                                    
                                    Objetivo<textarea  name="txtObj" id="txtObj"  class=" required form-control " pattern="[A-Za-z]*"  required="ture" ></textarea>
                                     <label id="error16" style="color:purple"></label><br>
                                    
                                    Estado de proyecto<select class="form-control" name="txtSolicitud" id="txtSolicitud"  required="ture">
                                        <option value="selecione">---selecione</option>
                                        <option value="Aprovado">Aprovado</option>
                                        <option value="No aprovado">No aprovado</option>
                                    </select>
                                    <br>
                                    <br>
                                </div>
                                <div class="col-md-6">
                                    Meta<textarea  name="txtMeta" id="txtMeta"  class=" required form-control " pattern="[A-Za-z]*"  required="ture" ></textarea>                                   
                                    <label id="error17" style="color:purple"></label><br>
                                    
                                    Duracion en meses<input type="number" name="txtDuracion" id="txtDuracion"  class=" required form-control " pattern="[0-9]+*"  required="ture" />
                                    <label id="error18" style="color:purple"></label><br>
                                    
                                    Nombre Estudiante<input type="text" name="txtNom" id="txtNom"  class=" required form-control " pattern="[A-Za-z]*"  required="ture">
                                     <label id="error19" style="color:purple"></label><br> 
                                    <input type="text" name="txtCodigo"  id="txtCodigo" class="required form-control  "   value="0" hidden="true" />
                                    <input type="text" name="txtEstado"  id="txtEstado" class="required form-control  "   value="1" hidden="true" />

                                </div>
                                <div class="col-md-12"> <br>        
                                  
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px; ">
                                         
                                        <thead>
                                             <h3>Horario</h3>
                                            <tr>
                                                <th>Lunes</th>
                                                <th>Martes</th>
                                                <th>Miercoles</th>
                                                <th>Jueves</th>
                                                <th>Viernes</th>
                                                <th>Sabado</th>
                                                <th>Domingo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th><input type="text" name="txtLunes" id="txtLunes"  class=" required form-control "  placeholder="00am-00pm" ></th>
                                                <label id="error20" style="color:purple"></label><br>
                                                <th><input type="text" name="txtMartes" id="txtMartes"  class=" required form-control " placeholder="00am-00pm" ></th>
                                                <label id="error21" style="color:purple"></label><br>
                                                <th><input type="text" name="txtMiercoles" id="txtMiercoles"  class=" required form-control " placeholder="00am-00pm" ></th>
                                                <label id="error22" style="color:purple"></label><br>
                                                <th><input type="text" name="txtJueves" id="txtJueves"  class=" required form-control " placeholder="00am-00pm" ></th>
                                                <label id="error23" style="color:purple"></label><br>
                                                <th><input type="text" name="txtViernes" id="txtViernes"  class=" required form-control " placeholder="00am-00pm" ></th>
                                                <label id="error24" style="color:purple"></label><br>
                                                <th><input type="text" name="txtSabado" id="txtSabado"  class=" required form-control " placeholder="00am-00pm"  ></th>
                                                <label id="error25" style="color:purple"></label><br>
                                                <th><input type="text" name="txtDomingo" id="txtDomingo"  class=" required form-control " placeholder="00am-00pm" ></th>
                                                <label id="error26" style="color:purple"></label><br>
                                    </tr>
                                        </tbody>
                                    </table>

                                    <input type="submit" onclick="return validar();" name="btnInsertar" id="btnInsertar" value="Insertar" class="btn btn-primary">
                                    <input type="submit" name="btnModificar" value="Modificar" class="btn btn-dark">
                                    <input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-facebook">
                                    <br><br>
                                </div>
                                <br>
                                
                                
                                <script type="text/javascript">
                                    function validar(){
                                        
                                        
                                        
                                       if(!validar_carnetEstdu() ||! validar_Actividad() || ! validar_Objetivo() || !validar_Meta() || !validar_Duraccion() || !validar_NombreEstudiante() || !validar_Lunes() || !validar_Martes() || !validar_Miercoles() || !validar_Jueves() || !validar_Viernes() || !validar_Savado() || !function validar_Domingo()){
                                           
                                           validar_carnetEstdu(); 
                                            validar_Actividad();
                                            validar_Objetivo();
                                            validar_Meta();
                                            validar_Duraccion();
                                            validar_NombreEstudiante();
                                            validar_Lunes();
                                            validar_Martes();
                                            validar_Miercoles();
                                            validar_Jueves();
                                            validar_Viernes();
                                            validar_Savado();
                                            validar_Domingo();
                                           return false;
                                           
                                       }
                                        
                                    }
                                    
                                    function validar_carnetEstdu(){
                                        
                                        var nombre =document.frmHorasYAct.txtCarnetEstudiante.value;
                                        var error=document.getElementById("error14");
                                        var valida=/^[0-9]+*{1,11}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar canet estudiante";
                                            return  false;
                                            
                                        }else if(nombre.length>50){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                      function validar_Actividad(){
                                        
                                        var nombre =document.frmHorasYAct.txtAct.value;
                                        var error=document.getElementById("error15");
                                        var valida=/^[a-z-A-Z]{1,500}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita Actividad";
                                            return  false;
                                            
                                        }else if(nombre.length>500){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    function validar_Objetivo(){
                                        
                                        var nombre =document.frmHorasYAct.txtObj.value;
                                        var error=document.getElementById("error16");
                                        var valida=/^[a-z-A-Z]{1,500}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar Objetivo";
                                            return  false;
                                            
                                        }else if(nombre.length>500){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                      function validar_Meta(){
                                        
                                        var nombre =document.frmHorasYAct.txtMeta.value;
                                        var error=document.getElementById("error17");
                                        
                                        if(nombre ===""){
                                            error.textContent="* Error necesita Meta";
                                            return  false;
                                            
                                        }else if(nombre.length>500){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    
                                     function validar_Duraccion(){
                                        
                                        var nombre =document.frmHorasYAct.txtDuracion.value;
                                        var error=document.getElementById("error18");
                                         var valida=/^[0-9]+*{1,11}$/;

                                        if(nombre ===""){
                                            error.textContent="* Error necesita Duraccion";
                                            return  false;
                                            
                                        }else if(nombre.length>11){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }
                                        else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    function validar_NombreEstudiante(){
                                        
                                        var nombre =document.frmHorasYAct.txtNom.value;
                                        var error=document.getElementById("error19");
                                         var valida=/^[a-z-A-Z]{1,70}$/;

                                        if(nombre ===""){
                                            error.textContent="* Error necesita Nombre estudiante";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }
                                        else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                      function validar_Lunes(){
                                        
                                        var nombre =document.frmHorasYAct.txtLunes.value;
                                        var error=document.getElementById("error20");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Lunes";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                          function validar_Martes(){
                                        
                                        var nombre =document.frmHorasYAct.txtMartes.value;
                                        var error=document.getElementById("error21");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Martes";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    function validar_Miercoles(){
                                        
                                        var nombre =document.frmHorasYAct.txtMiercoles.value;
                                        var error=document.getElementById("error22");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Miercoles";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                      function validar_Jueves(){
                                        
                                        var nombre =document.frmHorasYAct.txtJueves.value;
                                        var error=document.getElementById("error23");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Jueves";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                      function validar_Viernes(){
                                        
                                        var nombre =document.frmHorasYAct.txtViernes.value;
                                        var error=document.getElementById("error24");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Viernes";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    
                                     function validar_Savado(){
                                        
                                        var nombre =document.frmHorasYAct.txtSabado.value;
                                        var error=document.getElementById("error25");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Savado";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                     function validar_Domingo(){
                                        
                                        var nombre =document.frmHorasYAct.txtDomingo.value;
                                        var error=document.getElementById("error26");
                                        var valida=/^[0-9]+*{1,70}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar dia Domingo";
                                            return  false;
                                            
                                        }else if(nombre.length>70){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                </script>
                                
                                
                                
                                
                                
                                
                                
                            </div>
                        </form>
                    </div><br><br>
                    <div class="container-fluid" style=" background-color: currentColor; border-radius: 20px;"  >
<!--                        <form action="#" name="frmaa" method="get"><br>
                            <div class="row" style="color: white">
                                <div class="col-md-6">
                                    Carnet Estudiante
                                    <input type="text" name="txtCarnetBus"  class=" required form-control " required="true" value=" "/><br>
                                    <label id="error27" style="color:red"></label><br>
                                </div>
                                <div class="col-md-6">
                                    <br>
                                    <input type="submit"onclick="return valida();"  name="btnBuscar" id="btnBuscar" value="Buscar" class="btn btn-primary" >   
                                </div>
                                
                                   <script type="text/javascript">
                                    function valida(){
                                        
                                        
                                        
                                       return valida_carnetBuscar();
                                        
                                    }
                                    
                                    function valida_carnetBuscar(){
                                        
                                        var nombre =document.frmaa.txtCarnetBus.value;
                                        var error=document.getElementById("error27");
                                        var valida=/^[0-9]+*{1,11}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar Canet a buscar";
                                            return  false;
                                            
                                        }else if(nombre.length>11){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                         
                                    
                                </script>
                                
                                
                                
                                
                            </div>-->
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px;">
                                        <thead>
                                            <tr>                                                
                                                <th>Carnet</th>                                                                                           
                                                <th>Lunes</th>
                                                <th>Martes</th>   
                                                <th>Miercoles</th>   
                                                <th>Jueves</th>   
                                                <th>Viernes</th>   
                                                <th>Sabado</th> 
                                                <th>Domingo</th> 
                                                <th>Estudiante</th>
                                                <th>Estado Proyecto</th>                                                    
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                
                                                    List<HorarioYAct> list = daoH.mostraHorario();
                                                    for (HorarioYAct co : list) {
                                            %>
                                            <tr>
                                                <td><%= co.getCarneEstudiante()%></td>                                               
                                                <td><%= co.getLunes()%></td>
                                                <td><%= co.getMartes()%></td>
                                                <td><%= co.getMiercoles()%></td>
                                                <td><%= co.getJueves()%></td>
                                                <td><%= co.getViernes()%></td>
                                                <td><%= co.getSabado()%></td>
                                                <td><%= co.getDomingo()%></td>
                                                <td><%= co.getNombreEstudiante()%></td>
                                                <td><%= co.getEstadoS()%></td>
                                                <td>
                                                    <a href="javascript:cargar
                                                       ('<%= co.getIdA()%>',
                                                       '<%= co.getCarneEstudiante()%>',
                                                       '<%= co.getActR()%>',
                                                       '<%= co.getObjetivo()%>',
                                                       '<%= co.getMeta()%>',
                                                       '<%= co.getDuracion()%>',
                                                       '<%= co.getLunes()%>',
                                                       '<%= co.getMartes()%>',
                                                       '<%= co.getMiercoles()%>',
                                                       '<%= co.getJueves()%>',
                                                       '<%= co.getViernes()%>',
                                                       '<%= co.getSabado()%>',
                                                       '<%= co.getDomingo()%>',
                                                       '<%= co.getNombreEstudiante()%>',
                                                       '<%= co.getEstadoS()%>',
                                                       '<%= co.getEstado()%>',)">Seleccionar
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
                                                                                               
                    </div><br><br>

                    <br>
                    <br>

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

