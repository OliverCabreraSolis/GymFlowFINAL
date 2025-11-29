package com.example.demo.Controller.Usuario;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioDAO usuarioDAO;

    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    @Override
    public List<Usuario> listarUsuarios() {
        return usuarioDAO.listarUsuarios();
    }

    @Override
    public List<Usuario> listarUsuariosInactivos() {
        return usuarioDAO.listarUsuariosInactivos();
    }

    @Override
    public List<Usuario> listarTodosUsuarios() {
        return usuarioDAO.listarTodosUsuarios();
    }

    @Override
    public List<Usuario> listarUsuariosPorRol(String rol) {
        return usuarioDAO.listarUsuariosPorRol(rol);
    }

    @Override
    public Usuario obtenerUsuarioPorId(int id) {
        return usuarioDAO.obtenerUsuarioPorId(id);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        usuarioDAO.crearUsuario(usuario);
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        usuarioDAO.actualizarUsuario(usuario);
    }

    @Override
    public void desactivarUsuario(Integer id) {
        usuarioDAO.desactivarUsuario(id);
    }

    @Override
    public void reactivarUsuario(Integer id) {
        usuarioDAO.reactivarUsuario(id);
    }
}