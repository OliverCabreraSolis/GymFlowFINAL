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

    <!-- FILTROS -->
    <div class="filtros">
        <a href="/plan/list?filtro=activos"
           class="filtro-btn ${filtroActual == 'activos' ? 'activo' : ''}">Activos</a>
        <a href="/plan/list?filtro=inactivos"
           class="filtro-btn ${filtroActual == 'inactivos' ? 'activo' : ''}">Inactivos</a>
        <a href="/plan/list?filtro=todos"
           class="filtro-btn ${filtroActual == 'todos' ? 'activo' : ''}">Todos</a>
    </div>

    <!-- MENSAJES -->
    <c:if test="${not empty error}">
        <div class="mensaje error">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="mensaje success">${success}</div>
    </c:if>

    <!-- FORMULARIO CREAR -->
    <form action="/plan/crear" method="post" class="form-tipo">
        <input type="text" name="nombre" placeholder="Nombre del plan" required>
        <input type="text" name="duracion" placeholder="Duración (ej: 1 mes, 3 meses)" required>
        <input type="number" name="precio" placeholder="Precio" step="0.01" min="0" required>
        <textarea name="descripcion" placeholder="Descripción del plan" rows="3"></textarea>
        <button type="submit" class="agregar-btn">➕ Agregar Plan</button>
    </form>

    <!-- CARDS -->
    <div class="tipos-grid">
        <c:forEach var="plan" items="${planes}">

            <c:if test="${param.editarId == plan.idPlan}">
                <!-- MODO EDICIÓN -->
                <div class="tipo-card edicion">
                    <form action="/plan/actualizar" method="post">
                        <input type="hidden" name="idPlan" value="${plan.idPlan}">

                        <label>Nombre:</label>
                        <input type="text" name="nombre" value="${plan.nombre}" required>

                        <label>Duración:</label>
                        <input type="text" name="duracion" value="${plan.duracion}" required>

                        <label>Precio:</label>
                        <input type="number" name="precio" value="${plan.precio}" step="0.01" min="0" required>

                        <label>Descripción:</label>
                        <textarea name="descripcion" rows="3">${plan.descripcion}</textarea>

                        <label>Estado:</label>
                        <select name="disponible">
                            <option value="true" ${plan.disponible ? 'selected' : ''}>Activo</option>
                            <option value="false" ${not plan.disponible ? 'selected' : ''}>Inactivo</option>
                        </select>

                        <div class="botones">
                            <button type="submit" class="guardar-btn">💾 Guardar</button>
                            <a href="/plan/list?filtro=${filtroActual}"
                               class="cancelar-btn">❌ Cancelar</a>
                        </div>
                    </form>
                </div>
            </c:if>

            <c:if test="${param.editarId != plan.idPlan}">
                <!-- MODO VISUALIZACIÓN -->
                <div class="tipo-card ${plan.disponible ? '' : 'inactivo'}">
                    <c:if test="${not plan.disponible}">
                        <div class="badge-inactivo">INACTIVO</div>
                    </c:if>
                    <h3>${plan.nombre}</h3>

                    <div class="duracion-badge">${plan.duracion}</div>

                    <div class="estado-info">
                        <strong>Precio:</strong>
                        <span class="precio-destacado">$${plan.precio}</span><br>
                        <strong>ID:</strong> #${plan.idPlan}
                    </div>

                    <p>${plan.descripcion}</p>

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