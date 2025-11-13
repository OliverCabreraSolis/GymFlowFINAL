package com.example.demo.TipoProducto;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/tipoproducto")
public class TipoProductoController {
    private final TipoProductoService tipoProductoService;

    public TipoProductoController(TipoProductoService tipoProductoService) {
        this.tipoProductoService = tipoProductoService;
    }
   @GetMapping("/list")
   public String listarTipoProducto(Model model){
        List<TipoProducto> lista =  tipoProductoService.listarTipoProducto();
        model.addAttribute("tipoproductos",lista);
        return "admin/tipoproductoCRUD";
   }
    @GetMapping("/crear")
    public String mostrarFormularioCrear(Model model) {
        model.addAttribute("tipoProducto", new TipoProducto());
        return "tipoproducto/crear";
    }
    @PostMapping("/crear")
    public String crearTipoProducto(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.crearTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list";
    }
    @GetMapping("/editar")
    public String editarTipoProducto(@RequestParam("id") int id, Model model) {
        TipoProducto tipoProducto = tipoProductoService.obtenerTipoProductoporId(id);
        model.addAttribute("tipoProducto", tipoProducto);
        return "tipoproducto/editar";
    }
    @PostMapping("/actualizar")
    public String actualizarTipoProducto(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.actualizarTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list";
    }
    @GetMapping("/eliminar")
    public String eliminarTipoProducto(@RequestParam("id") int id) {
        tipoProductoService.eliminarTipoProducto(id);
        return "redirect:/tipoproducto/list";
    }
}