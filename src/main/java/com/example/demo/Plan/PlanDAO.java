package com.example.demo.Plan;

import java.util.List;

public interface PlanDAO {
    List<Plan> listarPlanes();                     // Solo activos
    List<Plan> listarPlanesInactivos();            // Solo inactivos
    List<Plan> listarTodosPlanes();                // Todos
    Plan obtenerPlanPorId(Integer id);
    void crearPlan(Plan plan);
    void actualizarPlan(Plan plan);
    void desactivarPlan(Integer id);
    void reactivarPlan(Integer id);
}
