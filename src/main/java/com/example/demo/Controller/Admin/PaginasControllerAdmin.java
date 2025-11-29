package com.example.demo.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaginasControllerAdmin {

    //Métricas
    @GetMapping("/ver-metricasInicio")
    public String mostrarMetricasInicio() {
        return "admin/Metricas/metricas";
    }

    @GetMapping("/ver-metricaEvSuscripciones")
    public String mostrarMetricaEvSuscripciones() {
        return "admin/Metricas/metricaEvolucionSuscripciones";
    }

    @GetMapping("/ver-metricaMetPago")
    public String mostrarMetricaMetPago() {
        return "admin/Metricas/metricaMetodosPago";
    }

    @GetMapping("/ver-metricaTasaRenov")
    public String mostrarMetricaTasaRenov() {
        return "admin/Metricas/metricaTasaRenovacion";
    }

    //CRUDs
    @GetMapping("/ver-CRUDsInicio")
    public String mostrarCRUDsInicio() {
        return "admin/CRUDs/CRUDs";
    }

    @GetMapping("/ver-CRUDPlanes")
    public String mostrarCRUDPlanes() {
        return "admin/CRUDs/planesCRUD";
    }

    @GetMapping("/ver-CRUDMembresias")
    public String mostrarCRUDMembresias() {
        return "admin/CRUDs/membresiasCRUD";
    }

    @GetMapping("/ver-CRUDTipoProducto")
    public String mostrarCRUDTipoProducto() {
        return "redirect:/tipoproducto/list";
    }

    @GetMapping("/ver-CRUDProductos")
    public String mostrarCRUDProductos() {
        return "redirect:/producto/list";
    }

    @GetMapping("/ver-CRUDUsuarios")
    public String mostrarCRUDUsuarios() {
        return "redirect:/usuario/list";
    }

    //Gestión
    @GetMapping("/ver-gestionInicio")
    public String mostrarGestionInicio() {
        return "admin/Gestion/gestionInicio";
    }
}