<%-- 
    Document   : llenarHSS
    Created on : 20-01-2020, 10:44:30 PM
    Author     : ServicioSocial
--%>
<%@page import="com.modelo.DaoFinSse"%>
<%@page import="com.modelo.FinSse"%>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
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



       function cargar(Idf,Estudiantes,Escuela,Sede,Carrera,Carnet,Jornada,AnioEstudio,TelefonoE,Correo,Institucion,Direccion,TelefonoIns,Sitiowe,FechaInicio,FechaFin,Observaciones,EncargadoIns,Coordinador,Estado)
        {
        document.frmFinSse.txtId.value =Idf;
        document.frmFinSse.txtNombre.value =Estudiantes ;
        document.frmFinSse.Escuela.value =Escuela ;
        document.frmFinSse.sede.value =Sede ;
        document.frmFinSse.selectCarrera.value =Carrera;
        document.frmFinSse.txtCarnet.value =Carnet ;
        document.frmFinSse.Jornada.value =Jornada ;
        document.frmFinSse.anio.value =AnioEstudio ;
        document.frmFinSse.txtTelefono.value =TelefonoE ;
        document.frmFinSse.txtCorreo.value =Correo ;
        document.frmFinSse.txtInstitucion.value =Institucion ;
        document.frmFinSse.txtDireccion.value =Direccion ;
        document.frmFinSse.txtTelefonos.value =TelefonoIns ;
        document.frmFinSse.txtSitioweb.value =Sitiowe ;
        document.frmFinSse.txtInicioH.value = FechaInicio;
        document.frmFinSse.txtFinalizacionH.value = FechaFin;
        document.frmFinSse.txtOservaciones.value = Observaciones;
        document.frmFinSse.txtEncargado.value = EncargadoIns;
        document.frmFinSse.txtCoordinador.value =Coordinador ;
        document.frmFinSse.txtEstado.value =Estado ;
          document.getElementById("txtCarnet").hidden = true;
            document.getElementById("btnInsertar").disabled = true;
        } 
    </script>
    <%
        DaoEstudiante daoE = new DaoEstudiante();
        DaoFinSse daof = new DaoFinSse();
        FinSse se = new FinSse();
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
                        <form action="procesarFinSse" name="frmFinSse" id="frmFinSse" method="get">
                            <div class="row" style="color: white">
                                <div class="col-md-6 ">
                                    Nombre del estudiante<input type="text" name="txtNombre" id="txtNombre"class=" required form-control" required="true" value=""/><br>    
                                    <label id="error28" style="color:red"></label><br>

                                    
                                    Escuela del Itca a la que pertenece :
                                    <select name="Escuela" class="form-control" required="true" id="Escuela">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Computacion">Computacion</option>
                                        <option value="Mecatronica">Mecatronica</option>
                                        <option value="Mecanica">Mecanica</option>
                                        <option value="Arquitectura">Arquitectura</option>
                                        <option value="Gastronomia">Gastronomia</option>
                                        <option value="Quimica">Quimica</option>
                                    </select> 
                                    Sede:<select name="sede" class="form-control" required="true" id="sede">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Sede Santa Tecla">Sede Santa Tecla</option>
                                        <option value="Regional La Union">Regional La Union</option>
                                        <option value="Regional San Miguel">Regional San Miguel</option>
                                        <option value="Regional Santa Ana">Regional Santa Ana</option>
                                        <option value="Regional Zacatecoluca">Regional Zacatecoluca</option>
                                    </select>  
                                    Telefono:  <input type="text" name="txtTelefono"  id="txtTelefono" class="required form-control  "  required="true" />          
                                    <label id="error29" style="color:red"></label><br>
                                    
                                    Correo:<input type="text" name="txtCorreo"  id="txtCorreo" class="required form-control  "  required="true" />          
                                     <label id="error30" style="color:red"></label><br>
                                </div>
                                <div class="col-md-6">
                                    Carrera <select name="selectCarrera" id="selectCarrera" class="form-control" required="true">
                                        <%
                                            List<Carrera> listC = daoE.listarCarreras();
                                            for (Carrera c : listC) {
                                        %>
                                        <option value="<%=c.getNombre() %>">
                                            <%=c.getNombre()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select><br>
                                    carnet:<input type="text" name="txtCarnet"  id="txtCarnet" class="required form-control  "  required="true" />
                                    <label id="error31" style="color:red"></label><br>
                                    Jornada<select name="Jornada" class="form-control" required="true" id="Jornada">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Diurna">Diurna</option>
                                        <option value="Nocturna">Nocturna</option>
                                        <option value="Virtual">Virtual</option>
                                    </select>  
                                    Añio al que pertenece
                                    <select name="anio" class="form-control" required="true" id="anio">
                                        <option value="Seleccione">--Seleccione--</option>
                                        <option value="Primer anio">Primer anio</option>
                                        <option value="segundo anio">segundo anio</option>
                                        <option value="Tercer anio">Tercer anio</option>
                                        <option value="Cuarto anio">Cuarto anio</option>
                                        <option value="Otro">Otro</option>
                                    </select> 
                                </div>
                            </div>
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <hr style="height:5px; background-color:  #000; border-radius: 5px; ">
                                </div>
                                <div class="col-md-6">   
                                    Nombre completo de la institucion:  <input type="text" name="txtInstitucion"  id="txtInstitucion" class="required form-control  "  required="true" />    
                                     <label id="error32" style="color:red"></label><br>
                                    
                                    Direccion:<input type="text" name="txtDireccion"  id="txtDireccion" class="required form-control  "  required="true" />          
                                    <label id="error33" style="color:red"></label><br>
                                    Telefonos: <input type="text" name="txtTelefonos"  id="txtTelefonos" class="required form-control  "  required="true" placeholder="####-####" /> 
                                    <label id="error34" style="color:red"></label><br>
                                    Encargado Institucion <input type="text" name="txtEncargado"  id="txtEncargado" class="required form-control  "  required="true" />  
                                    <label id="error35" style="color:red"></label><br>
                                    Coordinador SSE<input type="text" name="txtCoordinador"  id="txtCoordinador" class="required form-control  "  required="true" /><br>
                                    <label id="error36" style="color:red"></label><br>
                                    <input type="submit" onclick="return validar();" class="btn btn-primary" value="Enviar" name="btnInsertar" id="btnInsertar" >
                                    <input type="submit" class="btn btn-warning" value="Modificar" name="btnModificar" >
                                    <input type="submit" class="btn btn-twitter" value="Eliminar" name="btnEliminar">
                                    <input type="reset" class="btn btn-danger" value="Limpiar" >
                                </div>
                                <div class="col-md-6">   
                                    Sitio web:  <input type="text" name="txtSitioweb"  id="txtSitioweb" class="required form-control  "  required="true" />       
                                    <label id="error37" style="color:red"></label><br>
                                    Fecha de inicio: <input type="text" name="txtInicioH"  id="txtInicioH" class="required form-control  "  required="true" />  
                                     <label id="error38" style="color:red"></label><br>
                                    Fecha de Finalizacion: <input type="text" name="txtFinalizacionH"  id="txtFinalizacionH" class="required form-control  "  required="true" placeholder="yyyy-MM-dd"  />  
                                    <label id="error39" style="color:red"></label><br>
                                    Oservaciones  <textarea name="txtOservaciones"  id="txtObservaciones" class="required form-control  "  required="true" ></textarea>
                                    <label id="error40" style="color:red"></label><br>
                                    <input type="text" name="txtEstado"  id="txtEstado" class="required form-control  "  required="true" value="1" hidden="true"/>   
                                    <input type="text" name="txtId"  id="txtId" class="required form-control  "  required="true" value="0" hidden="true"/>   
                                    <br><br>

                                </div>
                                
                                
                                <script type="text/javascript">
                                    /*function validar(){
                                        
                                        
                                        
                                       if(!validar_nombreEstud() ||!validar_Telefono() || !validar_Correo() || !validar_Carnet() || !validar_NombreInstitucion() || !validar_Direccion() ||
                                          !validar_Telefonos()|| !validar_Encargado() || !validar_Codinador() ||!validar_SitioWeb() || !validar_FechaInicio() || !validar_FechaFinalizacion() || !validar_Obcerbacciones()){
                                           
                                           validar_nombreEstud(); 
                                           validar_Telefono();
                                           validar_Correo();
                                           validar_Carnet();
                                           validar_NombreInstitucion();
                                           validar_Direccion();
                                           validar_Telefonos();
                                           validar_Encargado();
                                           validar_Codinador();
                                           validar_SitioWeb();
                                           validar_FechaInicio();
                                           validar_FechaFinalizacion();
                                           validar_Obcerbacciones();
                                           return false;
                                           
                                       }
                                        
                                    }
                                    
                                    function validar_nombreEstud(){
                                        
                                        var nombre =document.frmFinSse.txtNombre.value;
                                        var error=document.getElementById("error28");
                                        var valida=/^[a-z-A-Z]{1,50}$/;
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
                                    
                                      function validar_Telefono(){
                                        
                                        var nombre =document.frmFinSse.txtTelefono.value;
                                        var error=document.getElementById("error29");
                                        var valida=/^[0-9]+*{1,25}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar Telefono";
                                            return  false;
                                            
                                        }else if(nombre.length>20){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                          
                                    function validar_Correo(){
                                        
                                        var nombre =document.frmFinSse.txtCorreo.value;
                                        var error=document.getElementById("error30");
                                        var valida=/^[a-z-0-9]+@+[a-z]+.+[a-z]$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita digitar correo";
                                            return  false;
                                            
                                        }else if(nombre.length>25){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite digitar correo";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    function validar_Carnet(){
                                        
                                        var nombre =document.frmFinSse.txtCarnet.value;
                                        var error=document.getElementById("error31");
                                        var valida=/^[0-9]+*{1,11}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar Carnet";
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
                                    
                                    
                                     function validar_NombreInstitucion(){
                                        
                                        var nombre =document.frmFinSse.txtInstitucion.value;
                                        var error=document.getElementById("error32");
                                        var valida=/^[a-z-A-Z]{1,200}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar nombre de la institucion";
                                            return  false;
                                            
                                        }else if(nombre.length>200){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    
                                     
                                     function validar_Direccion(){
                                        
                                        var nombre =document.frmFinSse.txtDireccion.value;
                                        var error=document.getElementById("error33");
                                        
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar Direccion";
                                            return  false;
                                            
                                        }else if(nombre.length>500){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                     function validar_Telefonos(){
                                        
                                        var nombre =document.frmFinSse.txtTelefonos.value;
                                        var error=document.getElementById("error34");
                                        var valida=/^[0-9]+*{1,25}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar telefono";
                                            return  false;
                                            
                                        }else if(nombre.length>200){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite numeros";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                     function validar_Encargado(){
                                        
                                        var nombre =document.frmFinSse.txtEncargado.value;
                                        var error=document.getElementById("error35");
                                        var valida=/^[a-z-A-Z]{1,100}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar encargado";
                                            return  false;
                                            
                                        }else if(nombre.length>100){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    function validar_Codinador(){
                                        
                                        var nombre =document.frmFinSse.txtCoordinador.value;
                                        var error=document.getElementById("error36");
                                        var valida=/^[a-z-A-Z]{1,100}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar codinador";
                                            return  false;
                                            
                                        }else if(nombre.length>100){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else if(!valida.test(nombre)){
                                            
                                              error.textContent="* Error solo se permite lectras";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    function validar_SitioWeb(){
                                        
                                        var nombre =document.frmFinSse.txtSitioweb.value;
                                        var error=document.getElementById("error37");
                                        
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar sitio Web";
                                            return  false;
                                            
                                        }else if(nombre.length>100){
                                             error.textContent="* Error demaciados carracteres";
                                            return  false;
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                       function validar_FechaInicio(){
                                        
                                        var nombre =document.frmFinSse.txtInicioH.value;
                                        var error=document.getElementById("error38");
                                        
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar fecha de inicio";
                                            return  false;
                                            
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                     function validar_FechaFinalizacion(){
                                        
                                        var nombre =document.frmFinSse.txtFinalizacionH.value;
                                        var error=document.getElementById("error39");
                                        
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar fecha de filanlizacion";
                                            return  false;
                                            
                                        }else{
                                            
                                            return true;
                                        }
                                       
                                    }
                                    
                                    
                                    
                                    function validar_Obcerbacciones(){
                                        
                                        var nombre =document.frmFinSse.txtOservaciones.value;
                                        var error=document.getElementById("error40");
                                        var valida=/^[a-z-A-Z]{1,500}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar Obserbaciones";
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
                                       
                                    }*/
                                    
                                    
                                    
                                    
                                </script>
                                
                                
                                
                                
                                
                            </div>
                            <br><br>                            
                        </form>
                    </div>  
                    <br>
                    <div class="container-fluid" style="background-color: currentColor; border-radius: 20px; ">
<!--                        <form action="#" name="fmrbuscar" method="post">
                            <div class="row" style="color: white">

                                <div class="col-md-6 ">
                                    <br>
                                    Carnet Estudiante<input type="text" name="txtCarnetBusZ" id="txtCarnetBusZ" class=" required form-control " required="true" value=" "/>
                                     <label id="error41" style="color:red"></label><br>
                                    <input type="submit" onclick="return valid();" name="btnBuscarZ" id="btnBuscarZ" value="Buscar" class="btn btn-primary" >                             
                                    <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-danger"><br> <br>
                                </div>
                                
                                 <script type="text/javascript">
                                    function valid(){
                                        
                                        
                                        
                                    return valid_Buscar();
                                        
                                    }
                                    
                                    function valid_Buscar(){
                                        
                                        var nombre =document.fmrbuscar.txtCarnetBusZ.value;
                                        var error=document.getElementById("error41");
                                        var valida=/^[0-9]+*{1,11}$/;
                                        if(nombre ===""){
                                            error.textContent="* Error necesita ingresar carnet a buscar";
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
                                
                                
                                
                                
                                
                                
                                <div class="col-md-6">              
                                    <br>

                                    <br>
                                </div>

                            </div>-->
                            <div class="row" style="color: white">
                                <div class="col-md-12">
                                    <br><br>
                                    <table class="table table-dark table-hover" style=" background-color: captiontext; border-radius: 20px;">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Carnet</th>
                                                <th>Estudiante</th>
                                                <th>Carrera</th>
                                                <th>E-mail</th>                                                 
                                                <th>Institucion SSE</th>
                                                <th>Fecha Inicio</th>
                                                <th>Fecha Finalizacion</th>
                                                <th>Direccion</th>                                               
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%

                                                    List<FinSse> list = daof.mostrarSse();
                                                    for (FinSse es : list) {
                                            %>
                                            <tr>
                                                <td><%= es.getIdF()%></td>
                                                <td><%= es.getCarnet()%></td>
                                                <td><%= es.getEstudiante()%></td>
                                                <td><%= es.getCarrera()%></td>
                                                <td><%= es.getCorreo()%></td>
                                                <td><%= es.getInstitucion()%></td>
                                                <td><%= es.getFechaInicio()%></td>
                                                <td><%= es.getFechaFin()%></td>
                                                <td><%= es.getDireccion()%></td>
                                                <td><%= es.getEstado()%></td>


                                                <td><a href="javascript:cargar(
                                                       '<%= es.getIdF()%>',
                                                       '<%= es.getEstudiante()%>',
                                                       '<%= es.getEscuela()%>',
                                                       '<%= es.getSede()%>',
                                                       '<%= es.getCarrera()%>',
                                                       '<%= es.getCarnet()%>',
                                                       '<%= es.getJornada()%>',
                                                       '<%= es.getAnioEstudio()%>',
                                                       '<%= es.getTelefonoEst()%>',
                                                       '<%= es.getCorreo()%>',
                                                       '<%= es.getInstitucion()%>',
                                                       '<%= es.getDireccion()%>',
                                                       '<%= es.getTelefonoIns()%>',
                                                       '<%= es.getSitioWeb()%>',
                                                       '<%= es.getFechaInicio()%>',
                                                       '<%= es.getFechaFin()%>',
                                                       '<%= es.getOservaciones()%>',
                                                       '<%= es.getEncargadoIns()%>',
                                                       '<%= es.getCoordinador()%>',
                                                       '<%= es.getEstado()%>'
                                                       )">Seleccionar
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
<!--                  //       </form>-->
                    </div>
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


