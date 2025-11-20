package com.example.demo.Controller.Cliente;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaginasControllerCliente {

    @GetMapping("/ver-inicio")
    public String mostrarInicio() {
        return "cliente/inicio";
    }

    @GetMapping("/ver-anuncio")
    public String mostrarAnuncio() {
        return "cliente/anuncio";
    }

    @GetMapping("/ver-contacto")
    public String mostrarContacto() {
        return "cliente/contacto";
    }

    @GetMapping("/ver-login")
    public String mostrarLogin() {
        return "login/login";
    }

    @GetMapping("/ver-membresias")
    public String mostrarMembresias() {
        return "cliente/membresias";
    }

    @GetMapping("/ver-pagos")
    public String mostrarPagos() {
        return "cliente/pagos";
    }

    @GetMapping("/ver-productos")
    public String mostrarProductos() {
        return "cliente/productos";
    }
}