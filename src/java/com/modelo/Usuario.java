package com.modelo;
/**
 * Nombre de la clase:Usuario
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class Usuario {
    private int codigoU;
    private String usuario;
    private String contrasenia;
    private int privilegio;
    private int estado;

    public Usuario() {
    }

    public Usuario(int codigoU, String usuario, String contrasenia, int privilegio, int estado) {
        this.codigoU = codigoU;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
        this.privilegio = privilegio;
        this.estado = estado;
    }

    public int getCodigoU() {
        return codigoU;
    }

    public void setCodigoU(int codigoU) {
        this.codigoU = codigoU;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public int getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(int privilegio) {
        this.privilegio = privilegio;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }


}
