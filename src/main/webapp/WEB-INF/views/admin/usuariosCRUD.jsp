<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios - GymFlow</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin">Regresar</a>

<main>
    <h1>Gestión de Usuarios</h1>

    <c:if test="${not empty mensaje}">
        <div class="alert-${tipo}">${mensaje}</div>
    </c:if>

    <!-- Formulario agregar/editar -->
    <form action="${usuarioEditar.id != null ? pageContext.request.contextPath.concat('/usuarios/actualizar/').concat(usuarioEditar.id) : pageContext.request.contextPath.concat('/usuarios/guardar')}" method="post" id="formUsuario">
        <h2>${usuarioEditar.id != null ? 'Editar Usuario' : 'Agregar Usuario'}</h2>

        <input type="text" name="nombre" placeholder="Nombre" value="${usuarioEditar.nombre}" required>
        <input type="text" name="apellido" placeholder="Apellido" value="${usuarioEditar.apellido}" required>
        <input type="text" name="dni" placeholder="DNI" value="${usuarioEditar.dni}">
        <input type="email" name="email" placeholder="Email" value="${usuarioEditar.email}" required>
        <input type="text" name="telefono" placeholder="Teléfono" value="${usuarioEditar.telefono}" required>
        <input type="text" name="username" placeholder="Usuario" value="${usuarioEditar.username}" required>
        <input type="password" name="password" placeholder="Contraseña ${usuarioEditar.id != null ? '(vacío = no cambiar)' : ''}" ${usuarioEditar.id == null ? 'required' : ''}>
        <input type="text" name="direccion" placeholder="Dirección" value="${usuarioEditar.direccion}">

        <select name="rol" required>
            <option value="">Selecciona rol</option>
            <c:forEach items="${roles}" var="rol">
                <option value="${rol}" ${usuarioEditar.rol == rol ? 'selected' : ''}>${rol}</option>
            </c:forEach>
        </select>

        <label>
            <input type="checkbox" name="activo" value="true" ${usuarioEditar.activo || usuarioEditar.id == null ? 'checked' : ''}>
            Usuario Activo
        </label>

        <button type="submit">${usuarioEditar.id != null ? 'Actualizar' : 'Agregar'} Usuario</button>
        <c:if test="${usuarioEditar.id != null}">
            <a href="${pageContext.request.contextPath}/usuarios">Cancelar</a>
        </c:if>
    </form>

    <!-- Filtros -->
    <div>
        <form action="${pageContext.request.contextPath}/usuarios/buscar" method="get">
            <input type="text" name="texto" placeholder="Buscar">
            <button type="submit">Buscar</button>
        </form>

        <form action="${pageContext.request.contextPath}/usuarios" method="get">
            <select name="rol" onchange="this.form.submit()">
                <option value="">Todos</option>
                <c:forEach items="${roles}" var="rol">
                    <option value="${rol}">${rol}</option>
                </c:forEach>
            </select>
        </form>
    </div>

    <!-- Tabla -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Username</th>
            <th>Rol</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${usuarios}" var="usuario">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nombre} ${usuario.apellido}</td>
                <td>${usuario.email}</td>
                <td>${usuario.username}</td>
                <td>${usuario.rol}</td>
                <td>${usuario.activo ? 'Activo' : 'Inactivo'}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/usuarios/editar/${usuario.id}">✏️</a>
                    <a href="${pageContext.request.contextPath}/usuarios/cambiar-estado/${usuario.id}?activo=${!usuario.activo}" onclick="return confirm('¿Cambiar estado?')">${usuario.activo ? '🔒' : '🔓'}</a>
                    <a href="${pageContext.request.contextPath}/usuarios/eliminar/${usuario.id}" onclick="return confirm('¿Eliminar?')">🗑️</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty usuarios}">
        <p>No hay usuarios</p>
    </c:if>

</main>
</body>
</html>