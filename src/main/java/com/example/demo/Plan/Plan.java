package com.example.demo.Plan;

public class Plan {
    private Integer idPlan;
    private String nombre;
    private String duracion;
    private Double precio;
    private String descripcion;
    private Boolean disponible;

    public Plan() {}

    public Plan(Integer idPlan, String nombre, String duracion, Double precio,
                String descripcion, Boolean disponible) {
        this.idPlan = idPlan;
        this.nombre = nombre;
        this.duracion = duracion;
        this.precio = precio;
        this.descripcion = descripcion;
        this.disponible = disponible;
    }

    // Getters y Setters
    public Integer getIdPlan() { return idPlan; }
    public void setIdPlan(Integer idPlan) { this.idPlan = idPlan; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDuracion() { return duracion; }
    public void setDuracion(String duracion) { this.duracion = duracion; }

    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public Boolean getDisponible() { return disponible; }
    public void setDisponible(Boolean disponible) { this.disponible = disponible; }
}