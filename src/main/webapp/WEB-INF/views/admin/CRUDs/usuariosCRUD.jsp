<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios - GymFlow</title>
    <link rel="stylesheet" href="/css/CrudsStyles.css">
</head>
<body>
<!-- 🚨 BOTÓN VOLVER - al menú CRUDs -->
<a href="/ver-CRUDsInicio" class="btn-volver">← Volver a CRUDs</a>

<main class="main-content">
    <h1>Gestión de Usuarios</h1>

    <!-- 🚨 FILTROS - Apuntan a /usuario/list -->
    <div class="filtros">
        <a href="/usuario/list?filtro=activos"
           class="filtro-btn ${filtroActual == 'activos' ? 'activo' : ''}">Activos</a>
        <a href="/usuario/list?filtro=inactivos"
           class="filtro-btn ${filtroActual == 'inactivos' ? 'activo' : ''}">Inactivos</a>
        <a href="/usuario/list?filtro=todos"
           class="filtro-btn ${filtroActual == 'todos' ? 'activo' : ''}">Todos</a>
    </div>

    <!-- FILTRO POR ROL -->
    <div class="filtros-tipo">
        <strong>Filtrar por rol:</strong>
        <a href="/usuario/list?filtro=${filtroActual}"
           class="filtro-btn ${empty param.rol ? 'activo' : ''}">Todos los roles</a>
        <a href="/usuario/list?filtro=${filtroActual}&rol=CLIENTE"
           class="filtro-btn ${param.rol == 'CLIENTE' ? 'activo' : ''}">Clientes</a>
        <a href="/usuario/list?filtro=${filtroActual}&rol=ADMIN"
           class="filtro-btn ${param.rol == 'ADMIN' ? 'activo' : ''}">Administradores</a>
    </div>

    <!-- FORMULARIO CREAR -->
    <form action="/usuario/crear" method="post" class="form-tipo">
        <input type="text" name="nombre" placeholder="Nombre completo" required>
        <input type="email" name="correo" placeholder="Correo electrónico" required>
        <input type="password" name="contrasena" placeholder="Contraseña" required>

        <select name="rol" required>
            <option value="">Selecciona un rol</option>
            <option value="CLIENTE">Cliente</option>
            <option value="ADMIN">Administrador</option>
        </select>

        <button type="submit" class="agregar-btn">➕ Agregar Usuario</button>
    </form>

    <!-- CARDS -->
    <div class="tipos-grid">
        <c:forEach var="usuario" items="${usuarios}">

            <c:if test="${param.editarId == usuario.idUsuario}">
                <!-- MODO EDICIÓN -->
                <div class="tipo-card edicion">
                    <form action="/usuario/actualizar" method="post">
                        <input type="hidden" name="idUsuario" value="${usuario.idUsuario}">

                        <label>Nombre:</label>
                        <input type="text" name="nombre" value="${usuario.nombre}" required>

                        <label>Correo:</label>
                        <input type="email" name="correo" value="${usuario.correo}" required>

                        <label>Contraseña:</label>
                        <input type="password" name="contrasena" placeholder="Nueva contraseña" value="${usuario.contrasena}" required>

                        <label>Rol:</label>
                        <select name="rol" required>
                            <option value="CLIENTE" ${usuario.rol == 'CLIENTE' ? 'selected' : ''}>Cliente</option>
                            <option value="ADMIN" ${usuario.rol == 'ADMIN' ? 'selected' : ''}>Administrador</option>
                        </select>

                        <label>Estado:</label>
                        <select name="disponible">
                            <option value="true" ${usuario.disponible ? 'selected' : ''}>Activo</option>
                            <option value="false" ${not usuario.disponible ? 'selected' : ''}>Inactivo</option>
                        </select>

                        <div class="botones">
                            <button type="submit" class="guardar-btn">💾 Guardar</button>
                            <!-- 🚨 CANCELAR apunta a /usuario/list -->
                            <a href="/usuario/list?filtro=${filtroActual}${not empty param.rol ? '&rol=' += param.rol : ''}"
                               class="cancelar-btn">❌ Cancelar</a>
                        </div>
                    </form>
                </div>
            </c:if>

            <c:if test="${param.editarId != usuario.idUsuario}">
                <!-- MODO VISUALIZACIÓN -->
                <div class="tipo-card ${usuario.disponible ? '' : 'inactivo'}">
                    <c:if test="${not usuario.disponible}">
                        <div class="badge-inactivo">INACTIVO</div>
                    </c:if>
                    <h3>${usuario.nombre}</h3>
                    <div class="estado-info">
                        <strong>Correo:</strong> ${usuario.correo}<br>
                        <strong>Rol:</strong>
                        <span class="${usuario.rol == 'ADMIN' ? 'precio-destacado' : ''}">
                                ${usuario.rol}
                        </span><br>
                        <strong>ID:</strong> #${usuario.idUsuario}
                    </div>
                    <div class="botones">
                        <!-- 🚨 EDITAR apunta a /usuario/list -->
                        <a href="/usuario/list?filtro=${filtroActual}${not empty param.rol ? '&rol=' += param.rol : ''}&editarId=${usuario.idUsuario}"
                           class="editar-btn">✏️ Editar</a>

                        <c:choose>
                            <c:when test="${usuario.disponible}">
                                <form action="/usuario/desactivar" method="post">
                                    <input type="hidden" name="id" value="${usuario.idUsuario}">
                                    <button type="submit" class="eliminar-btn">🗑️ Desactivar</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="/usuario/reactivar" method="post">
                                    <input type="hidden" name="id" value="${usuario.idUsuario}">
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