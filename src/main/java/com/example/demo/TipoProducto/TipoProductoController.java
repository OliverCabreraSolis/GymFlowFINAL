package com.example.demo.TipoProducto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tipoproducto")
public class TipoProductoController {

    @Autowired
    private TipoProductoService tipoProductoService;

    // 📄 Listar todos los tipos de producto
    @GetMapping("/list")
    public String listar(Model model) {
        List<TipoProducto> lista = tipoProductoService.listaTipoProducto();
        model.addAttribute("tipoproductos", lista);
        return "tipoproducto/lista"; // JSP -> /WEB-INF/views/tipoproducto/lista.jsp
    }

    // 📄 Mostrar formulario para crear
    @GetMapping("/crear")
    public String mostrarFormularioCrear(Model model) {
        model.addAttribute("tipoProducto", new TipoProducto());
        return "tipoproducto/crear"; // JSP -> /WEB-INF/views/tipoproducto/crear.jsp
    }

    // 💾 Guardar nuevo tipo de producto
    @PostMapping("/crear")
    public String guardar(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.crearTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list";
    }

    // ✏️ Mostrar formulario de edición
    @GetMapping("/editar/{id}")
    public String editar(@PathVariable("id") int id, Model model) {
        TipoProducto tipoProducto = tipoProductoService.obtenerTipoProductoPorId(id);
        model.addAttribute("tipoProducto", tipoProducto);
        return "tipoproducto/editar"; // JSP -> /WEB-INF/views/tipoproducto/editar.jsp
    }

    // 💾 Actualizar tipo de producto
    @PostMapping("/actualizar")
    public String actualizar(@ModelAttribute("tipoProducto") TipoProducto tipoProducto) {
        tipoProductoService.actualizarTipoProducto(tipoProducto);
        return "redirect:/tipoproducto/list";
    }

    // ❌ Eliminar tipo de producto
    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable("id") int id) {
        tipoProductoService.eliminarTipoProducto(id);
        return "redirect:/tipoproducto/list";
    }
}
