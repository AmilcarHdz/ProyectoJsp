package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoEstudiante
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoEstudiante extends Conexion {

    public List<Estudiante> mostrarEstudiante() throws Exception {
        ResultSet res;
        List<Estudiante> list = new ArrayList();

        try {
            this.conectar();
            String sql = "SELECT *FROM estudiantes";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            Estudiante e;
            res = pre.executeQuery();

            while (res.next()) {
                Carrera car = new Carrera();
                car.setCodigo(res.getInt("IdCarrera"));

                e = new Estudiante(
                        res.getInt("IdEstudiante"),
                        res.getString("NombreEstudiante"),
                        res.getInt("Edad"),
                        res.getString("Sexo"),
                        res.getString("CorreoElectronico"),
                        res.getString("EstadoCarrera"),
                        res.getString("Sede"), car);
                list.add(e);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    public List<Carrera> listarCarreras() throws Exception {
        ResultSet res;
        List<Carrera> list = new ArrayList();

        try {
            this.conectar();
            String sql = "SELECT *FROM carrera";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            while (res.next()) {
                Carrera car = new Carrera();

                car.setCodigo(res.getInt("IdCarrera"));
                car.setNombre(res.getString("NombreCarrera"));
                car.setTipoCarrera(res.getString("Tipocarrera"));
                list.add(car);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    public void insertarEstudiante(Estudiante es) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO estudiantes VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setInt(1, es.getCodigo());
            pre.setString(2, es.getNombre());
            pre.setInt(3, es.getEdad());
            pre.setString(4, es.getSexo());
            pre.setString(5, es.getCorreo());
            pre.setInt(6, es.getCarrera().getCodigo());
            pre.setString(7, es.getEstado());
            pre.setString(8, es.getSede());
           
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    public void modificarEstudiante(Estudiante es) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE estudiantes SET NombreEstudiante=?, Edad=?,Sexo=?,CorreoElectronico=?,IdCarrera=?,EstadoCarrera=?,Sede=? WHERE IdEstudiante=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            Carrera car=new Carrera();
            pre.setString(1, es.getNombre());
            pre.setInt(2, es.getEdad());
            pre.setString(3, es.getSexo());
            pre.setString(4, es.getCorreo());
            pre.setInt(5, es.getCarrera().getCodigo());
            pre.setString(6, es.getEstado());
            pre.setString(7, es.getSede());
            pre.setInt(8, es.getCodigo());

            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    public void eliminarEstudiante(Estudiante es) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM estudiantes WHERE IdEstudiante=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setInt(1, es.getCodigo());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
}
