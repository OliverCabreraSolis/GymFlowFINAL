package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.List;

public interface EvolucionSuscripcionesDAO {
    List<Object[]> altasPorMes();
    List<Object[]> bajasPorMes();
}
