package com.example.demo.Producto;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;

@Repository
public class ProductoRepository implements ProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public ProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Producto> productoRowMapper = (rs, rowNum) -> {
        Producto producto = new Producto();
        producto.setIdProducto(rs.getInt("ID_PRODUCTO"));
        producto.setIdTipo(rs.getInt("ID_TIPO"));
        producto.setNombre(rs.getString("NOMBRE"));
        producto.setDescripcion(rs.getString("DESCRIPCION"));
        producto.setPrecio(rs.getDouble("PRECIO"));
        producto.setDisponible(rs.getBoolean("DISPONIBLE"));
        try {
            producto.setNombreTipo(rs.getString("NOMBRE_TIPO"));
        } catch (Exception e) {
            // Si no existe la columna, se ignora
        }
        return producto;
    };

    // 🆕 MÉTODO NUEVO - Filtro por tipo
    @Override
    public List<Producto> listarProductosPorTipo(Integer idTipo) {
        String query = "SELECT p.ID_PRODUCTO, p.ID_TIPO, p.NOMBRE, p.DESCRIPCION, p.PRECIO, p.DISPONIBLE, " +
                "tp.NOMBRE_TIPO FROM PRODUCTO p " +
                "INNER JOIN TIPO_PRODUCTO tp ON p.ID_TIPO = tp.ID_TIPO " +
                "WHERE p.ID_TIPO = ?";
        return jdbcTemplate.query(query, productoRowMapper, idTipo);
    }

    @Override
    public List<Producto> listarProductos() {
        String query = "SELECT p.ID_PRODUCTO, p.ID_TIPO, p.NOMBRE, p.DESCRIPCION, p.PRECIO, p.DISPONIBLE, " +
                "tp.NOMBRE_TIPO FROM PRODUCTO p " +
                "INNER JOIN TIPO_PRODUCTO tp ON p.ID_TIPO = tp.ID_TIPO " +
                "WHERE p.DISPONIBLE = TRUE";
        return jdbcTemplate.query(query, productoRowMapper);
    }

    @Override
    public List<Producto> listarProductosInactivos() {
        String query = "SELECT p.ID_PRODUCTO, p.ID_TIPO, p.NOMBRE, p.DESCRIPCION, p.PRECIO, p.DISPONIBLE, " +
                "tp.NOMBRE_TIPO FROM PRODUCTO p " +
                "INNER JOIN TIPO_PRODUCTO tp ON p.ID_TIPO = tp.ID_TIPO " +
                "WHERE p.DISPONIBLE = FALSE";
        return jdbcTemplate.query(query, productoRowMapper);
    }

    @Override
    public List<Producto> listarTodosProductos() {
        String query = "SELECT p.ID_PRODUCTO, p.ID_TIPO, p.NOMBRE, p.DESCRIPCION, p.PRECIO, p.DISPONIBLE, " +
                "tp.NOMBRE_TIPO FROM PRODUCTO p " +
                "INNER JOIN TIPO_PRODUCTO tp ON p.ID_TIPO = tp.ID_TIPO";
        return jdbcTemplate.query(query, productoRowMapper);
    }

    @Override
    public Producto obtenerProductoPorId(Integer id) {
        String query = "SELECT p.ID_PRODUCTO, p.ID_TIPO, p.NOMBRE, p.DESCRIPCION, p.PRECIO, p.DISPONIBLE, " +
                "tp.NOMBRE_TIPO FROM PRODUCTO p " +
                "INNER JOIN TIPO_PRODUCTO tp ON p.ID_TIPO = tp.ID_TIPO " +
                "WHERE p.ID_PRODUCTO = ?";
        try {
            return jdbcTemplate.queryForObject(query, productoRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearProducto(Producto producto) {
        String query = "INSERT INTO PRODUCTO (ID_TIPO, NOMBRE, DESCRIPCION, PRECIO, DISPONIBLE) VALUES (?, ?, ?, ?, TRUE)";
        jdbcTemplate.update(query, producto.getIdTipo(), producto.getNombre(), producto.getDescripcion(), producto.getPrecio());
    }

    @Override
    public void actualizarProducto(Producto producto) {
        String query = "UPDATE PRODUCTO SET ID_TIPO = ?, NOMBRE = ?, DESCRIPCION = ?, PRECIO = ?, DISPONIBLE = ? WHERE ID_PRODUCTO = ?";
        jdbcTemplate.update(query, producto.getIdTipo(), producto.getNombre(), producto.getDescripcion(), producto.getPrecio(), producto.getDisponible(), producto.getIdProducto());
    }

    @Override
    public void desactivarProducto(Integer id) {
        String query = "UPDATE PRODUCTO SET DISPONIBLE = FALSE WHERE ID_PRODUCTO = ?";
        jdbcTemplate.update(query, id);
    }

    @Override
    public void reactivarProducto(Integer id) {
        String query = "UPDATE PRODUCTO SET DISPONIBLE = TRUE WHERE ID_PRODUCTO = ?";
        jdbcTemplate.update(query, id);
    }
}