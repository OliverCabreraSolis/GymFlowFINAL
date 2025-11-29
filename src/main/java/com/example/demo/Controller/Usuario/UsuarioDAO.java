package com.example.demo.Controller.Usuario;

import java.util.List;

public interface UsuarioDAO {
    List<Usuario> listarUsuarios();           // Solo activos
    List<Usuario> listarUsuariosInactivos();  // Solo inactivos
    List<Usuario> listarTodosUsuarios();      // Todos
    List<Usuario> listarUsuariosPorRol(String rol);  // Por rol
    Usuario obtenerUsuarioPorId(Integer id);
    void crearUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void desactivarUsuario(Integer id);
    void reactivarUsuario(Integer id);

    // 🆕 MÉTODOS NUEVOS PARA LOGIN
    Usuario obtenerUsuarioPorCorreoYContrasena(String correo, String contrasena);
    boolean existeCorreo(String correo);
}