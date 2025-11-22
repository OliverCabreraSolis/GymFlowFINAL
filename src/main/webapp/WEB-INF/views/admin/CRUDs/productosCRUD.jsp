<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos - GymFlow</title>
    <link rel="stylesheet" href="/css/CrudsStyles.css">
</head>
<body>
<a href="/ver-CRUDsInicio" class="btn-volver">← Volver a CRUDs</a>

<main class="main-content">
    <h1>Gestión de Productos</h1>

    <!-- FILTROS PRINCIPALES -->
    <div class="filtros">
        <a href="/producto/list?filtro=activos" class="filtro-btn ${filtroActual == 'activos' ? 'activo' : ''}">Activos</a>
        <a href="/producto/list?filtro=inactivos" class="filtro-btn ${filtroActual == 'inactivos' ? 'activo' : ''}">Inactivos</a>
        <a href="/producto/list?filtro=todos" class="filtro-btn ${filtroActual == 'todos' ? 'activo' : ''}">Todos</a>
    </div>

    <!-- 🆕 FILTRO POR TIPO DE PRODUCTO -->
    <div class="filtros-tipo">
        <strong>Filtrar por tipo:</strong>
        <a href="/producto/list?filtro=${filtroActual}" class="filtro-btn ${empty param.tipo ? 'activo' : ''}">Todos los tipos</a>
        <c:forEach var="tipo" items="${tipos}">
            <a href="/producto/list?filtro=${filtroActual}&tipo=${tipo.idTipo}"
               class="filtro-btn ${param.tipo == tipo.idTipo.toString() ? 'activo' : ''}">
                    ${tipo.nombreTipo}
            </a>
        </c:forEach>
    </div>

    <!-- FORMULARIO CREAR -->
    <form action="/producto/crear" method="post" class="form-tipo">
        <input type="text" name="nombre" placeholder="Nombre del producto" required>
        <textarea name="descripcion" placeholder="Descripción" required></textarea>
        <input type="number" name="precio" placeholder="Precio" step="0.01" min="0" required>

        <select name="idTipo" required>
            <option value="">Selecciona un tipo</option>
            <c:forEach var="tipo" items="${tipos}">
                <option value="${tipo.idTipo}">${tipo.nombreTipo}</option>
            </c:forEach>
        </select>

        <button type="submit" class="agregar-btn">➕ Agregar Producto</button>
    </form>

    <!-- CARDS DE PRODUCTOS -->
    <div class="tipos-grid">
        <c:forEach var="producto" items="${productos}">

            <!-- MODO EDICIÓN -->
            <c:if test="${param.editarId == producto.idProducto}">
                <div class="tipo-card edicion">
                    <form action="/producto/actualizar" method="post">
                        <input type="hidden" name="idProducto" value="${producto.idProducto}">

                        <label>Nombre:</label>
                        <input type="text" name="nombre" value="${producto.nombre}" required>

                        <label>Descripción:</label>
                        <textarea name="descripcion" required>${producto.descripcion}</textarea>

                        <label>Precio:</label>
                        <input type="number" name="precio" value="${producto.precio}" step="0.01" min="0" required>

                        <label>Tipo:</label>
                        <select name="idTipo" required>
                            <c:forEach var="tipo" items="${tipos}">
                                <option value="${tipo.idTipo}" ${producto.idTipo == tipo.idTipo ? 'selected' : ''}>
                                        ${tipo.nombreTipo}
                                </option>
                            </c:forEach>
                        </select>

                        <label>Estado:</label>
                        <select name="disponible">
                            <option value="true" ${producto.disponible ? 'selected' : ''}>Activo</option>
                            <option value="false" ${not producto.disponible ? 'selected' : ''}>Inactivo</option>
                        </select>

                        <div class="botones">
                            <button type="submit" class="guardar-btn">💾 Guardar</button>
                            <a href="/producto/list?filtro=${filtroActual}${not empty param.tipo ? '&tipo=' += param.tipo : ''}"
                               class="cancelar-btn">❌ Cancelar</a>
                        </div>
                    </form>
                </div>
            </c:if>

            <!-- MODO VISUALIZACIÓN -->
            <c:if test="${param.editarId != producto.idProducto}">
                <div class="tipo-card ${producto.disponible ? '' : 'inactivo'}">
                    <c:if test="${not producto.disponible}">
                        <div class="badge-inactivo">INACTIVO</div>
                    </c:if>
                    <h3>${producto.nombre}</h3>
                    <p>${producto.descripcion}</p>
                    <div class="estado-info">
                        <strong>Precio:</strong> S/. ${producto.precio}<br>
                        <strong>Tipo:</strong> ${producto.nombreTipo}
                    </div>
                    <div class="botones">
                        <a href="/producto/list?filtro=${filtroActual}${not empty param.tipo ? '&tipo=' += param.tipo : ''}&editarId=${producto.idProducto}"
                           class="editar-btn">✏️ Editar</a>

                        <c:choose>
                            <c:when test="${producto.disponible}">
                                <form action="/producto/desactivar" method="post">
                                    <input type="hidden" name="id" value="${producto.idProducto}">
                                    <button type="submit" class="eliminar-btn">🗑️ Desactivar</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="/producto/reactivar" method="post">
                                    <input type="hidden" name="id" value="${producto.idProducto}">
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