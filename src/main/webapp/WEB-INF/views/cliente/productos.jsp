<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/css/UsuarioStyles.css">

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos - GymFlow</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<button class="mobile-menu-btn" onclick="toggleSidebar()">
    <i class="fas fa-bars"></i>
</button>

<div class="dashboard">

    <%@ include file='barra_tareas.jsp' %>

    <main class="main-content">
        <h1>Catálogo de Productos</h1>

        <div class="filter-container">
            <button class="filter-btn active" onclick="filtrarProductos('todos')">
                Todos
            </button>
            <button class="filter-btn" onclick="filtrarProductos('suplementos')">
                Suplementos
            </button>
            <button class="filter-btn" onclick="filtrarProductos('equipamiento')">
                Equipamiento
            </button>
            <button class="filter-btn" onclick="filtrarProductos('accesorios')">
                Accesorios
            </button>
            <button class="filter-btn" onclick="filtrarProductos('nutricion')">
                Nutrición
            </button>
        </div>

        <div id="productos-container" class="products-grid"></div>
    </main>
</div>


</body>
</html>
