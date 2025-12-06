package com.example.demo.Plan;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;
import java.util.List;

@Repository
public class PlanRepository implements PlanDAO {

    private final JdbcTemplate jdbcTemplate;

    public PlanRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Plan> planRowMapper = (rs, rowNum) -> {
        Plan plan = new Plan();
        plan.setIdPlan(rs.getInt("id_plan"));
        plan.setNombre(rs.getString("nombre"));
        plan.setDuracion(rs.getString("duracion"));
        plan.setPrecio(rs.getDouble("precio"));
        plan.setDescripcion(rs.getString("descripcion"));
        plan.setDisponible(rs.getBoolean("disponible"));
        return plan;
    };

    @Override
    public List<Plan> listarPlanes() {
        String query = "SELECT * FROM plan WHERE disponible = TRUE ORDER BY nombre";
        return jdbcTemplate.query(query, planRowMapper);
    }

    @Override
    public List<Plan> listarPlanesInactivos() {
        String query = "SELECT * FROM plan WHERE disponible = FALSE ORDER BY nombre";
        return jdbcTemplate.query(query, planRowMapper);
    }

    @Override
    public List<Plan> listarTodosPlanes() {
        String query = "SELECT * FROM plan ORDER BY nombre";
        return jdbcTemplate.query(query, planRowMapper);
    }

    @Override
    public Plan obtenerPlanPorId(Integer id) {
        String query = "SELECT * FROM plan WHERE id_plan = ?";
        try {
            return jdbcTemplate.queryForObject(query, planRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearPlan(Plan plan) {
        String query = "INSERT INTO plan (nombre, duracion, precio, descripcion, disponible) VALUES (?, ?, ?, ?, TRUE)";
        jdbcTemplate.update(query, plan.getNombre(), plan.getDuracion(), plan.getPrecio(), plan.getDescripcion());
    }

    @Override
    public void actualizarPlan(Plan plan) {
        String query = "UPDATE plan SET nombre = ?, duracion = ?, precio = ?, descripcion = ?, disponible = ? WHERE id_plan = ?";
        jdbcTemplate.update(query, plan.getNombre(), plan.getDuracion(), plan.getPrecio(),
                plan.getDescripcion(), plan.getDisponible(), plan.getIdPlan());
    }

    @Override
    public void desactivarPlan(Integer id) {
        String query = "UPDATE plan SET disponible = FALSE WHERE id_plan = ?";
        jdbcTemplate.update(query, id);
    }

    @Override
    public void reactivarPlan(Integer id) {
        String query = "UPDATE plan SET disponible = TRUE WHERE id_plan = ?";
        jdbcTemplate.update(query, id);
    }
}