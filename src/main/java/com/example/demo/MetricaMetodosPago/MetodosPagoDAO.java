package com.example.demo.MetricaMetodosPago;

import java.util.List;
import java.util.Map;

public interface MetodosPagoDAO {
    List<Map<String, Object>> obtenerDistribucionMetodosPago();
}