package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoFinSse
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoFinSse extends Conexion {

    //mostrar busqueda FinSse 
    public List<FinSse> mostrarFinSse(Integer see) throws Exception {
        ResultSet res;
        List<FinSse> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `finalsse` WHERE Estado=1 and Carnet=?";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, see);
            res = pre.executeQuery();
            while (res.next()) {
                FinSse sse = new FinSse();
                sse.setIdF(res.getInt("IdF"));
                sse.setEstudiante(res.getString("Estudiante"));
                sse.setEscuela(res.getString("Escuela"));
                sse.setSede(res.getString("Sede"));
                sse.setCarrera(res.getString("Carrera"));
                sse.setCarnet(res.getInt("Carnet"));
                sse.setJornada(res.getString("Jornada"));
                sse.setAnioEstudio(res.getString("AnioEstudio"));
                sse.setTelefonoEst(res.getString("TelefonoEst"));
                sse.setCorreo(res.getString("Correo"));
                sse.setInstitucion(res.getString("Institucion"));
                sse.setDireccion(res.getString("Direccion"));
                sse.setTelefonoIns(res.getString("TelefonoIns"));
                sse.setSitioWeb(res.getString("SitioWeb"));
                sse.setFechaInicio(res.getString("FechaInicio"));
                sse.setFechaFin(res.getString("FechaFin"));
                sse.setOservaciones(res.getString("Observaciones"));
                sse.setEncargadoIns(res.getString("EncargadoIns"));
                sse.setCoordinador(res.getString("Coordinador"));
                sse.setEstado(res.getInt("Estado"));

                list.add(sse);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    //Insertar FinSse
    public void insertarSse(FinSse sse) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO `finalsse`( `Estudiante`,`Escuela`,`Sede`,`Carrera`,`Carnet`,`Jornada`,`AnioEstudio`,`TelefonoEst`,`Correo`,`Institucion`,`Direccion`,`TelefonoIns`,`SitioWeb`,`FechaInicio`,`FechaFin`,`Observaciones`,`EncargadoIns`,`Coordinador`,`Estado`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, sse.getEstudiante());
            pre.setString(2, sse.getEscuela());
            pre.setString(3, sse.getSede());
            pre.setString(4, sse.getCarrera());
            pre.setInt(5, sse.getCarnet());
            pre.setString(6, sse.getJornada());
            pre.setString(7, sse.getAnioEstudio());
            pre.setString(8, sse.getTelefonoEst());
            pre.setString(9, sse.getCorreo());
            pre.setString(10, sse.getInstitucion());
            pre.setString(11, sse.getDireccion());
            pre.setString(12, sse.getTelefonoIns());
            pre.setString(13, sse.getSitioWeb());
            pre.setString(14, sse.getFechaInicio());
            pre.setString(15, sse.getFechaFin());
            pre.setString(16, sse.getOservaciones());
            pre.setString(17, sse.getEncargadoIns());
            pre.setString(18, sse.getCoordinador());
            pre.setInt(19, 1);
            pre.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Modificar FinSse
  
    public void modificarFinSse (FinSse sse) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE `finalsse` SET `Estudiante`=?,`Escuela`=?,`Sede`=?,`Carrera`=?,`Carnet`=?,`Jornada`=?,`AnioEstudio`=?,`TelefonoEst`=?,`Correo`=?,`Institucion`=?,`Direccion`=?,`TelefonoIns`=?,`SitioWeb`=?,`FechaInicio`=?,`FechaFin`=?,`Observaciones`=?,`EncargadoIns`=?,`Coordinador`=?,`Estado`=? WHERE `IdF`=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);         
           pre.setString(1, sse.getEstudiante());
            pre.setString(2, sse.getEscuela());
            pre.setString(3, sse.getSede());
            pre.setString(4, sse.getCarrera());
            pre.setInt(5, sse.getCarnet());
            pre.setString(6, sse.getJornada());
            pre.setString(7, sse.getAnioEstudio());
            pre.setString(8, sse.getTelefonoEst());
            pre.setString(9, sse.getCorreo());
            pre.setString(10, sse.getInstitucion());
            pre.setString(11, sse.getDireccion());
            pre.setString(12, sse.getTelefonoIns());
            pre.setString(13, sse.getSitioWeb());
            pre.setString(14, sse.getFechaInicio());
            pre.setString(15, sse.getFechaFin());
            pre.setString(16, sse.getOservaciones());
            pre.setString(17, sse.getEncargadoIns());
            pre.setString(18, sse.getCoordinador());
            pre.setInt(19, 1);
            pre.setInt(20,sse.getIdF());
            pre.executeUpdate();
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
       
    public void eliminarFinSse(FinSse sse) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "DELETE FROM `finalsse` WHERE `IdF`=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);          
          pre.setInt(1, sse.getIdF());
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
    //EliminadoLogico
   
     public void EliminadoLogicoFinSse(FinSse sse) throws Exception
  {
      try
      {
          this.conectar();
          String sql = "UPDATE `finalsse` SET `estado`=? WHERE  `IdF`=?";
          PreparedStatement pre=this.getCon().prepareStatement(sql);                  
          pre.setInt(1, 0);
         pre.setInt(2, sse.getIdF());
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
      public boolean buscarFinExist( int carnet) throws Exception {
        boolean existe = false;
        try {
            this.conectar();
            String SQL = "SELECT * FROM `finalsse` WHERE Carnet=? ";
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
