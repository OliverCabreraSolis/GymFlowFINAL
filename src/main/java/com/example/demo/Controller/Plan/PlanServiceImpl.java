package com.example.demo.Controller.Plan;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class PlanServiceImpl implements PlanService {

    private final PlanDAO planDAO;

    public PlanServiceImpl(PlanDAO planDAO) {
        this.planDAO = planDAO;
    }

    @Override
    public List<Plan> listarPlanes() {
        return planDAO.listarPlanes();
    }

    @Override
    public List<Plan> listarPlanesInactivos() {
        return planDAO.listarPlanesInactivos();
    }

    @Override
    public List<Plan> listarTodosPlanes() {
        return planDAO.listarTodosPlanes();
    }

    @Override
    public Plan obtenerPlanPorId(int id) {
        return planDAO.obtenerPlanPorId(id);
    }

    @Override
    public void crearPlan(Plan plan) {
        planDAO.crearPlan(plan);
    }

    @Override
    public void actualizarPlan(Plan plan) {
        planDAO.actualizarPlan(plan);
    }

    @Override
    public void desactivarPlan(Integer id) {
        planDAO.desactivarPlan(id);
    }

    @Override
    public void reactivarPlan(Integer id) {
        planDAO.reactivarPlan(id);
    }
}