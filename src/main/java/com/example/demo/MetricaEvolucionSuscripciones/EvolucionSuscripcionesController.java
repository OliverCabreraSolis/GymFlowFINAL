package com.example.demo.MetricaEvolucionSuscripciones;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/metricas/evolucion")
public class EvolucionSuscripcionesController {

    @Autowired
    private EvolucionSuscripcionesService service;

    @GetMapping
    public String mostrarMetrica(Model model) {

        model.addAttribute("nuevasSuscripciones", service.obtenerAltasMesActual());
        model.addAttribute("bajasPeriodo", service.obtenerBajasMesActual());
        model.addAttribute("crecimientoNeto", service.obtenerCrecimientoNeto());
        model.addAttribute("datosComparativos", service.obtenerComparativo());

        return "metricas/metricaEvolucionSuscripciones";
    }
}
