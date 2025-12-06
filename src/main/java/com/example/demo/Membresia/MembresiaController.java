package com.example.demo.Membresia;

import com.example.demo.Controller.Usuario.UsuarioService;
import com.example.demo.Plan.PlanService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;


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
            @RequestParam(required = false) Integer usuario,
            @RequestParam(required = false) Integer plan,
            Model model) {

        List<Membresia> lista;

        switch (filtro) {
            case "canceladas":
                lista = membresiaService.listarMembresiasCanceladas();
                break;
            case "todas":
                lista = membresiaService.listarTodasMembresias();
                break;
            default:
                lista = membresiaService.listarMembresiasActivas();
        }

        // Cargar datos para los dropdowns
        model.addAttribute("membresias", lista);
        model.addAttribute("usuarios", usuarioService.listarUsuarios()); // Necesitas este servicio
        model.addAttribute("planes", planService.listarPlanes()); // Necesitas este servicio
        model.addAttribute("editarId", editarId);
        model.addAttribute("filtroActual", filtro);

        return "admin/CRUDs/membresiasCRUD";
    }

    @PostMapping("/crear")
    public String crearMembresia(
            @RequestParam("nombre") String nombre,
            @RequestParam("idUsuario") Integer idUsuario,
            @RequestParam("idPlan") Integer idPlan,
            @RequestParam("fechaInicio") String fechaInicio,
            @RequestParam("fechaFin") String fechaFin,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") Double precio) {

        Membresia membresia = new Membresia();
        membresia.setNombre(nombre);
        membresia.setIdUsuario(idUsuario);
        membresia.setIdPlan(idPlan);
        membresia.setFechaInicio(java.sql.Date.valueOf(fechaInicio));
        membresia.setFechaFin(java.sql.Date.valueOf(fechaFin));
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
            @RequestParam("fechaInicio") String fechaInicio,
            @RequestParam("fechaFin") String fechaFin,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") Double precio,
            @RequestParam("estado") String estado,
            @RequestParam("disponible") Boolean disponible) {

        Membresia membresia = new Membresia();
        membresia.setIdMembresia(idMembresia);
        membresia.setNombre(nombre);
        membresia.setIdUsuario(idUsuario);
        membresia.setIdPlan(idPlan);
        membresia.setFechaInicio(java.sql.Date.valueOf(fechaInicio));
        membresia.setFechaFin(java.sql.Date.valueOf(fechaFin));
        membresia.setDescripcion(descripcion);
        membresia.setPrecio(precio);
        membresia.setEstado(estado);
        membresia.setDisponible(disponible);

        membresiaService.actualizarMembresia(membresia);
        return "redirect:/membresia/list";
    }

    @PostMapping("/cancelar")
    public String cancelarMembresia(@RequestParam Integer id) {
        membresiaService.cancelarMembresia(id);
        return "redirect:/membresia/list";
    }

    @PostMapping("/reactivar")
    public String reactivarMembresia(@RequestParam Integer id) {
        membresiaService.reactivarMembresia(id);
        return "redirect:/membresia/list?filtro=canceladas";
    }
}