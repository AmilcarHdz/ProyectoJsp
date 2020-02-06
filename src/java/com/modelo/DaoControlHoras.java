package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoControlHoras
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoControlHoras extends Conexion {
    //mostrar registro de actividades
    public List<ControlHoras> mostrarHorACT(Integer co) throws Exception {
        ResultSet res;
        List<ControlHoras> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `detallehoras` WHERE  estado=1  and IdRegHoras=?";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co);
            res = pre.executeQuery();
            while (res.next()) {
                ControlHoras Ch = new ControlHoras();
                Ch.setIdLlenar(res.getInt("IdDet"));
                Ch.setIdRHoras(res.getInt("IdRegHoras"));
                Ch.setFechaAct(res.getString("fechaAct"));
                Ch.setActividad(res.getString("Actividad"));
                Ch.setHorasD(Double.parseDouble(res.getString("HorasD")));
                Ch.setEstadoDetalleH(res.getInt("estado"));
                list.add(Ch);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
     public List<ControlHoras> mostrarHorA() throws Exception {
        ResultSet res;
        List<ControlHoras> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `detallehoras` WHERE  estado=1";

            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            res = pre.executeQuery();
            while (res.next()) {
                ControlHoras Ch = new ControlHoras();
                Ch.setIdLlenar(res.getInt("IdDet"));
                Ch.setIdRHoras(res.getInt("IdRegHoras"));
                Ch.setFechaAct(res.getString("fechaAct"));
                Ch.setActividad(res.getString("Actividad"));
                Ch.setHorasD(Double.parseDouble(res.getString("HorasD")));
                Ch.setEstadoDetalleH(res.getInt("estado"));
                list.add(Ch);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
//mostrar registro horas
    public List<ControlHoras> mostrarHoaras() throws Exception {
        ResultSet res;
        List<ControlHoras> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `llenar` WHERE  estado=1 ";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            while (res.next()) {
                ControlHoras Ch = new ControlHoras();
                Ch.setIdRegistroHoras(res.getInt("IdRegistroHoras"));
                Ch.setSedeEstudio(res.getString("sedeEstudio"));
                Ch.setNombreEstudiante(res.getString("nombreEstudiante"));
                Ch.setEscuela(res.getString("EscuelaP"));
                Ch.setNombreCarrera(res.getString("nombreCarrera"));
                Ch.setIdEstudiante(res.getInt("IdEstudiante"));
                Ch.setEstadollenar(res.getInt("estado"));
                list.add(Ch);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
    //buscar registro horas

    public List<ControlHoras> mostrarHoarasB(ControlHoras co) throws Exception {
        ResultSet res;
        List<ControlHoras> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `llenar` WHERE  estado=1  and IdEstudiante=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getIdEstudiante());
            res = pre.executeQuery();
            while (res.next()) {
                ControlHoras Ch = new ControlHoras();
                Ch.setIdRegistroHoras(res.getInt("IdRegistroHoras"));
                Ch.setSedeEstudio(res.getString("sedeEstudio"));
                Ch.setNombreEstudiante(res.getString("nombreEstudiante"));
                Ch.setEscuela(res.getString("EscuelaP"));
                Ch.setNombreCarrera(res.getString("nombreCarrera"));
                Ch.setIdEstudiante(res.getInt("IdEstudiante"));
                Ch.setEstadollenar(res.getInt("estado"));
                list.add(Ch);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
    public List<ControlHoras> mostrarHoarasBB() throws Exception {
        ResultSet res;
        List<ControlHoras> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT * FROM `llenar` WHERE  estado=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
           
            res = pre.executeQuery();
            while (res.next()) {
                ControlHoras Ch = new ControlHoras();
                Ch.setIdRegistroHoras(res.getInt("IdRegistroHoras"));
                Ch.setSedeEstudio(res.getString("sedeEstudio"));
                Ch.setNombreEstudiante(res.getString("nombreEstudiante"));
                Ch.setEscuela(res.getString("EscuelaP"));
                Ch.setNombreCarrera(res.getString("nombreCarrera"));
                Ch.setIdEstudiante(res.getInt("IdEstudiante"));
                Ch.setEstadollenar(res.getInt("estado"));
                list.add(Ch);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
    //Insertar ControlHoras

    public void insertarCh(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO `llenar`( `sedeEstudio`, `nombreEstudiante`, `EscuelaP`, `nombreCarrera`, `IdEstudiante`, `estado`) VALUES (?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, co.getSedeEstudio());
            pre.setString(2, co.getNombreEstudiante());
            pre.setString(3, co.getEscuela());
            pre.setString(4, co.getNombreCarrera());
            pre.setInt(5, co.getIdEstudiante());
            pre.setInt(6, 1);
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    //registro de hora
    public int buscarHoras(Integer ca) throws Exception {
        int nivel = 0;
        try {
            this.conectar();
            String sql2 = "SELECT IdRegistroHoras  FROM `llenar` WHERE  estado=1  and IdEstudiante=?";
            PreparedStatement pre2 = this.getCon().prepareStatement(sql2);
            pre2.setInt(1, ca);
            ResultSet rs = pre2.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt("IdRegistroHoras");
            }
        } catch (Exception e) {
            throw e;
        }
        return nivel;

    }

    //Insertar act
    public void insertarChAct(ControlHoras co) throws Exception {
        try {
            this.conectar();

            String sql = "INSERT INTO `detallehoras`( `IdRegHoras`, `fechaAct`, `Actividad`, `HorasD`, `estado`) VALUES (?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getIdRHoras());
            pre.setString(2, co.getFechaAct());
            pre.setString(3, co.getActividad());
            pre.setDouble(4, co.getHorasD());
            pre.setInt(5, 1);
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //modificar

    public void modificarCH(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `llenar` SET`sedeEstudio`=?,`nombreEstudiante`=?,`EscuelaP`=?,`nombreCarrera`=?,`IdEstudiante`=?,`estado`=? WHERE  `IdRegistroHoras`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, co.getSedeEstudio());
            pre.setString(2, co.getNombreEstudiante());
            pre.setString(3, co.getEscuela());
            pre.setString(4, co.getNombreCarrera());
            pre.setInt(5, co.getIdEstudiante());
            pre.setInt(6, 1);
            pre.setInt(7, co.getIdRegistroHoras());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    //modificar actividades
    public void modificarAc(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `detallehoras` SET `fechaAct`=?,`Actividad`=?,`HorasD`=?,`estado`=? WHERE `IdDet`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, co.getFechaAct());
            pre.setString(2, co.getActividad());
            pre.setDouble(3, co.getHorasD());
            pre.setInt(4, 1);
            pre.setInt(5, co.getIdLlenar());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    //eliminado fisico
    public void eliminarCh(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM `llenar` WHERE IdRegistroHoras=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getIdRegistroHoras());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Eliminado fisico actividades

    public void eliminarAct(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM `detallehoras` WHERE IdDet=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, co.getIdLlenar());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //Eliminado logico

    public void EliminadoLogico(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `llenar` SET `estado`=? WHERE IdRegistroHoras=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setInt(2, co.getIdRegistroHoras());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    //eliminado logico actividades

    public void EliminadoLogicoAct(ControlHoras co) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `detallehoras` SET `estado`=? WHERE `IdDet`=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setInt(2, co.getIdLlenar());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
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
