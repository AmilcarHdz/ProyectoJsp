package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * Nombre de la clase:Validar
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class Validar extends Conexion{
    String sql="";
    PreparedStatement pre;
    ResultSet res;
    public int validarUsuario(String usuario,String clavemd5) throws Exception{
    int nivel=0;
        try {
          
           
            this.conectar();
            sql="select Privilegios from usuarios where Usuario='"+usuario+"' "
                    +"and Pass='"+clavemd5+"' ";
           pre=this.getCon().prepareStatement(sql);
           res=pre.executeQuery();
           while(res.next()){
           nivel=res.getInt(1);
           }
          
           res.close();
           return nivel;
        } catch (Exception e) {
            throw e;
        }
        finally{
        this.desconectar();
        }
    
    }
}
