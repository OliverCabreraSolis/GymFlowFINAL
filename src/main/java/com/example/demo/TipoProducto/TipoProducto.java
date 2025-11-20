package com.example.demo.TipoProducto;

public class TipoProducto {

    private Integer idTipo;
    private String nombreTipo;
    private String descripcionProducto;
    private Boolean disponible;

    public TipoProducto() {
        // Constructor vacio
    }

    public TipoProducto(Integer idTipo, String nombreTipo, String descripcionProducto, Boolean disponible) {
        this.idTipo = idTipo;
        this.nombreTipo = nombreTipo;
        this.descripcionProducto = descripcionProducto;
        this.disponible = disponible;
    }

    public Integer getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public Boolean getDisponible() {
        return disponible;
    }

    public void setDisponible(Boolean disponible) {
        this.disponible = disponible;
    }
}
