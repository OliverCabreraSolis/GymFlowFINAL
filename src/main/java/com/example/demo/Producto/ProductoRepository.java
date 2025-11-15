package com.example.demo.Producto;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductoRepository implements ProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public ProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Producto> productoRowMapper = (rs, rowNum) ->
            new Producto(
                    rs.getInt("id_producto"),
                    rs.getInt("id_tipo"),
                    rs.getString("nombre"),
                    rs.getString("descripcion"),
                    rs.getDouble("precio"),
                    rs.getBoolean("disponible")
            );

    @Override
    public List<Producto> listarProducto() {
        String sql = "SELECT id_producto, id_tipo, nombre, descripcion, precio, disponible FROM producto WHERE disponible = TRUE";
        return jdbcTemplate.query(sql, productoRowMapper);
    }

    @Override
    public Producto obtenerProductoPorId(Integer id) {
        String sql = "SELECT id_producto, id_tipo, nombre, descripcion, precio, disponible FROM producto WHERE id_producto = ?";
        List<Producto> result = jdbcTemplate.query(sql, productoRowMapper, id);
        if (result.isEmpty()) return null;
        else return result.get(0);
    }

    @Override
    public void crearProducto(Producto producto) {
        String sql = "INSERT INTO producto (id_tipo, nombre, descripcion, precio, disponible) VALUES (?, ?, ?, ?, TRUE)";
        jdbcTemplate.update(sql, producto.getIdTipo(), producto.getNombre(), producto.getDescripcion(), producto.getPrecio());
    }

    @Override
    public void actualizarProducto(Producto producto) {
        String sql = "UPDATE producto SET id_tipo = ?, nombre = ?, descripcion = ?, precio = ? WHERE id_producto = ?";
        jdbcTemplate.update(sql, producto.getIdTipo(), producto.getNombre(), producto.getDescripcion(), producto.getPrecio(), producto.getIdProducto());
    }

    @Override
    public void desactivarProducto(Integer id) {
        String sql = "UPDATE producto SET disponible = FALSE WHERE id_producto = ?";
        jdbcTemplate.update(sql, id);
    }
}
