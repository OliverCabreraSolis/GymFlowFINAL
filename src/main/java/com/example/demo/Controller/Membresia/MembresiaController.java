package com.example.demo.Controller.Membresia;

import java.sql.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/membresia")
public class MembresiaController {

    private final MembresiaService membresiaService;
    private final UsuarioService usuarioService;
    private final PlanService planService;

    public MembresiaController(MembresiaService membresiaService,
                               UsuarioService usuarioService,
                               PlanService planService) {
        this.membresiaService = membresiaService;
        this.usuarioService = usuarioService;
        this.planService = planService;
    }

    @GetMapping("/list")
    public String listarMembresias(
            @RequestParam(required = false) Integer editarId,
            @RequestParam(required = false, defaultValue = "activas") String filtro,
            @RequestParam(required = false) Integer usuario, // Filtro por usuario
            @RequestParam(required = false) Integer plan,    // Filtro por plan
            Model model) {

        System.out.println("🎯 MEMBRESIA CONTROLLER - Cargando datos: " + filtro);

        List<Membresia> lista;

        // Primero verifica filtros específicos
        if (usuario != null) {
            lista = membresiaService.listarMembresiasPorUsuario(usuario);
        } else if (plan != null) {
            lista = membresiaService.listarMembresiasPorPlan(plan);
        } else {
            // Si no, usa los filtros normales
            switch (filtro) {
                case "inactivas":
                    lista = membresiaService.listarMembresiasInactivas();
                    break;
                case "todas":
                    lista = membresiaService.listarTodasMembresias();
                    break;
                default: // activas
                    lista = membresiaService.listarMembresias();
            }
        }

        // Obtener listas para los select
        List<Usuario> usuarios = usuarioService.listarUsuarios();
        List<Plan> planes = planService.listarPlanes();

        model.addAttribute("membresias", lista);
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("planes", planes);
        model.addAttribute("editarId", editarId);
        model.addAttribute("filtroActual", filtro);

        return "admin/CRUDs/membresiasCRUD";
    }

    @PostMapping("/crear")
    public String crearMembresia(
            @RequestParam("nombre") String nombre,
            @RequestParam("idUsuario") Integer idUsuario,
            @RequestParam("idPlan") Integer idPlan,
            @RequestParam("fechaInicio") String fechaInicioStr,
            @RequestParam("fechaFin") String fechaFinStr,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") Double precio) {

        Membresia membresia = new Membresia();
        membresia.setNombre(nombre);
        membresia.setIdUsuario(idUsuario);
        membresia.setIdPlan(idPlan);
        membresia.setFechaInicio(Date.valueOf(fechaInicioStr));
        membresia.setFechaFin(Date.valueOf(fechaFinStr));
        membresia.setDescripcion(descripcion);
        membresia.setPrecio(precio);
        membresia.setEstado("ACTIVA");
        membresia.setDisponible(true);

        membresiaService.crearMembresia(membresia);
        return "redirect:/membresia/list";
    }

    @PostMapping("/actualizar")
    public String actualizarMembresia(
            @RequestParam("idMembresia") Integer idMembresia,
            @RequestParam("nombre") String nombre,
            @RequestParam("idUsuario") Integer idUsuario,
            @RequestParam("idPlan") Integer idPlan,
            @RequestParam("fechaInicio") String fechaInicioStr,
            @RequestParam("fechaFin") String fechaFinStr,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") Double precio,
            @RequestParam("estado") String estado,
            @RequestParam("disponible") Boolean disponible) {

        Membresia membresia = new Membresia();
        membresia.setIdMembresia(idMembresia);
        membresia.setNombre(nombre);
        membresia.setIdUsuario(idUsuario);
        membresia.setIdPlan(idPlan);
        membresia.setFechaInicio(Date.valueOf(fechaInicioStr));
        membresia.setFechaFin(Date.valueOf(fechaFinStr));
        membresia.setDescripcion(descripcion);
        membresia.setPrecio(precio);
        membresia.setEstado(estado);
        membresia.setDisponible(disponible);

        membresiaService.actualizarMembresia(membresia);
        return "redirect:/membresia/list";
    }

    @PostMapping("/desactivar")
    public String desactivarMembresia(@RequestParam Integer id) {
        membresiaService.desactivarMembresia(id);
        return "redirect:/membresia/list";
    }

    @PostMapping("/reactivar")
    public String reactivarMembresia(@RequestParam Integer id) {
        membresiaService.reactivarMembresia(id);
        return "redirect:/membresia/list?filtro=inactivas";
    }

    @PostMapping("/cancelar")
    public String cancelarMembresia(@RequestParam Integer id) {
        membresiaService.cancelarMembresia(id);
        return "redirect:/membresia/list";
    }

    @PostMapping("/activar")
    public String activarMembresia(@RequestParam Integer id) {
        membresiaService.activarMembresia(id);
        return "redirect:/membresia/list";
    }
}