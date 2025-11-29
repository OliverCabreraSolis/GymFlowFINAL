package com.example.demo.Controller.Usuario;

import java.util.List;

public interface UsuarioService {
    List<Usuario> listarUsuarios();
    List<Usuario> listarUsuariosInactivos();
    List<Usuario> listarTodosUsuarios();
    List<Usuario> listarUsuariosPorRol(String rol);
    Usuario obtenerUsuarioPorId(int id);
    void crearUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void desactivarUsuario(Integer id);
    void reactivarUsuario(Integer id);
}