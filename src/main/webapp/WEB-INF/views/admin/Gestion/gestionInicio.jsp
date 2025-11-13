<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Clientes | GymFlow</title>
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

<!-- Contenido principal -->
<main class="main-content">
    <header class="header">
        <h2>Gestión de Clientes</h2>
        <p>Consulta y filtra los clientes registrados en GymFlow.</p>
    </header>

    <!-- Resumen general -->
    <section class="resumen-clientes">
        <div class="card">
            <i class="fas fa-user-friends"></i>
            <h3>Total Clientes</h3>
            <p>${totalClientes}</p>
        </div>
        <div class="card">
            <i class="fas fa-user-check"></i>
            <h3>Activos</h3>
            <p>${clientesActivos}</p>
        </div>
        <div class="card">
            <i class="fas fa-user-times"></i>
            <h3>Inactivos</h3>
            <p>${clientesInactivos}</p>
        </div>
    </section>

    <!-- Buscador y filtros -->
    <section class="buscador">
        <form action="${pageContext.request.contextPath}/gestion" method="get">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="${param.nombre}" placeholder="Buscar por nombre...">

            <label for="estado">Estado:</label>
            <select id="estado" name="estado">
                <option value="">Todos</option>
                <option value="activo" <c:if test="${param.estado == 'activo'}">selected</c:if>>Activos</option>
                <option value="inactivo" <c:if test="${param.estado == 'inactivo'}">selected</c:if>>Inactivos</option>
            </select>

            <button type="submit"><i class="fas fa-filter"></i> Filtrar</button>
        </form>
    </section>

    <!-- Tabla de clientes -->
    <section class="tabla-clientes">
        <h3>Listado de Clientes</h3>
        <table border="1" cellspacing="0" cellpadding="8">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Estado</th>
                <th>Fecha de Expiración</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty listaClientes}">
                    <c:forEach var="cliente" items="${listaClientes}">
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nombre}</td>
                            <td>${cliente.correo}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${cliente.activo}">Activo</c:when>
                                    <c:otherwise>Inactivo</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${cliente.fechaExpiracion}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" style="text-align:center;">No se encontraron clientes</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </section>
</main>

</body>
</html>
