package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.List;

public interface EvolucionSuscripcionesService {
    int obtenerAltasMesActual();
    int obtenerBajasMesActual();
    int obtenerCrecimientoNeto();
    List<EvolucionSuscripcionesDTO> obtenerComparativo();
}

