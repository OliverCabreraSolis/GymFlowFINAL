package com.example.demo.Producto;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/producto")
public class ProductoController {

    private final ProductoService productoService;

    public ProductoController(ProductoService productoService) {
        this.productoService = productoService;
    }

    @GetMapping("/list")
    public String listarProductos(Model model) {
        model.addAttribute("productos", productoService.listarProducto());
        return "producto/lista";
    }

    @GetMapping("/crear")
    public String mostrarFormularioCrear(Model model) {
        model.addAttribute("producto", new Producto());
        return "productoproducto/crear";
    }

    @PostMapping("/crear")
    public String crearProducto(@ModelAttribute("producto") Producto producto) {
        productoService.crearProducto(producto);
        return "redirect:/producto/list";
    }

    @PostMapping("/get")
    public String obtenerProducto(@RequestParam("id") Integer id, Model model) {
        Producto producto = productoService.obtenerProductoPorId(id);
        model.addAttribute("producto", producto);
        return "producto/obtener";
    }
}
