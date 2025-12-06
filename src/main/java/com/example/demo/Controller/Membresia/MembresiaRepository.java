package com.example.demo.Controller.Membresia;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;

@Repository
public class MembresiaRepository implements MembresiaDAO {

    private final JdbcTemplate jdbcTemplate;

    public MembresiaRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Membresia> membresiaRowMapper = (rs, rowNum) -> {
        Membresia membresia = new Membresia();
        membresia.setIdMembresia(rs.getInt("ID_MEMBRESIA"));
        membresia.setIdUsuario(rs.getInt("ID_USUARIO"));
        membresia.setIdPlan(rs.getInt("ID_PLAN"));
        membresia.setNombre(rs.getString("NOMBRE"));
        membresia.setFechaInicio(rs.getDate("FECHA_INICIO"));
        membresia.setFechaFin(rs.getDate("FECHA_FIN"));
        membresia.setDescripcion(rs.getString("DESCRIPCION"));
        membresia.setPrecio(rs.getDouble("PRECIO"));
        membresia.setEstado(rs.getString("ESTADO"));
        membresia.setDisponible(rs.getBoolean("DISPONIBLE"));

        // Campos adicionales de JOIN
        try {
            membresia.setNombreUsuario(rs.getString("NOMBRE_USUARIO"));
            membresia.setNombrePlan(rs.getString("NOMBRE_PLAN"));
            membresia.setDuracionPlan(rs.getString("DURACION_PLAN"));
            membresia.setPrecioPlan(rs.getDouble("PRECIO_PLAN"));
        } catch (Exception e) {
            // Si no existen las columnas, se ignoran
        }

        return membresia;
    };

    @Override
    public List<Membresia> listarMembresias() {
        System.out.println("🔍 Buscando MEMBRESÍAS ACTIVAS...");
        String query = "SELECT m.*, u.NOMBRE as NOMBRE_USUARIO, p.NOMBRE as NOMBRE_PLAN, " +
                "p.DURACION as DURACION_PLAN, p.PRECIO as PRECIO_PLAN " +
                "FROM MEMBRESIA m " +
                "INNER JOIN USUARIO u ON m.ID_USUARIO = u.ID_USUARIO " +
                "INNER JOIN PLAN p ON m.ID_PLAN = p.ID_PLAN " +
                "WHERE m.DISPONIBLE = TRUE";
        List<Membresia> resultados = jdbcTemplate.query(query, membresiaRowMapper);
        System.out.println("✅ MEMBRESÍAS ACTIVAS encontradas: " + resultados.size());
        return resultados;
    }

    @Override
    public List<Membresia> listarMembresiasInactivas() {
        System.out.println("🔍 Buscando MEMBRESÍAS INACTIVAS...");
        String query = "SELECT m.*, u.NOMBRE as NOMBRE_USUARIO, p.NOMBRE as NOMBRE_PLAN, " +
                "p.DURACION as DURACION_PLAN, p.PRECIO as PRECIO_PLAN " +
                "FROM MEMBRESIA m " +
                "INNER JOIN USUARIO u ON m.ID_USUARIO = u.ID_USUARIO " +
                "INNER JOIN PLAN p ON m.ID_PLAN = p.ID_PLAN " +
                "WHERE m.DISPONIBLE = FALSE";
        List<Membresia> resultados = jdbcTemplate.query(query, membresiaRowMapper);
        System.out.println("✅ MEMBRESÍAS INACTIVAS encontradas: " + resultados.size());
        return resultados;
    }

    @Override
    public List<Membresia> listarTodasMembresias() {
        System.out.println("🔍 Buscando TODAS LAS MEMBRESÍAS...");
        String query = "SELECT m.*, u.NOMBRE as NOMBRE_USUARIO, p.NOMBRE as NOMBRE_PLAN, " +
                "p.DURACION as DURACION_PLAN, p.PRECIO as PRECIO_PLAN " +
                "FROM MEMBRESIA m " +
                "INNER JOIN USUARIO u ON m.ID_USUARIO = u.ID_USUARIO " +
                "INNER JOIN PLAN p ON m.ID_PLAN = p.ID_PLAN";
        List<Membresia> resultados = jdbcTemplate.query(query, membresiaRowMapper);
        System.out.println("✅ TODAS LAS MEMBRESÍAS encontradas: " + resultados.size());
        return resultados;
    }

    @Override
    public List<Membresia> listarMembresiasPorUsuario(Integer idUsuario) {
        String query = "SELECT m.*, u.NOMBRE as NOMBRE_USUARIO, p.NOMBRE as NOMBRE_PLAN, " +
                "p.DURACION as DURACION_PLAN, p.PRECIO as PRECIO_PLAN " +
                "FROM MEMBRESIA m " +
                "INNER JOIN USUARIO u ON m.ID_USUARIO = u.ID_USUARIO " +
                "INNER JOIN PLAN p ON m.ID_PLAN = p.ID_PLAN " +
                "WHERE m.ID_USUARIO = ? AND m.DISPONIBLE = TRUE";
        return jdbcTemplate.query(query, membresiaRowMapper, idUsuario);
    }

    @Override
    public List<Membresia> listarMembresiasPorPlan(Integer idPlan) {
        String query = "SELECT m.*, u.NOMBRE as NOMBRE_USUARIO, p.NOMBRE as NOMBRE_PLAN, " +
                "p.DURACION as DURACION_PLAN, p.PRECIO as PRECIO_PLAN " +
                "FROM MEMBRESIA m " +
                "INNER JOIN USUARIO u ON m.ID_USUARIO = u.ID_USUARIO " +
                "INNER JOIN PLAN p ON m.ID_PLAN = p.ID_PLAN " +
                "WHERE m.ID_PLAN = ? AND m.DISPONIBLE = TRUE";
        return jdbcTemplate.query(query, membresiaRowMapper, idPlan);
    }

    @Override
    public Membresia obtenerMembresiaPorId(Integer id) {
        String query = "SELECT m.*, u.NOMBRE as NOMBRE_USUARIO, p.NOMBRE as NOMBRE_PLAN, " +
                "p.DURACION as DURACION_PLAN, p.PRECIO as PRECIO_PLAN " +
                "FROM MEMBRESIA m " +
                "INNER JOIN USUARIO u ON m.ID_USUARIO = u.ID_USUARIO " +
                "INNER JOIN PLAN p ON m.ID_PLAN = p.ID_PLAN " +
                "WHERE m.ID_MEMBRESIA = ?";
        try {
            return jdbcTemplate.queryForObject(query, membresiaRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearMembresia(Membresia membresia) {
        String query = "INSERT INTO MEMBRESIA (ID_USUARIO, ID_PLAN, NOMBRE, FECHA_INICIO, " +
                "FECHA_FIN, DESCRIPCION, PRECIO, ESTADO, DISPONIBLE) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, TRUE)";
        jdbcTemplate.update(query,
                membresia.getIdUsuario(),
                membresia.getIdPlan(),
                membresia.getNombre(),
                membresia.getFechaInicio(),
                membresia.getFechaFin(),
                membresia.getDescripcion(),
                membresia.getPrecio(),
                membresia.getEstado());
        System.out.println("✅ MEMBRESÍA CREADA: " + membresia.getNombre());
    }

    @Override
    public void actualizarMembresia(Membresia membresia) {
        String query = "UPDATE MEMBRESIA SET ID_USUARIO = ?, ID_PLAN = ?, NOMBRE = ?, " +
                "FECHA_INICIO = ?, FECHA_FIN = ?, DESCRIPCION = ?, PRECIO = ?, " +
                "ESTADO = ?, DISPONIBLE = ? WHERE ID_MEMBRESIA = ?";
        jdbcTemplate.update(query,
                membresia.getIdUsuario(),
                membresia.getIdPlan(),
                membresia.getNombre(),
                membresia.getFechaInicio(),
                membresia.getFechaFin(),
                membresia.getDescripcion(),
                membresia.getPrecio(),
                membresia.getEstado(),
                membresia.getDisponible(),
                membresia.getIdMembresia());
        System.out.println("✅ MEMBRESÍA ACTUALIZADA: " + membresia.getNombre());
    }

    @Override
    public void desactivarMembresia(Integer id) {
        String query = "UPDATE MEMBRESIA SET DISPONIBLE = FALSE WHERE ID_MEMBRESIA = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ MEMBRESÍA DESACTIVADA: ID " + id);
    }

    @Override
    public void reactivarMembresia(Integer id) {
        String query = "UPDATE MEMBRESIA SET DISPONIBLE = TRUE WHERE ID_MEMBRESIA = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ MEMBRESÍA REACTIVADA: ID " + id);
    }

    @Override
    public void cancelarMembresia(Integer id) {
        String query = "UPDATE MEMBRESIA SET ESTADO = 'CANCELADA' WHERE ID_MEMBRESIA = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ MEMBRESÍA CANCELADA: ID " + id);
    }

    @Override
    public void activarMembresia(Integer id) {
        String query = "UPDATE MEMBRESIA SET ESTADO = 'ACTIVA' WHERE ID_MEMBRESIA = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ MEMBRESÍA ACTIVADA: ID " + id);
    }
}