<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - GymFlow</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_styles.css">
</head>
<body>
<!-- CORRECCIÓN: Agregar clase right-panel-active SI hay errorRegistro -->
<div class="container <c:if test="${not empty errorRegistro}">right-panel-active</c:if>">

    <!-- Panel de login -->
    <div class="form-container login-container">
        <form action="${pageContext.request.contextPath}/usuario/login" method="POST">
            <h2>Iniciar Sesión</h2>

            <c:if test="${not empty error}">
                <div class="error-message">
                        ${error}
                </div>
            </c:if>

            <input type="email" name="correo" placeholder="Correo electrónico" required>
            <input type="password" name="contrasena" placeholder="Contraseña" required>
            <button type="submit">Ingresar</button>
            <p>¿No tienes cuenta?
                <!-- CORRECCIÓN: Cambiar a enlace que muestre registro -->
                <a href="#" onclick="document.querySelector('.container').classList.add('right-panel-active'); return false;">
                    Regístrate aquí
                </a>
            </p>
        </form>
    </div>

    <!-- Panel de registro -->
    <div class="form-container register-container">
        <form action="${pageContext.request.contextPath}/usuario/registrar" method="POST">
            <h2>Registro de Cliente</h2>

            <c:if test="${not empty errorRegistro}">
                <div class="error-message">
                        ${errorRegistro}
                </div>
            </c:if>

            <input type="text" name="nombre" placeholder="Nombre completo" required
                   value="${param.nombre}">
            <input type="email" name="correo" placeholder="Correo electrónico" required
                   value="${param.correo}">
            <input type="password" name="contrasena" placeholder="Contraseña" required>
            <button type="submit">Registrar</button>
            <p>¿Ya tienes cuenta?
                <!-- CORRECCIÓN: Cambiar a enlace que muestre login -->
                <a href="#" onclick="document.querySelector('.container').classList.remove('right-panel-active'); return false;">
                    Inicia sesión
                </a>
            </p>
        </form>
    </div>

    <!-- Panel animado lateral -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h2>¡Bienvenido de nuevo!</h2>
                <p>Accede con tus credenciales para entrenar con nosotros.</p>
                <button class="ghost" onclick="document.querySelector('.container').classList.remove('right-panel-active')">
                    Iniciar Sesión
                </button>
            </div>
            <div class="overlay-panel overlay-right">
                <h2>¡Únete al Gym!</h2>
                <p>Crea tu cuenta y empieza tu camino fitness 💪.</p>
                <button class="ghost" onclick="document.querySelector('.container').classList.add('right-panel-active')">
                    Registrarse
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>