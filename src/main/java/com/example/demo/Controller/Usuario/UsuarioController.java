package com.example.demo.Controller.Usuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("/list")
    public String listarUsuarios(
            @RequestParam(required = false) Integer editarId,
            @RequestParam(required = false, defaultValue = "activos") String filtro,
            @RequestParam(required = false) String rol,
            Model model) {

        System.out.println("🎯 USUARIO CONTROLLER - Cargando datos: " + filtro);

        List<Usuario> lista;

        // PRIMERO verifica si hay filtro por rol
        if (rol != null && !rol.isEmpty()) {
            lista = usuarioService.listarUsuariosPorRol(rol);
        } else {
            // Si no, usa los filtros normales
            switch (filtro) {
                case "inactivos":
                    lista = usuarioService.listarUsuariosInactivos();
                    break;
                case "todos":
                    lista = usuarioService.listarTodosUsuarios();
                    break;
                default: // activos
                    lista = usuarioService.listarUsuarios();
            }
        }

        System.out.println("📦 Usuarios cargados: " + lista.size() + " elementos");

        model.addAttribute("usuarios", lista); // 🚨 IMPORTANTE: "usuarios"
        model.addAttribute("editarId", editarId);
        model.addAttribute("filtroActual", filtro);

        return "admin/CRUDs/usuariosCRUD";
    }

    @PostMapping("/crear")
    public String crearUsuario(
            @RequestParam("nombre") String nombre,
            @RequestParam("correo") String correo,
            @RequestParam("contrasena") String contrasena,
            @RequestParam("rol") String rol) {

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setRol(rol);
        usuario.setDisponible(true);

        usuarioService.crearUsuario(usuario);
        return "redirect:/usuario/list";
    }

    @PostMapping("/actualizar")
    public String actualizarUsuario(
            @RequestParam("idUsuario") Integer idUsuario,
            @RequestParam("nombre") String nombre,
            @RequestParam("correo") String correo,
            @RequestParam("contrasena") String contrasena,
            @RequestParam("rol") String rol,
            @RequestParam("disponible") Boolean disponible) {

        Usuario usuario = new Usuario();
        usuario.setIdUsuario(idUsuario);
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setRol(rol);
        usuario.setDisponible(disponible);

        usuarioService.actualizarUsuario(usuario);
        return "redirect:/usuario/list";
    }

    @PostMapping("/desactivar")
    public String desactivarUsuario(@RequestParam Integer id) {
        usuarioService.desactivarUsuario(id);
        return "redirect:/usuario/list";
    }

    @PostMapping("/reactivar")
    public String reactivarUsuario(@RequestParam Integer id) {
        usuarioService.reactivarUsuario(id);
        return "redirect:/usuario/list?filtro=inactivos";
    }
}