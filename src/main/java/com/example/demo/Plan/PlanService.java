package com.example.demo.Plan;

import java.util.List;

public interface PlanService {
    List<Plan> listarPlanes();
    List<Plan> listarPlanesInactivos();
    List<Plan> listarTodosPlanes();
    Plan obtenerPlanPorId(int id);
    void crearPlan(Plan plan);
    void actualizarPlan(Plan plan);
    void desactivarPlan(Integer id);
    void reactivarPlan(Integer id);
}
