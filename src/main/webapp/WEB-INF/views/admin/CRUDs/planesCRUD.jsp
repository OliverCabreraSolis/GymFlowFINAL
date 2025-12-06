<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Planes - GymFlow</title>
    <link rel="stylesheet" href="/css/CrudsStyles.css">
</head>
<body>
<a href="/ver-CRUDsInicio" class="btn-volver">← Volver a CRUDs</a>

<main class="main-content">
    <h1>Gestión de Planes</h1>

    <!-- FILTROS PRINCIPALES -->
    <div class="filtros">
        <a href="/plan/list?filtro=activos" class="filtro-btn ${filtroActual == 'activos' ? 'activo' : ''}">Activos</a>
        <a href="/plan/list?filtro=inactivos" class="filtro-btn ${filtroActual == 'inactivos' ? 'activo' : ''}">Inactivos</a>
        <a href="/plan/list?filtro=todos" class="filtro-btn ${filtroActual == 'todos' ? 'activo' : ''}">Todos</a>
    </div>

    <!-- FORMULARIO CREAR -->
    <form action="/plan/crear" method="post" class="form-tipo">
        <input type="text" name="nombre" placeholder="Nombre del plan" required>
        <input type="text" name="duracion" placeholder="Duración (ej: 1 mes, 3 meses)" required>
        <input type="number" name="precio" placeholder="Precio" step="0.01" min="0" required>
        <textarea name="descripcion" placeholder="Descripción del plan" required></textarea>
        <button type="submit" class="agregar-btn">➕ Agregar Plan</button>
    </form>

    <!-- CARDS DE PLANES -->
    <div class="tipos-grid">
        <c:forEach var="plan" items="${planes}">

            <!-- MODO EDICIÓN -->
            <c:if test="${param.editarId == plan.idPlan}">
                <div class="tipo-card edicion">
                    <form action="/plan/actualizar" method="post">
                        <input type="hidden" name="idPlan" value="${plan.idPlan}">

                        <label>Nombre:</label>
                        <input type="text" name="nombre" value="${plan.nombre}" required>

                        <label>Duración:</label>
                        <input type="text" name="duracion" value="${plan.duracion}" required>

                        <label>Precio (S/.):</label>
                        <input type="number" name="precio" value="${plan.precio}" step="0.01" min="0" required>

                        <label>Descripción:</label>
                        <textarea name="descripcion" required>${plan.descripcion}</textarea>

                        <label>Estado:</label>
                        <select name="disponible">
                            <option value="true" ${plan.disponible ? 'selected' : ''}>Activo</option>
                            <option value="false" ${not plan.disponible ? 'selected' : ''}>Inactivo</option>
                        </select>

                        <div class="botones">
                            <button type="submit" class="guardar-btn">💾 Guardar</button>
                            <a href="/plan/list?filtro=${filtroActual}" class="cancelar-btn">❌ Cancelar</a>
                        </div>
                    </form>
                </div>
            </c:if>

            <!-- MODO VISUALIZACIÓN -->
            <c:if test="${param.editarId != plan.idPlan}">
                <div class="tipo-card ${plan.disponible ? '' : 'inactivo'}">
                    <c:if test="${not plan.disponible}">
                        <div class="badge-inactivo">INACTIVO</div>
                    </c:if>
                    <h3>${plan.nombre}</h3>
                    <p>${plan.descripcion}</p>
                    <div class="estado-info">
                        <strong>Duración:</strong> ${plan.duracion}<br>
                        <strong>Precio:</strong> S/. ${plan.precio}
                    </div>
                    <div class="botones">
                        <a href="/plan/list?filtro=${filtroActual}&editarId=${plan.idPlan}"
                           class="editar-btn">✏️ Editar</a>

                        <c:choose>
                            <c:when test="${plan.disponible}">
                                <form action="/plan/desactivar" method="post">
                                    <input type="hidden" name="id" value="${plan.idPlan}">
                                    <button type="submit" class="eliminar-btn">🗑️ Desactivar</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="/plan/reactivar" method="post">
                                    <input type="hidden" name="id" value="${plan.idPlan}">
                                    <button type="submit" class="reactivar-btn">♻️ Reactivar</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:if>

        </c:forEach>
    </div>
</main>
</body>
</html>