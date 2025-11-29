package com.example.demo.Controller.Usuario;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;

import java.util.List;

@Repository
public class UsuarioRepository implements UsuarioDAO {

    private final JdbcTemplate jdbcTemplate;

    public UsuarioRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Usuario> usuarioRowMapper = (rs, rowNum) -> {
        Usuario usuario = new Usuario();
        usuario.setIdUsuario(rs.getInt("id_usuario"));
        usuario.setNombre(rs.getString("nombre"));
        usuario.setCorreo(rs.getString("correo"));
        usuario.setContrasena(rs.getString("contrasena"));
        usuario.setRol(rs.getString("rol"));
        usuario.setDisponible(rs.getBoolean("disponible"));
        return usuario;
    };

    @Override
    public List<Usuario> listarUsuarios() {
        String query = "SELECT * FROM usuario WHERE disponible = TRUE ORDER BY nombre";
        return jdbcTemplate.query(query, usuarioRowMapper);
    }

    @Override
    public List<Usuario> listarUsuariosInactivos() {
        String query = "SELECT * FROM usuario WHERE disponible = FALSE ORDER BY nombre";
        return jdbcTemplate.query(query, usuarioRowMapper);
    }

    @Override
    public List<Usuario> listarTodosUsuarios() {
        String query = "SELECT * FROM usuario ORDER BY nombre";
        return jdbcTemplate.query(query, usuarioRowMapper);
    }

    @Override
    public List<Usuario> listarUsuariosPorRol(String rol) {
        String query = "SELECT * FROM usuario WHERE rol = ? ORDER BY nombre";
        return jdbcTemplate.query(query, usuarioRowMapper, rol);
    }

    @Override
    public Usuario obtenerUsuarioPorId(Integer id) {
        String query = "SELECT * FROM usuario WHERE id_usuario = ?";
        try {
            return jdbcTemplate.queryForObject(query, usuarioRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        String query = "INSERT INTO usuario (nombre, correo, contrasena, rol, disponible) VALUES (?, ?, ?, ?, TRUE)";
        jdbcTemplate.update(query,
                usuario.getNombre(),
                usuario.getCorreo(),
                usuario.getContrasena(),
                usuario.getRol());
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        String query = "UPDATE usuario SET nombre = ?, correo = ?, contrasena = ?, rol = ?, disponible = ? WHERE id_usuario = ?";
        jdbcTemplate.update(query,
                usuario.getNombre(),
                usuario.getCorreo(),
                usuario.getContrasena(),
                usuario.getRol(),
                usuario.getDisponible(),
                usuario.getIdUsuario());
    }

    @Override
    public void desactivarUsuario(Integer id) {
        String query = "UPDATE usuario SET disponible = FALSE WHERE id_usuario = ?";
        jdbcTemplate.update(query, id);
    }

    @Override
    public void reactivarUsuario(Integer id) {
        String query = "UPDATE usuario SET disponible = TRUE WHERE id_usuario = ?";
        jdbcTemplate.update(query, id);
    }
}