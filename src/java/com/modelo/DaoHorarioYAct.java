package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoHorarioYAct
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoHorarioYAct extends Conexion {

    //busqueda de solicitud por canet
    public List<HorarioYAct> mostrarHorHYA(Integer co) throws Exception {
        ResultSet res;
        List<HorarioYAct> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `horarioyact` WHERE estado=1 and CarnetEstudiante =?";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co);
            res = pre.executeQuery();
            while (res.next()) {
                HorarioYAct Hy = new HorarioYAct();
                Hy.setIdA(res.getInt("IdHA"));
                Hy.setCarneEstudiante(res.getInt("CarnetEstudiante"));
                Hy.setActR(res.getString("ActRealizar"));
                Hy.setObjetivo(res.getString("Objetivo"));
                Hy.setMeta(res.getString("Meta"));
                Hy.setDuracion(res.getInt("Duracion"));
                Hy.setLunes(res.getString("Lunes"));
                Hy.setMartes(res.getString("Martes"));
                Hy.setMiercoles(res.getString("Miercoles"));
                Hy.setJueves(res.getString("Jueves"));
                Hy.setViernes(res.getString("Viernes"));
                Hy.setSabado(res.getString("Sabado"));
                Hy.setDomingo(res.getString("Domingo"));
                Hy.setNombreEstudiante(res.getString("NombreEst"));
                Hy.setEstadoS(res.getString("EstadoS"));
                Hy.setEstado(res.getInt("estado"));
                list.add(Hy);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
     public List<HorarioYAct> mostraHorario() throws Exception {
        ResultSet res;
        List<HorarioYAct> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `horarioyact` WHERE estado=1";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            res = pre.executeQuery();
            while (res.next()) {
                HorarioYAct Hy = new HorarioYAct();
                Hy.setIdA(res.getInt("IdHA"));
                Hy.setCarneEstudiante(res.getInt("CarnetEstudiante"));
                Hy.setActR(res.getString("ActRealizar"));
                Hy.setObjetivo(res.getString("Objetivo"));
                Hy.setMeta(res.getString("Meta"));
                Hy.setDuracion(res.getInt("Duracion"));
                Hy.setLunes(res.getString("Lunes"));
                Hy.setMartes(res.getString("Martes"));
                Hy.setMiercoles(res.getString("Miercoles"));
                Hy.setJueves(res.getString("Jueves"));
                Hy.setViernes(res.getString("Viernes"));
                Hy.setSabado(res.getString("Sabado"));
                Hy.setDomingo(res.getString("Domingo"));
                Hy.setNombreEstudiante(res.getString("NombreEst"));
                Hy.setEstadoS(res.getString("EstadoS"));
                Hy.setEstado(res.getInt("estado"));
                list.add(Hy);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
     
    public List<HorarioYAct> mostraHorarioEliminado() throws Exception {
        ResultSet res;
        List<HorarioYAct> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `horarioyact` WHERE estado=0";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            res = pre.executeQuery();
            while (res.next()) {
                HorarioYAct Hy = new HorarioYAct();
                Hy.setIdA(res.getInt("IdHA"));
                Hy.setCarneEstudiante(res.getInt("CarnetEstudiante"));
                Hy.setActR(res.getString("ActRealizar"));
                Hy.setObjetivo(res.getString("Objetivo"));
                Hy.setMeta(res.getString("Meta"));
                Hy.setDuracion(res.getInt("Duracion"));
                Hy.setLunes(res.getString("Lunes"));
                Hy.setMartes(res.getString("Martes"));
                Hy.setMiercoles(res.getString("Miercoles"));
                Hy.setJueves(res.getString("Jueves"));
                Hy.setViernes(res.getString("Viernes"));
                Hy.setSabado(res.getString("Sabado"));
                Hy.setDomingo(res.getString("Domingo"));
                Hy.setNombreEstudiante(res.getString("NombreEst"));
                Hy.setEstadoS(res.getString("EstadoS"));
                Hy.setEstado(res.getInt("estado"));
                list.add(Hy);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
    //Insertar HorasYAct

    public void insertarYAct(HorarioYAct co) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO `horarioyact`(`CarnetEstudiante`, `ActRealizar`, `Objetivo`, `Meta`, `Duracion`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `Sabado`, `Domingo`, `NombreEst`, `EstadoS`, `estado`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getCarneEstudiante());
            pre.setString(2, co.getActR());
            pre.setString(3, co.getObjetivo());
            pre.setString(4, co.getMeta());
            pre.setInt(5, co.getDuracion());
            pre.setString(6, co.getLunes());
            pre.setString(7, co.getMartes());
            pre.setString(8, co.getMiercoles());
            pre.setString(9, co.getJueves());
            pre.setString(10, co.getViernes());
            pre.setString(11, co.getSabado());
            pre.setString(12, co.getDomingo());
             pre.setString(13, co.getNombreEstudiante());
             pre.setString(14,co.getEstadoS());
            pre.setInt(15, 1);    
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Modificar HorasYAct
    public void modificarCH(HorarioYAct co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `horarioyact` SET `CarnetEstudiante`=?,`ActRealizar`=?,`Objetivo`=?,`Meta`=?,`Duracion`=?,`Lunes`=?,`Martes`=?,`Miercoles`=?,`Jueves`=?,`Viernes`=?,`Sabado`=?,`Domingo`=?,`NombreEst`=?,`EstadoS`=? WHERE `IdHA`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getCarneEstudiante());
            pre.setString(2, co.getActR());
            pre.setString(3, co.getObjetivo());
            pre.setString(4, co.getMeta());
            pre.setInt(5, co.getDuracion());
            pre.setString(6, co.getLunes());
            pre.setString(7, co.getMartes());
            pre.setString(8, co.getMiercoles());
            pre.setString(9, co.getJueves());
            pre.setString(10, co.getViernes());
            pre.setString(11, co.getSabado());
            pre.setString(12, co.getDomingo());
             pre.setString(13, co.getNombreEstudiante());
             pre.setString(14,co.getEstadoS());
            pre.setInt(15,co.getIdA());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Eliminado fisico
    public void eliminarCh(HorarioYAct co) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM `horarioyact` WHERE `IdHA`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getIdA());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Eliminado Logico
     public void EliminadoLogico(HorarioYAct co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `horarioyact` SET `estado`=? WHERE `IdHA`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setInt(2, co.getIdA());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Eliminado Logico
     public void recuperarEliminadoLogico(HorarioYAct co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `horarioyact` SET `estado`=1 WHERE `IdHA`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getIdA());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
      //Verificacion de datos duplicados
      public boolean buscarHYActExist( int carnet) throws Exception {
        boolean existe = false;
        try {
            this.conectar();
            String SQL = "SELECT * FROM `horarioyact` WHERE  CarnetEstudiante =? ";
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
