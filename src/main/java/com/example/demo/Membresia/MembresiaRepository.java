package com.example.demo.Membresia;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;
import java.util.List;

@Repository
public class MembresiaRepository implements MembresiaDAO {

    private final JdbcTemplate jdbcTemplate;

    public MembresiaRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Membresia> membresiaRowMapper = (rs, rowNum) -> {
        Membresia membresia = new Membresia();
        membresia.setIdMembresia(rs.getInt("id_membresia"));
        membresia.setIdUsuario(rs.getInt("id_usuario"));
        membresia.setIdPlan(rs.getInt("id_plan"));
        membresia.setNombre(rs.getString("nombre"));
        membresia.setFechaInicio(rs.getDate("fecha_inicio"));
        membresia.setFechaFin(rs.getDate("fecha_fin"));
        membresia.setDescripcion(rs.getString("descripcion"));
        membresia.setPrecio(rs.getDouble("precio"));
        membresia.setEstado(rs.getString("estado"));
        membresia.setDisponible(rs.getBoolean("disponible"));
        return membresia;
    };

    @Override
    public List<Membresia> listarMembresias() {
        String query = "SELECT * FROM membresia WHERE disponible = TRUE ORDER BY fecha_inicio DESC";
        return jdbcTemplate.query(query, membresiaRowMapper);
    }

    @Override
    public List<Membresia> listarMembresiasActivas() {
        String query = "SELECT * FROM membresia WHERE disponible = TRUE AND estado = 'ACTIVA' ORDER BY fecha_inicio DESC";
        return jdbcTemplate.query(query, membresiaRowMapper);
    }

    @Override
    public List<Membresia> listarMembresiasCanceladas() {
        String query = "SELECT * FROM membresia WHERE disponible = TRUE AND estado = 'CANCELADA' ORDER BY fecha_inicio DESC";
        return jdbcTemplate.query(query, membresiaRowMapper);
    }

    @Override
    public List<Membresia> listarTodasMembresias() {
        String query = "SELECT * FROM membresia ORDER BY fecha_inicio DESC";
        return jdbcTemplate.query(query, membresiaRowMapper);
    }

    @Override
    public Membresia obtenerMembresiaPorId(Integer id) {
        String query = "SELECT * FROM membresia WHERE id_membresia = ?";
        try {
            return jdbcTemplate.queryForObject(query, membresiaRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearMembresia(Membresia membresia) {
        String sql = "INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                membresia.getIdUsuario(),
                membresia.getIdPlan(),
                membresia.getNombre(),
                membresia.getFechaInicio(),
                membresia.getFechaFin(),
                membresia.getDescripcion(),
                membresia.getPrecio(),
                "ACTIVA",
                true);
    }

    @Override
    public void actualizarMembresia(Membresia membresia) {
        String query = "UPDATE membresia SET nombre = ?, fecha_inicio = ?, fecha_fin = ?, descripcion = ?, precio = ?, estado = ?, disponible = ? WHERE id_membresia = ?";
        jdbcTemplate.update(query,
                membresia.getNombre(),
                membresia.getFechaInicio(),
                membresia.getFechaFin(),
                membresia.getDescripcion(),
                membresia.getPrecio(),
                membresia.getEstado(),
                membresia.getDisponible(),
                membresia.getIdMembresia());
    }

    @Override
    public void cancelarMembresia(Integer id) {
        String query = "UPDATE membresia SET estado = 'CANCELADA' WHERE id_membresia = ?";
        jdbcTemplate.update(query, id);
    }

    @Override
    public void reactivarMembresia(Integer id) {
        String query = "UPDATE membresia SET estado = 'ACTIVA' WHERE id_membresia = ?";
        jdbcTemplate.update(query, id);
    }
}