package com.example.demo.Producto;

public class Producto {
    private Integer idProducto;
    private Integer idTipo;
    private String nombre;
    private String descripcion;
    private Double precio;
    private Boolean disponible;

    public Producto() {
    // Constructor vacío
    }
    public Producto(Integer idProducto, Integer idTipo, String nombre, String descripcion, Double precio, Boolean disponible) {
        this.idProducto = idProducto;
        this.idTipo = idTipo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.disponible = disponible;
}

    public Integer getIdProducto() { return idProducto; }
    public void setIdProducto(Integer idProducto) { this.idProducto = idProducto; }

    public Integer getIdTipo() { return idTipo; }
    public void setIdTipo(Integer idTipo) { this.idTipo = idTipo; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }

    public Boolean getDisponible() { return disponible; }
    public void setDisponible(Boolean disponible) { this.disponible = disponible; }
}