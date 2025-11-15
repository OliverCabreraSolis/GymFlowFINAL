package com.example.demo.TipoProducto;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TipoProductoRepository implements TipoProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public TipoProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<TipoProducto> tipoProductoRowMapper = (rs, rowNum) -> {
        return new TipoProducto(
                rs.getInt("id_tipo"),
                rs.getString("nombre_tipo"),
                rs.getString("descripcion_producto"),
                rs.getBoolean("disponible")
        );
    };

    @Override
    public List<TipoProducto> listarTipoProducto() {
        String query = "SELECT id_tipo, nombre_tipo, descripcion_producto, disponible FROM tipo_producto WHERE disponible = TRUE";
        return jdbcTemplate.query(query, tipoProductoRowMapper);
    }

    @Override
    public TipoProducto obtenerTipoProductoporId(Integer id) {
        String query = "SELECT id_tipo, nombre_tipo, descripcion_producto, disponible FROM tipo_producto WHERE id_tipo = ?";
        List<TipoProducto> result = jdbcTemplate.query(query, tipoProductoRowMapper, id);

        if (result.isEmpty()) {
            return null;
        } else if (result.size() == 1) {
            return result.get(0);
        } else {
            throw new IllegalStateException("Expected 0 or 1 row but found " + result.size());
        }
    }

    @Override
    public void crearTipoProducto(TipoProducto tipoProducto) {
        String query = "INSERT INTO tipo_producto (nombre_tipo, descripcion_producto, disponible) VALUES (?, ?, TRUE)";
        jdbcTemplate.update(query, tipoProducto.getNombreTipo(), tipoProducto.getDescripcionProducto());
    }

    @Override
    public void actualizarTipoProducto(TipoProducto tipoProducto) {
        String query = "UPDATE tipo_producto SET nombre_tipo = ?, descripcion_producto = ? WHERE id_tipo = ?";
        jdbcTemplate.update(query, tipoProducto.getNombreTipo(), tipoProducto.getDescripcionProducto(), tipoProducto.getIdTipo());
    }

    @Override
    public void desactivarTipoProducto(Integer id) {
        String query = "UPDATE tipo_producto SET disponible = FALSE WHERE id_tipo = ?";
        jdbcTemplate.update(query, id);
    }
}
