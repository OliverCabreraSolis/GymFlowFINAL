package com.example.demo.Controller.Usuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // 🆕 MÉTODOS DE LOGIN Y REGISTRO
    @GetMapping("/login")
    public String mostrarLogin() {
        return "login"; // Tu JSP de login
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String correo,
            @RequestParam String contrasena,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        try {
            // Buscar usuario por correo y contraseña
            Usuario usuario = usuarioService.obtenerUsuarioPorCredenciales(correo, contrasena);

            if (usuario != null) {
                if (!usuario.getDisponible()) {
                    redirectAttributes.addFlashAttribute("error", "Usuario inactivo. Contacta al administrador.");
                    return "redirect:/usuario/login";
                }

                // Guardar usuario en sesión
                session.setAttribute("usuario", usuario);
                session.setAttribute("rol", usuario.getRol());
                session.setAttribute("nombreUsuario", usuario.getNombre());
                session.setAttribute("idUsuario", usuario.getIdUsuario());

                // Redirigir según el rol
                if ("ADMIN".equals(usuario.getRol())) {
                    return "redirect:/ver-gestionInicio";  // ← Admin va a gestión
                } else {
                    return "redirect:/ver-inicio";  // ← Cliente va a inicio normal
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "Credenciales incorrectas");
                return "redirect:/usuario/login";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error en el sistema: " + e.getMessage());
            return "redirect:/usuario/login";
        }
    }

    @PostMapping("/registrar")
    public String registrarCliente(
            @RequestParam String nombre,
            @RequestParam String telefono,
            @RequestParam String correo,
            @RequestParam String contrasena,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        try {
            // Verificar si el correo ya existe
            if (usuarioService.existeCorreo(correo)) {
                redirectAttributes.addFlashAttribute("errorRegistro", "El correo ya está registrado");
                return "redirect:/usuario/login";
            }

            // Crear nuevo usuario SOLO como CLIENTE
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setCorreo(correo);
            usuario.setContrasena(contrasena);
            usuario.setRol("CLIENTE");  // ← SIEMPRE CLIENTE
            usuario.setDisponible(true);

            usuarioService.crearUsuario(usuario);

            // Iniciar sesión automáticamente después del registro
            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", usuario.getRol());
            session.setAttribute("nombreUsuario", usuario.getNombre());
            session.setAttribute("idUsuario", usuario.getIdUsuario());

            // Redirigir al inicio de cliente
            return "redirect:/ver-inicio";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorRegistro", "Error en el registro: " + e.getMessage());
            return "redirect:/usuario/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/usuario/login";
    }

    // MÉTODOS CRUD EXISTENTES
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

        model.addAttribute("usuarios", lista);
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