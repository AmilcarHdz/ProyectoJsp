package com.modelo;

/**
 * Nombre de la clase: Cuentas
 * Fecha: 24-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class Cuentas  {
    private String User;
    private String Pass;
    private int nivel;
    private int IdUser;

    public Cuentas() {
    }

    public Cuentas(String User, String Pass, int nivel, int IdUser) {
        this.User = User;
        this.Pass = Pass;
        this.nivel = nivel;
        this.IdUser = IdUser;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String User) {
        this.User = User;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getIdUser() {
        return IdUser;
    }

    public void setIdUser(int IdUser) {
        this.IdUser = IdUser;
    }
    
}
