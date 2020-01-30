package com.modelo;

/**
 * Nombre de la clase: HorarioYAct
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class HorarioYAct {

    private int idA;
    private int carneEstudiante;
    private String actR;
    private String objetivo;
    private String meta;
    private int duracion;
    private String lunes;
    private String martes;
    private String miercoles;
    private String jueves;
    private String viernes;
    private String sabado;
    private String domingo;
    private String nombreEstudiante;
    private String estadoS;
    private int estado;

    public HorarioYAct() {
    }

    public HorarioYAct(int idA, int carneEstudiante, String actR, String objetivo, String meta, int duracion, String lunes, String martes, String miercoles, String jueves, String viernes, String sabado, String domingo, String nombreEstudiante, String estadoS, int estado) {
        this.idA = idA;
        this.carneEstudiante = carneEstudiante;
        this.actR = actR;
        this.objetivo = objetivo;
        this.meta = meta;
        this.duracion = duracion;
        this.lunes = lunes;
        this.martes = martes;
        this.miercoles = miercoles;
        this.jueves = jueves;
        this.viernes = viernes;
        this.sabado = sabado;
        this.domingo = domingo;
        this.nombreEstudiante = nombreEstudiante;
        this.estadoS = estadoS;
        this.estado = estado;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public int getCarneEstudiante() {
        return carneEstudiante;
    }

    public void setCarneEstudiante(int carneEstudiante) {
        this.carneEstudiante = carneEstudiante;
    }

    public String getActR() {
        return actR;
    }

    public void setActR(String actR) {
        this.actR = actR;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getLunes() {
        return lunes;
    }

    public void setLunes(String lunes) {
        this.lunes = lunes;
    }

    public String getMartes() {
        return martes;
    }

    public void setMartes(String martes) {
        this.martes = martes;
    }

    public String getMiercoles() {
        return miercoles;
    }

    public void setMiercoles(String miercoles) {
        this.miercoles = miercoles;
    }

    public String getJueves() {
        return jueves;
    }

    public void setJueves(String jueves) {
        this.jueves = jueves;
    }

    public String getViernes() {
        return viernes;
    }

    public void setViernes(String viernes) {
        this.viernes = viernes;
    }

    public String getSabado() {
        return sabado;
    }

    public void setSabado(String sabado) {
        this.sabado = sabado;
    }

    public String getDomingo() {
        return domingo;
    }

    public void setDomingo(String domingo) {
        this.domingo = domingo;
    }

    public String getNombreEstudiante() {
        return nombreEstudiante;
    }

    public void setNombreEstudiante(String nombreEstudiante) {
        this.nombreEstudiante = nombreEstudiante;
    }

    public String getEstadoS() {
        return estadoS;
    }

    public void setEstadoS(String estadoS) {
        this.estadoS = estadoS;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
                     
}
