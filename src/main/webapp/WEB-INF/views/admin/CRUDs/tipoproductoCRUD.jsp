<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/AdminStyles.css" />




<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Tipos de Productos - GymFlow</title>
</head>
<body>

<a href="/admin" class="btn-volver">Regresar al Dashboard</a>

<main class="main-content">
    <h1>Gestión de Tipos de Productos</h1>

    <!-- Formulario para crear -->
    <form action="/tipoproducto/crear" method="post" class="form-tipo">
        <input type="text" name="nombreTipo" placeholder="Nombre del tipo" required>
        <textarea name="descripcionProducto" placeholder="Descripción" required></textarea>
        <button type="submit" class="agregar-btn">Agregar Tipo</button>
    </form>

    <!-- Tabla CRUD -->
    <table class="tabla-crud">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>Descripción</th>
            <th>Acciones</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="tipo" items="${tipoproductos}">
            <tr>
                <td>${tipo.idTipo}</td>
                <td>${tipo.nombreTipo}</td>
                <td>${tipo.descripcionProducto}</td>

                <td>
                    <a href="/tipoproducto/editar?id=${tipo.idTipo}">Editar</a>
                    <a href="/tipoproducto/eliminar?id=${tipo.idTipo}">Eliminar</a>


                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</main>

</body>
</html>

