<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - GymFlow</title>
    <link rel="stylesheet" href="/css/login_styles.css">
</head>
<body>
<div class="logo">GYMFLOW 💪</div>

<div class="container" id="container">
    <!-- Panel de login -->
    <div class="form-container login-container">
        <form action="/usuario/login" method="post">
            <h2>Iniciar Sesión</h2>

            <!-- Mostrar mensajes de error -->
            <c:if test="${not empty error}">
                <div class="mensaje-error">
                        ${error}
                </div>
            </c:if>

            <input type="email" name="correo" placeholder="Correo electrónico" required>
            <input type="password" name="contrasena" placeholder="Contraseña" required>
            <button type="submit">Ingresar</button>
            <p>¿No tienes cuenta? <a href="#registro" class="toggle-form">Regístrate aquí</a></p>
        </form>
    </div>

    <!-- Panel de registro -->
    <div class="form-container register-container">
        <form action="/usuario/registrar" method="post">
            <h2>Registro de Cliente</h2>

            <!-- Mostrar mensajes de error en registro -->
            <c:if test="${not empty errorRegistro}">
                <div class="mensaje-error">
                        ${errorRegistro}
                </div>
            </c:if>

            <input type="text" name="nombre" placeholder="Nombre completo" required>
            <input type="tel" name="telefono" placeholder="Número de celular" required>
            <input type="email" name="correo" placeholder="Correo electrónico" required>
            <input type="password" name="contrasena" placeholder="Contraseña" required>
            <button type="submit">Registrarse</button>
            <p>¿Ya tienes cuenta? <a href="#login" class="toggle-form">Inicia sesión</a></p>
        </form>
    </div>

    <!-- Panel animado lateral -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h2>¡Bienvenido de nuevo!</h2>
                <p>Accede con tus credenciales para continuar tu transformación fitness.</p>
            </div>
            <div class="overlay-panel overlay-right">
                <h2>¡Únete a Nosotros!</h2>
                <p>Comienza tu viaje fitness hoy mismo y alcanza tus metas con nosotros 💪</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>