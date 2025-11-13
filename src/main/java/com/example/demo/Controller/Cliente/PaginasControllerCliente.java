package com.example.demo.Controller.Cliente;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaginasControllerCliente {

    @GetMapping("/ver-inicio")
    public String mostrarInicio() {
        return "usuario/inicio";
    }

    @GetMapping("/ver-anuncio")
    public String mostrarAnuncio() {
        return "usuario/anuncio";
    }

    @GetMapping("/ver-contacto")
    public String mostrarContacto() {
        return "usuario/contacto";
    }

    @GetMapping("/ver-login")
    public String mostrarLogin() {
        return "login/login";
    }

    @GetMapping("/ver-membresias")
    public String mostrarMembresias() {
        return "usuario/membresias";
    }

    @GetMapping("/ver-pagos")
    public String mostrarPagos() {
        return "usuario/pagos";
    }

    @GetMapping("/ver-productos")
    public String mostrarProductos() {
        return "usuario/productos";
    }
}