package com.example.demo.tipoProducto;

public class TipoProducto {

    private Integer idTipo;
    private String nombreTipo;
    private String descripcionProducto;

    public TipoProducto() {
    }

    public TipoProducto(Integer idTipo, String nombreTipo, String descripcionProducto) {
        this.idTipo = idTipo;
        this.nombreTipo = nombreTipo;
        this.descripcionProducto = descripcionProducto;
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
}
