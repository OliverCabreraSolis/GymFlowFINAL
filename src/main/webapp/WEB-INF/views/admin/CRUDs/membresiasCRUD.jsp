<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Membresías - GymFlow</title>
    <link rel="stylesheet" href="/css/CrudsStyles.css">
</head>
<body>
<a href="/ver-CRUDsInicio" class="btn-volver">← Volver a CRUDs</a>

<main class="main-content">
    <h1>Gestión de Membresías</h1>

    <!-- FILTROS PRINCIPALES -->
    <div class="filtros">
        <a href="/membresia/list?filtro=activas" class="filtro-btn ${filtroActual == 'activas' ? 'activo' : ''}">Activas</a>
        <a href="/membresia/list?filtro=inactivas" class="filtro-btn ${filtroActual == 'inactivas' ? 'activo' : ''}">Inactivas</a>
        <a href="/membresia/list?filtro=todas" class="filtro-btn ${filtroActual == 'todas' ? 'activo' : ''}">Todas</a>
    </div>

    <!-- FILTROS ADICIONALES -->
    <div class="filtros-tipo">
        <strong>Filtrar por:</strong>
        <form action="/membresia/list" method="get">
            <select name="usuario" onchange="this.form.submit()" class="filtro-select">
                <option value="">Todos los usuarios</option>
                <c:forEach var="usuario" items="${usuarios}">
                    <option value="${usuario.idUsuario}" ${param.usuario == usuario.idUsuario.toString() ? 'selected' : ''}>
                            ${usuario.nombre}
                    </option>
                </c:forEach>
            </select>

            <select name="plan" onchange="this.form.submit()" class="filtro-select">
                <option value="">Todos los planes</option>
                <c:forEach var="plan" items="${planes}">
                    <option value="${plan.idPlan}" ${param.plan == plan.idPlan.toString() ? 'selected' : ''}>
                            ${plan.nombre}
                    </option>
                </c:forEach>
            </select>

            <c:if test="${not empty param.usuario or not empty param.plan}">
                <input type="hidden" name="filtro" value="${filtroActual}">
                <a href="/membresia/list?filtro=${filtroActual}" class="filtro-btn activo" style="background: #6c757d; border: 2px solid #6c757d;">
                    ✕ Limpiar
                </a>
            </c:if>
        </form>
    </div>

    <!-- FORMULARIO CREAR -->
    <form action="/membresia/crear" method="post" class="form-tipo">
        <input type="text" name="nombre" placeholder="Nombre de la membresía" required>

        <select name="idUsuario" required class="form-select">
            <option value="">Seleccionar usuario</option>
            <c:forEach var="usuario" items="${usuarios}">
                <option value="${usuario.idUsuario}">${usuario.nombre}</option>
            </c:forEach>
        </select>

        <select name="idPlan" required class="form-select">
            <option value="">Seleccionar plan</option>
            <c:forEach var="plan" items="${planes}">
                <option value="${plan.idPlan}">${plan.nombre} - ${plan.duracion} - S/. ${plan.precio}</option>
            </c:forEach>
        </select>

        <div class="fecha-container">
            <div>
                <label>Fecha Inicio:</label>
                <input type="date" name="fechaInicio" required>
            </div>
            <div>
                <label>Fecha Fin:</label>
                <input type="date" name="fechaFin" required>
            </div>
        </div>

        <input type="number" name="precio" placeholder="Precio" step="0.01" min="0" required>
        <textarea name="descripcion" placeholder="Descripción de la membresía"></textarea>

        <button type="submit" class="agregar-btn">➕ Agregar Membresía</button>
    </form>

    <!-- CARDS DE MEMBRESÍAS -->
    <div class="tipos-grid">
        <c:forEach var="membresia" items="${membresias}">
            <!-- ... mismo contenido sin JavaScript ... -->
        </c:forEach>
    </div>
</main>
</body>
</html>