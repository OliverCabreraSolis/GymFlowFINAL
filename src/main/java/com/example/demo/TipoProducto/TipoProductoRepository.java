package com.example.demo.TipoProducto;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;

@Repository
public class TipoProductoRepository implements TipoProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public TipoProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<TipoProducto> tipoProductoRowMapper = (rs, rowNum) -> {
        // mayúsculas para H2
        TipoProducto tipo = new TipoProducto();
        tipo.setIdTipo(rs.getInt("ID_TIPO"));
        tipo.setNombreTipo(rs.getString("NOMBRE_TIPO"));
        tipo.setDescripcionProducto(rs.getString("DESCRIPCION_PRODUCTO"));
        tipo.setDisponible(rs.getBoolean("DISPONIBLE"));

        System.out.println("📥 Mapeando: " + tipo.getNombreTipo() + " - " + tipo.getDisponible());
        return tipo;
    };

    @Override
    public List<TipoProducto> listarTipoProducto() {
        System.out.println("🔍 Buscando ACTIVOS...");
        String query = "SELECT ID_TIPO, NOMBRE_TIPO, DESCRIPCION_PRODUCTO, DISPONIBLE FROM TIPO_PRODUCTO WHERE DISPONIBLE = TRUE";
        List<TipoProducto> resultados = jdbcTemplate.query(query, tipoProductoRowMapper);
        System.out.println("✅ ACTIVOS encontrados: " + resultados.size());
        return resultados;
    }

    @Override
    public List<TipoProducto> listarTipoProductoInactivos() {
        System.out.println("🔍 Buscando INACTIVOS...");
        String query = "SELECT ID_TIPO, NOMBRE_TIPO, DESCRIPCION_PRODUCTO, DISPONIBLE FROM TIPO_PRODUCTO WHERE DISPONIBLE = FALSE";
        List<TipoProducto> resultados = jdbcTemplate.query(query, tipoProductoRowMapper);
        System.out.println("✅ INACTIVOS encontrados: " + resultados.size());
        return resultados;
    }

    @Override
    public List<TipoProducto> listarTodosTipoProducto() {
        System.out.println("🔍 Buscando TODOS...");
        String query = "SELECT ID_TIPO, NOMBRE_TIPO, DESCRIPCION_PRODUCTO, DISPONIBLE FROM TIPO_PRODUCTO";
        List<TipoProducto> resultados = jdbcTemplate.query(query, tipoProductoRowMapper);
        System.out.println("✅ TODOS encontrados: " + resultados.size());
        return resultados;
    }

    // Los demás métodos mantienen la misma lógica...
    @Override
    public TipoProducto obtenerTipoProductoporId(Integer id) {
        String query = "SELECT ID_TIPO, NOMBRE_TIPO, DESCRIPCION_PRODUCTO, DISPONIBLE FROM TIPO_PRODUCTO WHERE ID_TIPO = ?";
        try {
            return jdbcTemplate.queryForObject(query, tipoProductoRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearTipoProducto(TipoProducto tipoProducto) {
        String query = "INSERT INTO TIPO_PRODUCTO (NOMBRE_TIPO, DESCRIPCION_PRODUCTO, DISPONIBLE) VALUES (?, ?, TRUE)";
        jdbcTemplate.update(query, tipoProducto.getNombreTipo(), tipoProducto.getDescripcionProducto());
        System.out.println("✅ CREADO: " + tipoProducto.getNombreTipo());
    }

    @Override
    public void actualizarTipoProducto(TipoProducto tipoProducto) {
        String query = "UPDATE TIPO_PRODUCTO SET NOMBRE_TIPO = ?, DESCRIPCION_PRODUCTO = ?, DISPONIBLE = ? WHERE ID_TIPO = ?";
        jdbcTemplate.update(query,
                tipoProducto.getNombreTipo(),
                tipoProducto.getDescripcionProducto(),
                tipoProducto.getDisponible(),
                tipoProducto.getIdTipo());
        System.out.println("✅ ACTUALIZADO: " + tipoProducto.getNombreTipo());
    }

    @Override
    public void desactivarTipoProducto(Integer id) {
        String query = "UPDATE TIPO_PRODUCTO SET DISPONIBLE = FALSE WHERE ID_TIPO = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ DESACTIVADO: ID " + id);
    }

    @Override
    public void reactivarTipoProducto(Integer id) {
        String query = "UPDATE TIPO_PRODUCTO SET DISPONIBLE = TRUE WHERE ID_TIPO = ?";
        jdbcTemplate.update(query, id);
        System.out.println("✅ REACTIVADO: ID " + id);
    }

}