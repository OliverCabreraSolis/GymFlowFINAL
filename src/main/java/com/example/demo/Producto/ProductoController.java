package com.example.demo.Producto;

import com.example.demo.TipoProducto.TipoProducto;
import com.example.demo.TipoProducto.TipoProductoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/producto")
public class ProductoController {

    private final ProductoService productoService;
    private final TipoProductoService tipoProductoService;

    public ProductoController(ProductoService productoService, TipoProductoService tipoProductoService) {
        this.productoService = productoService;
        this.tipoProductoService = tipoProductoService;
    }

    @GetMapping("/list")
    public String listarProductos(
            @RequestParam(required = false) Integer editarId,
            @RequestParam(required = false, defaultValue = "activos") String filtro,
            @RequestParam(required = false) Integer tipo, // 🆕 Nuevo parámetro
            Model model) {

        List<Producto> lista;

        // 🆕 PRIMERO verifica si hay filtro por tipo
        if (tipo != null) {
            lista = productoService.listarProductosPorTipo(tipo);
        } else {
            // Si no, usa los filtros normales
            switch (filtro) {
                case "inactivos":
                    lista = productoService.listarProductosInactivos();
                    break;
                case "todos":
                    lista = productoService.listarTodosProductos();
                    break;
                default: // activos
                    lista = productoService.listarProductos();
            }
        }

        List<TipoProducto> tipos = tipoProductoService.listarTipoProducto();

        model.addAttribute("productos", lista);
        model.addAttribute("tipos", tipos);
        model.addAttribute("editarId", editarId);
        model.addAttribute("filtroActual", filtro);

        return "admin/CRUDs/productosCRUD";
    }

    @PostMapping("/crear")
    public String crearProducto(
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") Double precio,
            @RequestParam("idTipo") Integer idTipo) {

        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setIdTipo(idTipo);
        producto.setDisponible(true);

        productoService.crearProducto(producto);
        return "redirect:/producto/list";
    }

    @PostMapping("/actualizar")
    public String actualizarProducto(
            @RequestParam("idProducto") Integer idProducto,
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") Double precio,
            @RequestParam("idTipo") Integer idTipo,
            @RequestParam("disponible") Boolean disponible) {

        Producto producto = new Producto();
        producto.setIdProducto(idProducto);
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setIdTipo(idTipo);
        producto.setDisponible(disponible);

        productoService.actualizarProducto(producto);
        return "redirect:/producto/list";
    }

    @PostMapping("/desactivar")
    public String desactivarProducto(@RequestParam Integer id) {
        productoService.desactivarProducto(id);
        return "redirect:/producto/list";
    }

    @PostMapping("/reactivar")
    public String reactivarProducto(@RequestParam Integer id) {
        productoService.reactivarProducto(id);
        return "redirect:/producto/list?filtro=inactivos";
    }
}