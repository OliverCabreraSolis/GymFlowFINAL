package com.example.demo.Controller.Plan;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;

@Repository
public class PlanRepository implements PlanDAO {

    private final JdbcTemplate jdbcTemplate;

    public PlanRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Plan> planRowMapper = (rs, rowNum) -> {
        Plan plan = new Plan();
        plan.setIdPlan(rs.getInt("ID_PLAN"));
        plan.setNombre(rs.getString("NOMBRE"));
        plan.setDuracion(rs.getString("DURACION"));
        plan.setPrecio(rs.getDouble("PRECIO"));
        plan.setDescripcion(rs.getString("DESCRIPCION"));
        plan.setDisponible(rs.getBoolean("DISPONIBLE"));
        return plan;
    };

    @Override
    public List<Plan> listarPlanes() {
        System.out.println("🔍 Buscando PLANES ACTIVOS...");
        String query = "SELECT ID_PLAN, NOMBRE, DURACION, PRECIO, DESCRIPCION, DISPONIBLE FROM PLAN WHERE DISPONIBLE = TRUE";
        List<Plan> resultados = jdbcTemplate.query(query, planRowMapper);
        System.out.println("✅ PLANES ACTIVOS encontrados: " + resultados.size());
        return resultados;
    }

    @Override
    public List<Plan> listarPlanesInactivos() {
        System.out.println("🔍 Buscando PLANES INACTIVOS...");
        String query = "SELECT ID_PLAN, NOMBRE, DURACION, PRECIO, DESCRIPCION, DISPONIBLE FROM PLAN WHERE DISPONIBLE = FALSE";
        List<Plan> resultados = jdbcTemplate.query(query, planRowMapper);
        System.out.println("✅ PLANES INACTIVOS encontrados: " + resultados.size());
        return resultados;
    }

    @Override
    public List<Plan> listarTodosPlanes() {
        System.out.println("🔍 Buscando TODOS LOS PLANES...");
        String query = "SELECT ID_PLAN, NOMBRE, DURACION, PRECIO, DESCRIPCION, DISPONIBLE FROM PLAN";
        List<Plan> resultados = jdbcTemplate.query(query, planRowMapper);
        System.out.println("✅ TODOS LOS PLANES encontrados: " + resultados.size());
        return resultados;
    }

    @Override
    public Plan obtenerPlanPorId(Integer id) {
        String query = "SELECT ID_PLAN, NOMBRE, DURACION, PRECIO, DESCRIPCION, DISPONIBLE FROM PLAN WHERE ID_PLAN = ?";
        try {
            return jdbcTemplate.queryForObject(query, planRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearPlan(Plan plan) {
        String query = "INSERT INTO PLAN (NOMBRE, DURACION, PRECIO, DESCRIPCION, DISPONIBLE) VALUES (?, ?, ?, ?, TRUE)";
        jdbcTemplate.update(query,
                plan.getNombre(),
                plan.getDuracion(),
                plan.getPrecio(),
                plan.getDescripcion());
        System.out.println("✅ PLAN CREADO: " + plan.getNombre());
    }

    @Override
    public void actualizarPlan(Plan plan) {
        String query = "UPDATE PLAN SET NOMBRE = ?, DURACION = ?, PRECIO = ?, DESCRIPCION = ?, DISPONIBLE = ? WHERE ID_PLAN = ?";
        jdbcTemplate.update(query,
                plan.getNombre(),
                plan.getDuracion(),
                plan.getPrecio(),
                plan.getDescripcion(),
                plan.getDisponible(),
                plan.getIdPlan());
        System.out.println("✅ PLAN ACTUALIZADO: " + plan.getNombre());
    }

    @Override
    public void desactivarPlan(Integer id) {
        String query = "UPDATE PLAN SET DISPONIBLE = FALSE WHERE ID_PLAN = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ PLAN DESACTIVADO: ID " + id);
    }

    @Override
    public void reactivarPlan(Integer id) {
        String query = "UPDATE PLAN SET DISPONIBLE = TRUE WHERE ID_PLAN = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ PLAN REACTIVADO: ID " + id);
    }
}