package com.example.demo.MetricaMetodosPago;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/metricas")
public class MetodosPagoRestController {

    private final MetodosPagoService metodosPagoService;

    public MetodosPagoRestController(MetodosPagoService metodosPagoService) {
        this.metodosPagoService = metodosPagoService;
    }

    @GetMapping("/metodos-pago")
    public ResponseEntity<?> getMetodosPago() {
        try {
            List<Map<String, Object>> datos = metodosPagoService.obtenerDistribucionMetodosPago();
            return ResponseEntity.ok(datos);
        } catch (Exception e) {
            return ResponseEntity.status(500)
                    .body(Map.of("error", "Error al obtener métodos de pago: " + e.getMessage()));
        }
    }
}