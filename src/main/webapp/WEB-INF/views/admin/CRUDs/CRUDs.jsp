<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel CRUDs | GymFlow</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<!-- Sidebar -->
<aside class="sidebar">
    <div class="logo">
        <h1>GymFlow</h1>
        <p>Panel Administrativo</p>
    </div>

    <nav class="nav-menu">
        <a href="${pageContext.request.contextPath}/ver-CRUDsInicio" class="nav-item active">
            <i class="fas fa-database"></i> CRUDs
        </a>

        <a href="${pageContext.request.contextPath}/ver-metricasInicio" class="nav-item">
            <i class="fas fa-chart-line"></i> Métricas
        </a>

        <a href="${pageContext.request.contextPath}/ver-gestionInicio" class="nav-item">
            <i class="fa-solid fa-bars-progress"></i> Gestión
        </a>
    </nav>
</aside>

<!-- Contenido principal -->
<main class="main-content">
    <header class="header">
        <h2>Gestión de CRUDs</h2>
        <p>Selecciona el módulo que deseas administrar.</p>
    </header>

    <section class="crud-menu">
        <div class="crud-options">

            <a href="${pageContext.request.contextPath}/ver-CRUDPlanes" class="crud-card">
                <i class="fas fa-dumbbell"></i>
                <h3>CRUD Planes</h3>
            </a>

            <a href="${pageContext.request.contextPath}/ver-CRUDMembresias" class="crud-card">
                <i class="fas fa-tags"></i>
                <h3>CRUD Membresías</h3>
            </a>

            <a href="${pageContext.request.contextPath}/ver-CRUDTipoProducto" class="crud-card">
                <i class="fas fa-boxes"></i>
                <h3>CRUD Tipos de Producto</h3>
            </a>

            <a href="${pageContext.request.contextPath}/ver-CRUDProductos" class="crud-card">
                <i class="fas fa-box"></i>
                <h3>CRUD Productos</h3>
            </a>

            <a href="${pageContext.request.contextPath}/ver-CRUDUsuarios" class="crud-card">
                <i class="fas fa-users"></i>
                <h3>CRUD Usuarios</h3>
            </a>

        </div>
    </section>
</main>

</body>
</html>