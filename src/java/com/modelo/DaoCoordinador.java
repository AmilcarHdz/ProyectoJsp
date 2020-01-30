package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoCoordinador
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoCoordinador extends Conexion
{
    //mostrar coordinador
public List<Coordinador> mostrarCoordinador() throws Exception
  {
      ResultSet res;
      List<Coordinador> list=new ArrayList();     
      try
      {
          this.conectar();
          String sql="SELECT * FROM coordinador";
          PreparedStatement pre=this.getCon().prepareStatement(sql);
          res=pre.executeQuery();    
          while(res.next())
          {
              Coordinador coor=new Coordinador();              
              coor.setCodigo     (res.getInt   ("IdCoordinador"));
              coor.setNombre     (res.getString("NombCoordinador"));
              coor.setEdad       (res.getInt("EdadCoordinador"));
              coor.setSexo       (res.getString("SexoCor"));
              coor.setCorreo     (res.getString("CorreoCoord"));
              list.add(coor);
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
    
    //Insertar Coordinador
    public void insertarCoordinador (Coordinador coor) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "INSERT INTO coordinador VALUES (?,?,?,?,?)";
          PreparedStatement pre=this.getCon().prepareStatement(sql);         
          pre.setInt   (1, coor.getCodigo());
          pre.setString(2, coor.getNombre());
          pre.setInt   (3, coor.getEdad());
          pre.setString(4, coor.getSexo());
          pre.setString(5, coor.getCorreo());
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
    //modificar Coodinador
    public void modificarCoordinador (Coordinador coor) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE coordinador SET NombCoordinador=?, EdadCoordinador=?, SexoCor=?, CorreoCoord=? WHERE IdCoordinador=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);
          
          pre.setString(1, coor.getNombre());
          pre.setInt   (2, coor.getEdad());
          pre.setString(3, coor.getSexo());
          pre.setString(4, coor.getCorreo());
          pre.setInt   (5, coor.getCodigo());
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
    //Eliminado logico
    public void EliminadoLogico (Coordinador coor) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE coordinador SET estado=?  WHERE IdCoordinador=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);
          pre.setInt   (1, 0);       
          pre.setInt   (2, coor.getCodigo());
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
    //Eliminado fisico
    public void eliminarCoordinador (Coordinador coor) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "DELETE FROM coordinador WHERE IdCoordinador=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);
          
          pre.setInt(1, coor.getCodigo());
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
    
    //Verificacion de datos duplicados
      public boolean buscarControlExist( int carnet) throws Exception {
        boolean existe = false;
        try {
            this.conectar();
            String SQL = "SELECT * FROM `llenar` WHERE IdEstudiante=? ";
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
