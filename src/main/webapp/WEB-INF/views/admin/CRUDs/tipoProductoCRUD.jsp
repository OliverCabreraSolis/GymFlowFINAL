<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Tipos de Productos - GymFlow</title>
    <link rel="stylesheet" href="/css/CrudsStyles.css">
</head>
<body>
<!-- 🚨 BOTÓN VOLVER - al menú CRUDs -->
<a href="/ver-CRUDsInicio" class="btn-volver">← Volver a CRUDs</a>

<main class="main-content">
    <h1>Gestión de Tipos de Productos</h1>

    <!-- 🚨 FILTROS - Apuntan a /tipoproducto/list -->
    <div class="filtros">
        <a href="/tipoproducto/list?filtro=activos"
           class="filtro-btn ${filtroActual == 'activos' ? 'activo' : ''}">Activos</a>
        <a href="/tipoproducto/list?filtro=inactivos"
           class="filtro-btn ${filtroActual == 'inactivos' ? 'activo' : ''}">Inactivos</a>
        <a href="/tipoproducto/list?filtro=todos"
           class="filtro-btn ${filtroActual == 'todos' ? 'activo' : ''}">Todos</a>
    </div>

    <!-- FORMULARIO CREAR -->
    <form action="/tipoproducto/crear" method="post" class="form-tipo">
        <input type="text" name="nombreTipo" placeholder="Nombre del tipo" required>
        <textarea name="descripcionProducto" placeholder="Descripción" required></textarea>
        <button type="submit" class="agregar-btn">➕ Agregar Tipo</button>
    </form>

    <!-- CARDS -->
    <div class="tipos-grid">
        <c:forEach var="tipo" items="${tipoproductos}">

            <c:if test="${param.editarId == tipo.idTipo}">
                <!-- MODO EDICIÓN -->
                <div class="tipo-card edicion">
                    <form action="/tipoproducto/actualizar" method="post">
                        <input type="hidden" name="idTipo" value="${tipo.idTipo}">

                        <label>Nombre:</label>
                        <input type="text" name="nombreTipo" value="${tipo.nombreTipo}" required>

                        <label>Descripción:</label>
                        <textarea name="descripcionProducto" required>${tipo.descripcionProducto}</textarea>

                        <label>Estado:</label>
                        <select name="disponible">
                            <option value="true" ${tipo.disponible ? 'selected' : ''}>Activo</option>
                            <option value="false" ${not tipo.disponible ? 'selected' : ''}>Inactivo</option>
                        </select>

                        <div class="botones">
                            <button type="submit" class="guardar-btn">💾 Guardar</button>
                            <!-- 🚨 CANCELAR apunta a /tipoproducto/list -->
                            <a href="/tipoproducto/list?filtro=${filtroActual}" class="cancelar-btn">❌ Cancelar</a>
                        </div>
                    </form>
                </div>
            </c:if>

            <c:if test="${param.editarId != tipo.idTipo}">
                <!-- MODO VISUALIZACIÓN -->
                <div class="tipo-card ${tipo.disponible ? '' : 'inactivo'}">
                    <c:if test="${not tipo.disponible}">
                        <div class="badge-inactivo">INACTIVO</div>
                    </c:if>
                    <h3>${tipo.nombreTipo}</h3>
                    <p>${tipo.descripcionProducto}</p>
                    <div class="estado-info">
                        Estado: <strong>${tipo.disponible ? 'ACTIVO' : 'INACTIVO'}</strong>
                    </div>
                    <div class="botones">
                        <!-- 🚨 EDITAR apunta a /tipoproducto/list -->
                        <a href="/tipoproducto/list?filtro=${filtroActual}&editarId=${tipo.idTipo}"
                           class="editar-btn">✏️ Editar</a>

                        <c:choose>
                            <c:when test="${tipo.disponible}">
                                <form action="/tipoproducto/desactivar" method="post">
                                    <input type="hidden" name="id" value="${tipo.idTipo}">
                                    <button type="submit" class="eliminar-btn">🗑️ Desactivar</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="/tipoproducto/reactivar" method="post">
                                    <input type="hidden" name="id" value="${tipo.idTipo}">
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