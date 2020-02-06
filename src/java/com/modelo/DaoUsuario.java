package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: 
 * DaoUsuario Fecha: 25-ene-2020 
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class DaoUsuario extends Conexion {

    //Insertar Usuario
    public void insertarUsuario(Usuario us) throws Exception {
        try {
            this.conectar();
            String sql = "insert into usuarios (`Usuario`, `Pass`, `Privilegios`,`estado`) values(?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, us.getUsuario());
            pre.setString(2, us.getContrasenia());
            pre.setInt(3, us.getPrivilegio());
            pre.setInt(4, 1);
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    //Eliminado Fisico
    public void eliminarUsuario(Usuario us) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM usuario WHERE codigoUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, us.getCodigoU());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    //Mostrar usuario
    public List<Usuario> mostrarUsuario() throws Exception {
        ResultSet res;
        List<Usuario> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT *FROM usuarios where estado=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            while (res.next()) {
                Usuario us = new Usuario();
                us.setCodigoU(res.getInt("IdUsuario"));
                us.setUsuario(res.getString("Usuario"));
                us.setContrasenia(res.getString("Pass"));
                us.setPrivilegio(res.getInt("privilegios"));
                us.setEstado(res.getInt("estado"));
                list.add(us);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
    
    //Mostrar usuario eliminado
    public List<Usuario> mostrarUsuarioEliminado() throws Exception {
        ResultSet res;
        List<Usuario> list = new ArrayList();
        try {
            this.conectar();
            String sql = "SELECT *FROM usuarios where estado=0";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            while (res.next()) {
                Usuario us = new Usuario();
                us.setCodigoU(res.getInt("IdUsuario"));
                us.setUsuario(res.getString("Usuario"));
                us.setContrasenia(res.getString("Pass"));
                us.setPrivilegio(res.getInt("privilegios"));
                us.setEstado(res.getInt("estado"));
                list.add(us);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    //eliminado logico
    public void EliminadoLogico(Usuario us) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `usuarios` SET `estado`=? WHERE IdUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setInt(2, us.getCodigoU());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    
    //recuperar eliminado logico
    public void recuperarEliminadoLogico(Usuario us) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE `usuarios` SET `estado`=1 WHERE IdUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, us.getCodigoU());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    //modificar usuario
    public void modificarUsuario(Usuario us) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE usuarios SET `Usuario`=?, `Pass`=?, `Privilegios`=? WHERE IdUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, us.getUsuario());
            pre.setString(2, us.getContrasenia());
            pre.setInt(3, us.getPrivilegio());
            pre.setInt(4, us.getCodigoU());

            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

}
