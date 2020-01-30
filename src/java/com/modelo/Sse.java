package com.modelo;

/**
 * Nombre de la clase: Sse
 * Fecha: 25-ene-2020
 * Copyright: ITCA FEPADE
 * @author ServicioSocial
 */
public class Sse {
    private int idSse;
    private String sede;
    private String nombreEstudiante;
    private String NombreIns;
    private String destinatarios;
    private String comentarios;
    private String estadoSol;
    private int carnetEstudiante;
    private int estado;
    private String fecha;

    public Sse() {
    }

    public Sse(int idSse, String sede, String nombreEstudiante, String NombreIns, String destinatarios, String comentarios, String estadoSol, int carnetEstudiante, int estado, String fecha) {
        this.idSse = idSse;
        this.sede = sede;
        this.nombreEstudiante = nombreEstudiante;
        this.NombreIns = NombreIns;
        this.destinatarios = destinatarios;
        this.comentarios = comentarios;
        this.estadoSol = estadoSol;
        this.carnetEstudiante = carnetEstudiante;
        this.estado = estado;
        this.fecha = fecha;
    }

    public int getIdSse() {
        return idSse;
    }

    public void setIdSse(int idSse) {
        this.idSse = idSse;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public String getNombreEstudiante() {
        return nombreEstudiante;
    }

    public void setNombreEstudiante(String nombreEstudiante) {
        this.nombreEstudiante = nombreEstudiante;
    }

    public String getNombreIns() {
        return NombreIns;
    }

    public void setNombreIns(String NombreIns) {
        this.NombreIns = NombreIns;
    }

    public String getDestinatarios() {
        return destinatarios;
    }

    public void setDestinatarios(String destinatarios) {
        this.destinatarios = destinatarios;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public String getEstadoSol() {
        return estadoSol;
    }

    public void setEstadoSol(String estadoSol) {
        this.estadoSol = estadoSol;
    }

    public int getCarnetEstudiante() {
        return carnetEstudiante;
    }

    public void setCarnetEstudiante(int carnetEstudiante) {
        this.carnetEstudiante = carnetEstudiante;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    
}
