package com.example.demo.Plan;

import com.example.demo.Plan.Plan;
import com.example.demo.Plan.PlanService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/plan")
public class PlanController {

    private final PlanService planService;

    public PlanController(PlanService planService) {
        this.planService = planService;
    }


    @GetMapping("/list")
    public String listarPlanes(
            @RequestParam(required = false) Integer editarId,
            @RequestParam(required = false, defaultValue = "activos") String filtro,
            Model model) {

        System.out.println("🎯 PLAN CONTROLLER - Cargando: " + filtro);

        List<Plan> lista;

        switch (filtro) {
            case "inactivos":
                lista = planService.listarPlanesInactivos();
                break;
            case "todos":
                lista = planService.listarTodosPlanes();
                break;
            default:
                lista = planService.listarPlanes();
        }

        model.addAttribute("planes", lista);
        model.addAttribute("editarId", editarId);
        model.addAttribute("filtroActual", filtro);

        return "admin/CRUDs/planesCRUD";
    }

    @PostMapping("/crear")
    public String crearPlan(
            @RequestParam("nombre") String nombre,
            @RequestParam("duracion") String duracion,
            @RequestParam("precio") Double precio,
            @RequestParam("descripcion") String descripcion) {

        Plan plan = new Plan();
        plan.setNombre(nombre);
        plan.setDuracion(duracion);
        plan.setPrecio(precio);
        plan.setDescripcion(descripcion);
        plan.setDisponible(true);

        planService.crearPlan(plan);
        return "redirect:/plan/list";
    }

    @PostMapping("/actualizar")
    public String actualizarPlan(
            @RequestParam("idPlan") Integer idPlan,
            @RequestParam("nombre") String nombre,
            @RequestParam("duracion") String duracion,
            @RequestParam("precio") Double precio,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("disponible") Boolean disponible) {

        Plan plan = new Plan();
        plan.setIdPlan(idPlan);
        plan.setNombre(nombre);
        plan.setDuracion(duracion);
        plan.setPrecio(precio);
        plan.setDescripcion(descripcion);
        plan.setDisponible(disponible);

        planService.actualizarPlan(plan);
        return "redirect:/plan/list";
    }

    @PostMapping("/desactivar")
    public String desactivarPlan(@RequestParam Integer id) {
        planService.desactivarPlan(id);
        return "redirect:/plan/list";
    }

    @PostMapping("/reactivar")
    public String reactivarPlan(@RequestParam Integer id) {
        planService.reactivarPlan(id);
        return "redirect:/plan/list?filtro=inactivos";
    }
}