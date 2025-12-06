package com.example.demo.MetricaTasaRenovacion;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/metricas")
public class TasaRenovacionRestController {

    private final TasaRenovacionService tasaRenovacionService;

    public TasaRenovacionRestController(TasaRenovacionService tasaRenovacionService) {
        this.tasaRenovacionService = tasaRenovacionService;
    }

    @GetMapping("/tasa-renovacion")
    public ResponseEntity<?> getTasaRenovacion() {
        try {
            List<Map<String, Object>> datos = tasaRenovacionService.obtenerTasaRenovacion();
            return ResponseEntity.ok(datos);
        } catch (Exception e) {
            return ResponseEntity.status(500)
                    .body(Map.of("error", "Error al obtener tasa de renovación: " + e.getMessage()));
        }
    }
}