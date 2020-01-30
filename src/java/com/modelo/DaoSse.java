package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoSse
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoSse extends Conexion{
   
      //Insertar Sse
    public void insertarSse (Sse se) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "INSERT INTO `sse`(`Sede`, `NombreEstudiante`, `NombreInstitucion`, `Destinatario`, `Comentarios`, `EstadoSolicitud`, `CarnetEstudiante`,`fecha`, `estado`) VALUES (?,?,?,?,?,?,?,?,?)";
          PreparedStatement pre=this.getCon().prepareStatement(sql);             
          pre.setString(1, se.getSede());
          pre.setString(2, se.getNombreEstudiante());
          pre.setString(3, se.getNombreIns());
          pre.setString(4, se.getDestinatarios());
          pre.setString(5, se.getComentarios());
          pre.setString(6, se.getEstadoSol());
          pre.setInt   (7, se.getCarnetEstudiante());
          pre.setString(8,se.getFecha());
          pre.setInt(9,1);
          pre.executeUpdate(); 
          
      }
      catch (Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
  }
    //Modificar
    public void modificarSse (Sse se) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE `sse` SET `Sede`=?,`NombreEstudiante`=?,`NombreInstitucion`=?,`Destinatario`=?,`Comentarios`=?,EstadoSolicitud=?,`fecha`=?,estado=? WHERE `IdSse`=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);         
          pre.setString(1,se.getSede() );
          pre.setString(2,se.getNombreEstudiante() );
          pre.setString(3,se.getNombreIns() );
          pre.setString(4,se.getDestinatarios() );         
          pre.setString(5,se.getComentarios() );   
          pre.setString(6,se.getEstadoSol());        
           pre.setString(7,se.getFecha() );
             pre.setInt   (8,1 );
          pre.setInt   (9,se.getIdSse() );
        
          pre.executeUpdate();
      }
      catch (Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
  }
    //Modificar
    public void modificarSseC (Sse se) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE `sse` SET`NombreEstudiante`=?,`Comentarios`=?,EstadoSolicitud=?,estado=? WHERE `IdSse`=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);                 
          pre.setString(1,se.getNombreEstudiante() ) ;            
          pre.setString(2,se.getComentarios() );   
          pre.setString(3,se.getEstadoSol());                
             pre.setInt(4,1 );
          pre.setInt   (5,se.getIdSse() );
        
          pre.executeUpdate();
      }
      catch (Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
  }
       //Eliminado Fisico
    public void eliminarSse(Sse se) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "DELETE FROM sse WHERE IdSse=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);          
          pre.setInt(1, se.getIdSse());
          pre.executeUpdate();
      }
      catch (Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
  }
    //eliminado logico
     public void EliminadoLogico(Sse se) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE `sse` SET `estado`=? WHERE IdSse=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);                  
          pre.setInt(1, 0);
         pre.setInt(2, se.getIdSse());
          pre.executeUpdate();
      }
      catch (Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
  }
    //mostrar busqueda
     public List<Sse> mostrarSse(Integer se) throws Exception
  {
      ResultSet res;
      List<Sse> list=new ArrayList();  
      try
      {
          this.conectar();
          String sql="SELECT *FROM sse where estado=1 and CarnetEstudiante=?";
      
          PreparedStatement pre=this.getCon().prepareStatement(sql);
          pre.setInt(1, se);
          res=pre.executeQuery();          
          while(res.next())
          {
              Sse see=new Sse();             
              see.setIdSse(res.getInt("IdSse"));
              see.setSede(res.getString("Sede"));
              see.setNombreEstudiante(res.getString("NombreEstudiante"));
              see.setNombreIns(res.getString("NombreInstitucion"));
              see.setDestinatarios(res.getString("Destinatario"));
              see.setComentarios(res.getString("Comentarios"));
              see.setEstadoSol(res.getString("EstadoSolicitud"));
              see.setCarnetEstudiante(res.getInt ("CarnetEstudiante"));
              see.setFecha(res.getString("fecha"));
              see.setEstado(res.getInt   ("estado"));
              list.add(see);
          }
      }
      catch(Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
      return list;
  }
     //mostrar solicitudes
      public List<Sse> mostrarSseA() throws Exception
  {
      ResultSet res;
      List<Sse> list=new ArrayList();  
      try
      {
          this.conectar();
          String sql="SELECT *FROM sse where estado=1 ";
      
          PreparedStatement pre=this.getCon().prepareStatement(sql);
        
          res=pre.executeQuery();          
          while(res.next())
          {
              Sse see=new Sse();             
              see.setIdSse(res.getInt   ("IdSse"));
              see.setSede(res.getString("Sede"));
              see.setNombreEstudiante(res.getString("NombreEstudiante"));
              see.setNombreIns(res.getString("NombreInstitucion"));
              see.setDestinatarios(res.getString("Destinatario"));
              see.setComentarios(res.getString("Comentarios"));
              see.setEstadoSol(res.getString("EstadoSolicitud"));
              see.setCarnetEstudiante(res.getInt   ("CarnetEstudiante"));
              see.setFecha(res.getString("fecha"));
              see.setEstado(res.getInt   ("estado"));
              list.add(see);
          }
      }
      catch(Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
      return list;
  }
       //Verificacion de datos duplicados
      public boolean buscarSseExist( int carnet) throws Exception {
        boolean existe = false;
        try {
            this.conectar();
            String SQL = "SELECT *FROM sse where CarnetEstudiante=? ";
            PreparedStatement ps = this.getCon().prepareStatement(SQL);           
            ps.setInt(1, carnet);           
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                existe = true;
            }
        }  catch (Exception e)
      {
          throw e;
      }
      finally
      {
          this.desconectar();
      }
        return existe;

    }
}