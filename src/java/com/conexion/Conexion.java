package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Nombre de la clase: Conexion
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class Conexion {

    private Connection con;
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localHost:3306/serviciosocial";
    private String user = "root";
    private String pass = "";

    public Connection con() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        return DriverManager.getConnection(url, user, pass);
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public void conectar() throws ClassNotFoundException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/serviciosocial?user=root&password=");
        } catch (Exception e) {
            throw e;
        }
    }

    public void desconectar() throws Exception {
        try {
            if (con != null) {
                if (con.isClosed() == false) {
                    con.close();
                }
            }
        } catch (Exception e) {
            throw e;
        }
    }
}
