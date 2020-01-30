package com.modelo;

/**
 * Nombre de la clase: ControlHoras
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class ControlHoras {
    //tabla llenar
     private int idRegistroHoras;
    private String sedeEstudio;
    private String nombreEstudiante;
    private String Escuela;
    private String nombreCarrera;
    private int idEstudiante;
    private int estadollenar;
    //tabla detallehoras
    private int idLlenar;
    private int idRHoras ;
    private String fechaAct;
    private String actividad;
    private double horasD;
    private int estadoDetalleH;
    public ControlHoras() {
    }

    public ControlHoras(int idRegistroHoras, String sedeEstudio, String nombreEstudiante, String Escuela, String nombreCarrera, int idEstudiante, int estadollenar, int idLlenar, int idRHoras, String fechaAct, String actividad, double horasD, int estadoDetalleH) {
        this.idRegistroHoras = idRegistroHoras;
        this.sedeEstudio = sedeEstudio;
        this.nombreEstudiante = nombreEstudiante;
        this.Escuela = Escuela;
        this.nombreCarrera = nombreCarrera;
        this.idEstudiante = idEstudiante;
        this.estadollenar = estadollenar;
        this.idLlenar = idLlenar;
        this.idRHoras = idRHoras;
        this.fechaAct = fechaAct;
        this.actividad = actividad;
        this.horasD = horasD;
        this.estadoDetalleH = estadoDetalleH;
    }

    public int getIdRegistroHoras() {
        return idRegistroHoras;
    }

    public void setIdRegistroHoras(int idRegistroHoras) {
        this.idRegistroHoras = idRegistroHoras;
    }

    public String getSedeEstudio() {
        return sedeEstudio;
    }

    public void setSedeEstudio(String sedeEstudio) {
        this.sedeEstudio = sedeEstudio;
    }

    public String getNombreEstudiante() {
        return nombreEstudiante;
    }

    public void setNombreEstudiante(String nombreEstudiante) {
        this.nombreEstudiante = nombreEstudiante;
    }

    public String getEscuela() {
        return Escuela;
    }

    public void setEscuela(String Escuela) {
        this.Escuela = Escuela;
    }

    public String getNombreCarrera() {
        return nombreCarrera;
    }

    public void setNombreCarrera(String nombreCarrera) {
        this.nombreCarrera = nombreCarrera;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getEstadollenar() {
        return estadollenar;
    }

    public void setEstadollenar(int estadollenar) {
        this.estadollenar = estadollenar;
    }

    public int getIdLlenar() {
        return idLlenar;
    }

    public void setIdLlenar(int idLlenar) {
        this.idLlenar = idLlenar;
    }

    public int getIdRHoras() {
        return idRHoras;
    }

    public void setIdRHoras(int idRHoras) {
        this.idRHoras = idRHoras;
    }

    public String getFechaAct() {
        return fechaAct;
    }

    public void setFechaAct(String fechaAct) {
        this.fechaAct = fechaAct;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    public double getHorasD() {
        return horasD;
    }

    public void setHorasD(double horasD) {
        this.horasD = horasD;
    }

    public int getEstadoDetalleH() {
        return estadoDetalleH;
    }

    public void setEstadoDetalleH(int estadoDetalleH) {
        this.estadoDetalleH = estadoDetalleH;
    }
    
    
}
