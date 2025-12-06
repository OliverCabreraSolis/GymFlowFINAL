<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Gestión | GymFlow</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminStyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/CrudsStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="dashboard">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <h1>GymFlow</h1>
            <p>Panel Administrativo</p>
        </div>
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/ver-CRUDsInicio" class="nav-item">
                <i class="fas fa-database"></i> CRUDs
            </a>
            <a href="${pageContext.request.contextPath}/ver-metricasInicio" class="nav-item">
                <i class="fas fa-chart-line"></i> Métricas
            </a>
            <a href="${pageContext.request.contextPath}/ver-gestionInicio" class="nav-item active">
                <i class="fa-solid fa-bars-progress"></i> Gestión
            </a>
        </nav>
    </aside>

    <main class="main-content">
        <header class="header">
            <h1><i class="fa-solid fa-bars-progress"></i> Panel de Gestión</h1>
            <p>Herramientas avanzadas para el administrador</p>
        </header>

        <!-- Módulos de Gestión -->
        <section class="crud-menu">
            <h2>Módulos de Gestión</h2>
            <div class="crud-options">
                <!-- Gestión de Clientes -->
                <a href="${pageContext.request.contextPath}/ver-gestionClientes" class="crud-card">
                    <i class="fas fa-user-friends"></i>
                    <h3>Gestión de Clientes</h3>
                    <p>Administra clientes y sus membresías</p>
                </a>

                <!-- Métricas -->
                <a href="${pageContext.request.contextPath}/ver-metricasInicio" class="crud-card">
                    <i class="fas fa-chart-bar"></i>
                    <h3>Reportes y Métricas</h3>
                    <p>Análisis y estadísticas del negocio</p>
                </a>

                <!-- Backup -->
                <a href="#" class="crud-card">
                    <i class="fas fa-database"></i>
                    <h3>Backup del Sistema</h3>
                    <p>Respaldos de información</p>
                </a>

                <!-- Configuración -->
                <a href="#" class="crud-card">
                    <i class="fas fa-cogs"></i>
                    <h3>Configuración</h3>
                    <p>Ajustes del sistema</p>
                </a>

                <!-- Auditoría -->
                <a href="#" class="crud-card">
                    <i class="fas fa-clipboard-check"></i>
                    <h3>Auditoría</h3>
                    <p>Registros de actividad</p>
                </a>

                <!-- Soporte -->
                <a href="#" class="crud-card">
                    <i class="fas fa-headset"></i>
                    <h3>Soporte Técnico</h3>
                    <p>Asistencia y ayuda</p>
                </a>
            </div>
        </section>
    </main>
</div>

</body>
</html>