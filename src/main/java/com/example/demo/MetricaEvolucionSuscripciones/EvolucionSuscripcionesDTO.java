package com.example.demo.MetricaEvolucionSuscripciones;

public class EvolucionSuscripcionesDTO {
    private String mes;
    private int altas;
    private int bajas;
    private double porcentajeAltas;
    private double porcentajeBajas;

    public EvolucionSuscripcionesDTO(String mes, int altas, int bajas,
                                     double porcentajeAltas, double porcentajeBajas) {
        this.mes = mes;
        this.altas = altas;
        this.bajas = bajas;
        this.porcentajeAltas = porcentajeAltas;
        this.porcentajeBajas = porcentajeBajas;
    }

    // getters y setters
}
