package com.example.demo.TipoProducto;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/tipoproducto")
public class TipoProductoController {

    private final TipoProductoService tipoProductoService;

    // Inyección por constructor
    public TipoProductoController(TipoProductoService tipoProductoService) {
        this.tipoProductoService = tipoProductoService;
    }

    // LISTA TODOS LOS TIPOS DE PRODUCTO
    @GetMapping("/list")
    public String listarTipoProducto(Model model) {
        List<TipoProducto> lista = tipoProductoService.listarTipoProducto();
        model.addAttribute("tipoproductos", lista);
        return "tipoproducto/lista";
    }

    // ENDPOINT API
    @GetMapping("/api/list")
    public List<TipoProducto> obtenerProductos() {
        return tipoProductoService.listarTipoProducto();
    }

    // OBTENER UNO POR ID
    @PostMapping("/get")
    public String obtenerTipoProducto(@RequestParam("id") Integer id, Model model) {
        TipoProducto tipo = tipoProductoService.obtenerTipoProductoPorId(id);
        model.addAttribute("tipoProducto", tipo);
        return "tipoproducto/obtener";
    }

    // FORMULARIO CREAR
    @GetMapping("/crear")
    public String mostrarFormularioCrear(Model model) {
        model.addAttribute("tipoProducto", new TipoProducto());
        return "tipoproducto/crear";
    }

    // GUARDAR NUEVO
    @PostMapping("/crear")
    public String crearTipoProducto(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.crearTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list";
    }

    // FORMULARIO DE REGISTRO
    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("tipoProducto", new TipoProducto());
        return "tipoproducto/registro";
    }

    // REGISTRAR DESDE OTRO FORMULARIO
    @PostMapping("/registrar")
    public String registrarTipoProducto(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.crearTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list";
    }
}
