<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membresías - GymFlow</title>

    <!-- CSS principal -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UsuarioStyles.css">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
<!-- Botón menú móvil -->
<button class="mobile-menu-btn" onclick="toggleSidebar()">
    <i class="fas fa-bars"></i>
</button>

<div class="dashboard">

    <%@ include file='barra_tareas.jsp' %>

    <!-- Contenido principal -->
    <main class="main-content">
        <header class="header">
            <h1>Planes de Membresía</h1>
            <p>Elige el plan que mejor se adapte a tus objetivos en el gimnasio</p>
        </header>

        <section class="membership-grid">
            <div class="membership-card basico">
                <h2>Plan Básico</h2>
                <p class="precio">S/ 99 / mes</p>
                <ul>
                    <li>Acceso ilimitado al gimnasio</li>
                    <li>Asesoría inicial</li>
                    <li>Horarios libres</li>
                </ul>
                <button>Elegir Plan</button>
            </div>

            <div class="membership-card intermedio">
                <h2>Plan Intermedio</h2>
                <p class="precio">S/ 149 / mes</p>
                <ul>
                    <li>Todo lo del Plan Básico</li>
                    <li>Clases grupales incluidas</li>
                    <li>Rutina personalizada</li>
                </ul>
                <button>Elegir Plan</button>
            </div>

            <div class="membership-card premium">
                <h2>Plan Premium</h2>
                <p class="precio">S/ 199 / mes</p>
                <ul>
                    <li>Todo lo del Plan Intermedio</li>
                    <li>Nutricionista incluido</li>
                    <li>Acceso a zona VIP</li>
                </ul>
                <button>Elegir Plan</button>
            </div>
        </section>
    </main>
</div>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/js/Membresias.js"></script>
<script src="${pageContext.request.contextPath}/js/navegacion.js"></script>
</body>
</html>
