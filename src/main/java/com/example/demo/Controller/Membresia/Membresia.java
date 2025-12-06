package com.example.demo.Controller.Membresia;

import java.sql.Date;

public class Membresia {
    private Integer idMembresia;
    private Integer idUsuario;
    private Integer idPlan;
    private String nombre;
    private Date fechaInicio;
    private Date fechaFin;
    private String descripcion;
    private Double precio;
    private String estado;
    private Boolean disponible;

    // Campos adicionales para JOIN
    private String nombreUsuario;
    private String nombrePlan;
    private String duracionPlan;
    private Double precioPlan;

    public Membresia() {
        // Constructor vacío
    }

    public Membresia(Integer idMembresia, Integer idUsuario, Integer idPlan, String nombre,
                     Date fechaInicio, Date fechaFin, String descripcion,
                     Double precio, String estado, Boolean disponible) {
        this.idMembresia = idMembresia;
        this.idUsuario = idUsuario;
        this.idPlan = idPlan;
        this.nombre = nombre;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descripcion = descripcion;
        this.precio = precio;
        this.estado = estado;
        this.disponible = disponible;
    }

    // Getters y Setters
    public Integer getIdMembresia() { return idMembresia; }
    public void setIdMembresia(Integer idMembresia) { this.idMembresia = idMembresia; }

    public Integer getIdUsuario() { return idUsuario; }
    public void setIdUsuario(Integer idUsuario) { this.idUsuario = idUsuario; }

    public Integer getIdPlan() { return idPlan; }
    public void setIdPlan(Integer idPlan) { this.idPlan = idPlan; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public Date getFechaInicio() { return fechaInicio; }
    public void setFechaInicio(Date fechaInicio) { this.fechaInicio = fechaInicio; }

    public Date getFechaFin() { return fechaFin; }
    public void setFechaFin(Date fechaFin) { this.fechaFin = fechaFin; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public Boolean getDisponible() { return disponible; }
    public void setDisponible(Boolean disponible) { this.disponible = disponible; }

    // Getters y Setters para campos adicionales
    public String getNombreUsuario() { return nombreUsuario; }
    public void setNombreUsuario(String nombreUsuario) { this.nombreUsuario = nombreUsuario; }

    public String getNombrePlan() { return nombrePlan; }
    public void setNombrePlan(String nombrePlan) { this.nombrePlan = nombrePlan; }

    public String getDuracionPlan() { return duracionPlan; }
    public void setDuracionPlan(String duracionPlan) { this.duracionPlan = duracionPlan; }

    public Double getPrecioPlan() { return precioPlan; }
    public void setPrecioPlan(Double precioPlan) { this.precioPlan = precioPlan; }
}