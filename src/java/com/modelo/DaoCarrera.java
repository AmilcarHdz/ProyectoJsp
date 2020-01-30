package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoCarrerra
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoCarrera extends Conexion
{//mostrar carrera
    public List<Carrera> mostrarCarrera() throws Exception
  {
      ResultSet res;
      List<Carrera> list=new ArrayList();      
      try
      {
          this.conectar();
          String sql="SELECT * FROM carrera where estado=1";
          PreparedStatement pre=this.getCon().prepareStatement(sql);
          res=pre.executeQuery();
          
          while(res.next())
          {
              Carrera car=new Carrera();              
              car.setCodigo     (res.getInt   ("IdCarrera"));
              car.setNombre     (res.getString("NombreCarrera"));
              car.setTipoCarrera(res.getString("Tipocarrera"));
              list.add(car);
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
    //Insertar Carrera    
    public void insertarCarrera (Carrera car) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "INSERT INTO carrera VALUES(?,?,?,?)";
          PreparedStatement pre=this.getCon().prepareStatement(sql);          
          pre.setInt   (1, car.getCodigo());
          pre.setString(2, car.getNombre());
          pre.setString(3, car.getTipoCarrera());
          pre.setInt(4, 1);
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
    //modificar carrera
    public void modificarCarrera (Carrera car) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE carrera SET NombreCarrera=?, TipoCarrera=? WHERE IdCarrera=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);          
          pre.setString(1, car.getNombre());
          pre.setString(2, car.getTipoCarrera());
          pre.setInt   (3, car.getCodigo());
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
   //Eliminar carrera fisico
    public void eliminarCarrera (Carrera car) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "DELETE FROM carrera WHERE IdCarrera=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);          
          pre.setInt(1, car.getCodigo());
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
    //Eliminado Logico
     public void EliminadoLogico (Carrera car) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE carrera SET estado=? WHERE IdCarrera=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);          
         pre.setInt   (1, 0);
          pre.setInt   (2, car.getCodigo());
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
      public boolean buscarCarreraExist( String nombre, String tipo) throws Exception {
        boolean existe = false;
        try {
            this.conectar();
            String SQL = "select * from carrera where  NombreCarrera=? and TipoCarrera=? ";
            PreparedStatement ps = this.getCon().prepareStatement(SQL);           
            ps.setString(1, nombre);
            ps.setString(2, tipo);
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
