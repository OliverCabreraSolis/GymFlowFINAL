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

    public TipoProductoController(TipoProductoService tipoProductoService) {
        this.tipoProductoService = tipoProductoService;
    }

    @GetMapping("/list")
    public String listarTipoProducto(
            @RequestParam(required = false) Integer editarId,
            @RequestParam(required = false, defaultValue = "activos") String filtro,
            Model model) {

        System.out.println("🎯 TIPOPRODUCTO CONTROLLER - Cargando datos: " + filtro);

        List<TipoProducto> lista;

        switch (filtro) {
            case "inactivos":
                lista = tipoProductoService.listarTipoProductoInactivos();
                break;
            case "todos":
                lista = tipoProductoService.listarTodosTipoProducto();
                break;
            default: // activos
                lista = tipoProductoService.listarTipoProducto();
        }

        System.out.println("📦 Datos cargados: " + lista.size() + " elementos");

        model.addAttribute("tipoproductos", lista);
        model.addAttribute("editarId", editarId);
        model.addAttribute("filtroActual", filtro);

        // 🚨 ESTA ES LA LÍNEA IMPORTANTE - usa la vista de admin
        return "admin/CRUDs/tipoProductoCRUD";
    }

    // LISTA CON FILTROS
    // EN TipoProductoController - CAMBIA todos los return:
    // CAMBIA los redirects para que vayan al Controller con datos:
    @PostMapping("/crear")
    public String crearTipoProducto(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.crearTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list"; // ← Al Controller con datos
    }

    @PostMapping("/actualizar")
    public String actualizarTipoProducto(@ModelAttribute TipoProducto tipoProducto) {
        tipoProductoService.actualizarTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list"; // ← Al Controller con datos
    }

    @PostMapping("/desactivar")
    public String desactivarTipoProducto(@RequestParam Integer id) {
        tipoProductoService.desactivarTipoProducto(id);
        return "redirect:/tipoproducto/list"; // ← Al Controller con datos
    }

    @PostMapping("/reactivar")
    public String reactivarTipoProducto(@RequestParam Integer id) {
        tipoProductoService.reactivarTipoProducto(id);
        return "redirect:/tipoproducto/list?filtro=inactivos"; // ← Al Controller con datos
    }
}