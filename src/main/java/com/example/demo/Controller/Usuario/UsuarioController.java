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
    // 📱 MOSTRAR PÁGINA DE LOGIN
    @GetMapping("/login")
    public String mostrarLogin(Model model) {
        System.out.println(" UsuarioController: Mostrando login desde /public/login.jsp");
        return "public/login";  // ← ¡IMPORTANTE! Ahora busca en carpeta "public"
    }

    // 🔐 PROCESAR LOGIN - CORREGIDO CON "ADMINISTRADOR"
    @PostMapping("/login")
    public String procesarLogin(
            @RequestParam String correo,
            @RequestParam String contrasena,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        System.out.println("🎯 Procesando login para: " + correo);

        try {
            Usuario usuario = usuarioService.obtenerUsuarioPorCredenciales(correo, contrasena);

            if (usuario != null) {
                if (!usuario.getDisponible()) {
                    redirectAttributes.addFlashAttribute("error", "❌ Usuario inactivo");
                    return "redirect:/usuario/login";
                }

                // Guardar en sesión
                session.setAttribute("usuario", usuario);
                session.setAttribute("rol", usuario.getRol());
                session.setAttribute("nombreUsuario", usuario.getNombre());
                session.setAttribute("idUsuario", usuario.getIdUsuario());

                System.out.println("✅ Login exitoso: " + usuario.getNombre() + " - Rol: " + usuario.getRol());

                // Redirigir según rol
                if ("ADMINISTRADOR".equals(usuario.getRol())) {
                    return "redirect:/ver-gestionInicio";
                } else {
                    return "redirect:/ver-inicio";
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "❌ Credenciales incorrectas");
                return "redirect:/usuario/login";
            }
        } catch (Exception e) {
            System.err.println("❌ Error login: " + e.getMessage());
            redirectAttributes.addFlashAttribute("error", "⚠️ Error del sistema");
            return "redirect:/usuario/login";
        }
    }

    // 📝 PROCESAR REGISTRO (SOLO CLIENTE)
    @PostMapping("/registrar")
    public String registrarCliente(
            @RequestParam String nombre,
            @RequestParam String telefono,
            @RequestParam String correo,
            @RequestParam String contrasena,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        System.out.println("📝 Registro intento: " + correo);

        try {
            // Verificar si el correo ya existe (JDBC)
            if (usuarioService.existeCorreo(correo)) {
                redirectAttributes.addFlashAttribute("errorRegistro", "❌ Correo ya registrado");
                return "redirect:/usuario/login";
            }

            // Crear usuario CLIENTE
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setCorreo(correo);
            usuario.setContrasena(contrasena);
            usuario.setRol("CLIENTE"); // Solo cliente
            usuario.setDisponible(true);

            // JDBC puro - Insert
            usuarioService.crearUsuario(usuario);

            // Obtener usuario recién creado
            Usuario usuarioCreado = usuarioService.obtenerUsuarioPorCredenciales(correo, contrasena);

            if (usuarioCreado != null) {
                // Iniciar sesión
                session.setAttribute("usuario", usuarioCreado);
                session.setAttribute("rol", usuarioCreado.getRol());
                session.setAttribute("nombreUsuario", usuarioCreado.getNombre());
                session.setAttribute("idUsuario", usuarioCreado.getIdUsuario());

                System.out.println("✅ Registro exitoso ID: " + usuarioCreado.getIdUsuario());
                return "redirect:/ver-inicio";
            } else {
                redirectAttributes.addFlashAttribute("errorRegistro", "⚠️ Error creando cuenta");
                return "redirect:/usuario/login";
            }

        } catch (Exception e) {
            System.err.println("❌ Error registro: " + e.getMessage());
            redirectAttributes.addFlashAttribute("errorRegistro", "⚠️ Error en registro");
            return "redirect:/usuario/login";
        }
    }

    // 🚪 CERRAR SESIÓN
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
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