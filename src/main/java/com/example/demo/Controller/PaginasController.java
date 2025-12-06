package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaginasController {

    @GetMapping("")
    public String mostrarLogin() {
        return "redirect:/usuario/login";  // Esto redirige a UsuarioController
    }
}