package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/metricas")
public class EvolucionSuscripcionesRestController {

    private final EvolucionSuscripcionesService evolucionSuscripcionesService;

    public EvolucionSuscripcionesRestController(EvolucionSuscripcionesService evolucionSuscripcionesService) {
        this.evolucionSuscripcionesService = evolucionSuscripcionesService;
    }

    @GetMapping("/evolucion-suscripciones")
    public List<Map<String, Object>> getEvolucionSuscripciones() {
        return evolucionSuscripcionesService.obtenerEvolucionSuscripciones();
    }
}