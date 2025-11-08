package com.example.demo.tipoProducto;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TipoProductoRepository implements  TipoProductoDAO{

    private final JdbcTemplate jdbcTemplate;

    public TipoProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    private final RowMapper<TipoProducto> rowMapper = (rs, rowNum) -> {
        return new TipoProducto(
                rs.getInt("id_tipo"),
                rs.getString("nombre_tipo"),
                rs.getString("descripcion_producto")
        );
    };

    @Override
    public List<TipoProducto> listarTipoProducto() {
        String sql = "SELECT id_tipo, nombre_tipo, descripcion_producto FROM tipo_producto";
        return jdbcTemplate.query(sql, rowMapper);
    }
    @Override
    public TipoProducto obtenerTipoProductoporId(int id) {
        String sql = "SELECT id_tipo, nombre_tipo, descripcion_producto FROM tipo_producto WHERE id_tipo = ?";
        return jdbcTemplate.queryForObject(sql, rowMapper, id);
    }
    @Override
    public void crearTipoProducto(TipoProducto tipoProducto) {
        String sql = "INSERT INTO tipo_producto (nombre_tipo, descripcion_producto) VALUES (?, ?)";
        jdbcTemplate.update(sql, tipoProducto.getNombreTipo(), tipoProducto.getDescripcionProducto());
    }
    @Override
    public void actualizarTipoProducto(TipoProducto tipoProducto) {
        String sql = "UPDATE tipo_producto SET nombre_tipo = ?, descripcion_producto = ? WHERE id_tipo = ?";
        jdbcTemplate.update(sql, tipoProducto.getNombreTipo(), tipoProducto.getDescripcionProducto(), tipoProducto.getIdTipo());
    }
    @Override
    public void eliminarTipoProducto(int id) {
        String sql = "DELETE FROM tipo_producto WHERE id_tipo = ?";
        jdbcTemplate.update(sql, id);
    }

}
