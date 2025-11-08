package com.example.demo.TipoProducto;

public class TipoProducto {

    private int idTipo;
    private String nombreTipo;
    private String descripcionProducto;

    public TipoProducto() {
    }

    public TipoProducto(int idTipo, String nombreTipo, String descripcionProducto) {
        this.idTipo = idTipo;
        this.nombreTipo = nombreTipo;
        this.descripcionProducto = descripcionProducto;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
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
