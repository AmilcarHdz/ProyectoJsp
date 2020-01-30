package com.modelo;

/**
 * Nombre de la clase:Carrera
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class Carrera {
    private int codigo;
    private String nombre;
    private String tipoCarrera;

    public Carrera() {
    }

    public Carrera(int codigo, String nombre, String tipoCarrera) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.tipoCarrera = tipoCarrera;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoCarrera() {
        return tipoCarrera;
    }

    public void setTipoCarrera(String tipoCarrera) {
        this.tipoCarrera = tipoCarrera;
    }

    
}
