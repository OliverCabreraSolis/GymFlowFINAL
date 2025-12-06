<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Membresías - GymFlow</title>

    <!-- CSS alineado con tu paleta -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/CrudsStyles.css">

    <!-- Font Awesome -->
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
            <a href="${pageContext.request.contextPath}/ver-gestionInicio" class="nav-item">
                <i class="fa-solid fa-bars-progress"></i> Gestión
            </a>
        </nav>
    </aside>

    <main class="main-content">
        <!-- Header -->
        <header class="header">
            <h1><i class="fas fa-tags"></i> Gestión de Membresías</h1>
            <p>Administra las membresías de los clientes del gimnasio</p>
        </header>

        <!-- Botón de retorno -->
        <div style="margin-bottom: 20px;">
            <a href="${pageContext.request.contextPath}/ver-CRUDsInicio" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Volver a CRUDs
            </a>
        </div>

        <!-- FILTROS PRINCIPALES -->
        <div class="filters-container">
            <span style="font-weight: 500; color: #463a57;">Filtrar por estado:</span>
            <div class="filter-group">
                <a href="/membresia/list?filtro=activas" class="filter-btn ${filtroActual == 'activas' ? 'active' : ''}">
                    Activas
                </a>
                <a href="/membresia/list?filtro=canceladas" class="filter-btn ${filtroActual == 'canceladas' ? 'active' : ''}">
                    Canceladas
                </a>
                <a href="/membresia/list?filtro=todas" class="filter-btn ${filtroActual == 'todas' ? 'active' : ''}">
                    Todas
                </a>
            </div>
        </div>

        <!-- FORMULARIO CREAR NUEVA MEMBRESÍA -->
        <div class="table-container mb-20">
            <div class="table-header">
                <h3><i class="fas fa-plus-circle"></i> Nueva Membresía</h3>
            </div>

            <form action="/membresia/crear" method="post" class="form-row">
                <input type="text" name="nombre" class="form-control" placeholder="Nombre de la membresía" required>

                <select name="idUsuario" class="form-control" required>
                    <option value="">Seleccionar usuario</option>
                    <c:forEach var="usuario" items="${usuarios}">
                        <option value="${usuario.idUsuario}">${usuario.nombre} (${usuario.correo})</option>
                    </c:forEach>
                </select>

                <select name="idPlan" class="form-control" required>
                    <option value="">Seleccionar plan</option>
                    <c:forEach var="plan" items="${planes}">
                        <option value="${plan.idPlan}">${plan.nombre} - ${plan.duracion} - S/. ${plan.precio}</option>
                    </c:forEach>
                </select>

                <div style="display: flex; gap: 15px; width: 100%;">
                    <div style="flex: 1;">
                        <label style="display: block; margin-bottom: 5px; color: #463a57; font-weight: bold;">Fecha Inicio:</label>
                        <input type="date" name="fechaInicio" class="form-control" required>
                    </div>
                    <div style="flex: 1;">
                        <label style="display: block; margin-bottom: 5px; color: #463a57; font-weight: bold;">Fecha Fin:</label>
                        <input type="date" name="fechaFin" class="form-control" required>
                    </div>
                </div>

                <input type="number" name="precio" class="form-control" placeholder="Precio" step="0.01" min="0" required>
                <textarea name="descripcion" class="form-control" placeholder="Descripción de la membresía"></textarea>

                <button type="submit" class="btn btn-success">
                    <i class="fas fa-save"></i> Crear Membresía
                </button>
            </form>
        </div>

        <!-- TABLA DE MEMBRESÍAS -->
        <div class="table-container">
            <div class="table-header">
                <h3><i class="fas fa-list"></i> Lista de Membresías <small>(${membresias.size()})</small></h3>
            </div>

            <c:choose>
                <c:when test="${not empty membresias}">
                    <table class="crud-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Usuario</th>
                            <th>Plan</th>
                            <th>Fechas</th>
                            <th>Precio</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="membresia" items="${membresias}">
                            <c:choose>
                                <c:when test="${editarId == membresia.idMembresia}">
                                    <!-- Modo edición -->
                                    <tr style="background: #fffaf0;">
                                        <td>#${membresia.idMembresia}</td>
                                        <td colspan="7">
                                            <form action="/membresia/actualizar" method="post" class="edit-form">
                                                <input type="hidden" name="idMembresia" value="${membresia.idMembresia}">
                                                <div class="form-row">
                                                    <input type="text" name="nombre" value="${membresia.nombre}" class="form-control" required>
                                                    <select name="idUsuario" class="form-control" required>
                                                        <c:forEach var="usuario" items="${usuarios}">
                                                            <option value="${usuario.idUsuario}" ${usuario.idUsuario == membresia.idUsuario ? 'selected' : ''}>
                                                                    ${usuario.nombre}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    <select name="idPlan" class="form-control" required>
                                                        <c:forEach var="plan" items="${planes}">
                                                            <option value="${plan.idPlan}" ${plan.idPlan == membresia.idPlan ? 'selected' : ''}>
                                                                    ${plan.nombre}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-row">
                                                    <div style="flex: 1;">
                                                        <label style="display: block; margin-bottom: 5px; color: #463a57; font-weight: bold;">Fecha Inicio:</label>
                                                        <input type="date" name="fechaInicio" value="${membresia.fechaInicio}" class="form-control" required>
                                                    </div>
                                                    <div style="flex: 1;">
                                                        <label style="display: block; margin-bottom: 5px; color: #463a57; font-weight: bold;">Fecha Fin:</label>
                                                        <input type="date" name="fechaFin" value="${membresia.fechaFin}" class="form-control" required>
                                                    </div>
                                                    <div style="flex: 1;">
                                                        <label style="display: block; margin-bottom: 5px; color: #463a57; font-weight: bold;">Precio:</label>
                                                        <input type="number" name="precio" value="${membresia.precio}" step="0.01" class="form-control" required>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <textarea name="descripcion" class="form-control" placeholder="Descripción">${membresia.descripcion}</textarea>
                                                    <select name="estado" class="form-control">
                                                        <option value="ACTIVA" ${membresia.estado == 'ACTIVA' ? 'selected' : ''}>Activa</option>
                                                        <option value="CANCELADA" ${membresia.estado == 'CANCELADA' ? 'selected' : ''}>Cancelada</option>
                                                    </select>
                                                    <select name="disponible" class="form-control">
                                                        <option value="true" ${membresia.disponible ? 'selected' : ''}>Disponible</option>
                                                        <option value="false" ${!membresia.disponible ? 'selected' : ''}>No disponible</option>
                                                    </select>
                                                </div>
                                                <div class="form-row">
                                                    <button type="submit" class="btn btn-success">
                                                        <i class="fas fa-save"></i> Guardar cambios
                                                    </button>
                                                    <a href="/membresia/list?filtro=${filtroActual}" class="btn btn-secondary">
                                                        <i class="fas fa-times"></i> Cancelar edición
                                                    </a>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <!-- Modo visualización -->
                                    <tr>
                                        <td>#${membresia.idMembresia}</td>
                                        <td><strong>${membresia.nombre}</strong></td>
                                        <td>
                                            <c:forEach var="usuario" items="${usuarios}">
                                                <c:if test="${usuario.idUsuario == membresia.idUsuario}">
                                                    <span style="font-weight: 500; color: #463a57;">${usuario.nombre}</span>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach var="plan" items="${planes}">
                                                <c:if test="${plan.idPlan == membresia.idPlan}">
                                                    <span style="color: #74577a;">${plan.nombre}</span>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <small style="color: #666;">Inicio: ${membresia.fechaInicio}</small><br>
                                            <small style="color: #666;">Fin: ${membresia.fechaFin}</small>
                                        </td>
                                        <td>
                                                <span style="font-weight: bold; color: #28a745;">
                                                    S/. ${membresia.precio}
                                                </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${membresia.estado == 'ACTIVA'}">
                                                    <span class="status-active">Activa</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-inactive">Cancelada</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="action-buttons">
                                                <a href="/membresia/list?filtro=${filtroActual}&editarId=${membresia.idMembresia}"
                                                   class="action-btn edit" title="Editar membresía">
                                                    <i class="fas fa-edit"></i>
                                                </a>

                                                <c:choose>
                                                    <c:when test="${membresia.estado == 'ACTIVA'}">
                                                        <form action="/membresia/cancelar" method="post" style="display:inline;">
                                                            <input type="hidden" name="id" value="${membresia.idMembresia}">
                                                            <button type="submit" class="action-btn delete" title="Cancelar membresía"
                                                                    onclick="return confirm('¿Estás seguro de cancelar esta membresía?')">
                                                                <i class="fas fa-ban"></i>
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="/membresia/reactivar" method="post" style="display:inline;">
                                                            <input type="hidden" name="id" value="${membresia.idMembresia}">
                                                            <button type="submit" class="action-btn" title="Reactivar membresía"
                                                                    style="background: rgba(40, 167, 69, 0.1); color: #28a745; border-color: #28a745;">
                                                                <i class="fas fa-check"></i>
                                                            </button>
                                                        </form>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-data">
                        <i class="fas fa-tags"></i>
                        <h3>No hay membresías disponibles</h3>
                        <p>Crea tu primera membresía usando el formulario de arriba</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</div>

</body>
</html>