<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos - GymFlow</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin">Regresar</a>

<main>
    <h1>Gestión de Productos</h1>

    <c:if test="${not empty mensaje}">
        <div class="alert-${tipo}">${mensaje}</div>
    </c:if>

    <!-- Formulario agregar/editar -->
    <form action="${productoEditar.idProducto != null ? pageContext.request.contextPath.concat('/productos/actualizar/').concat(productoEditar.idProducto) : pageContext.request.contextPath.concat('/productos/guardar')}" method="post">
        <h2>${productoEditar.idProducto != null ? 'Editar Producto' : 'Agregar Producto'}</h2>

        <input type="text" name="nombre" placeholder="Nombre del producto" value="${productoEditar.nombre}" required>
        <input type="number" step="0.01" name="precio" placeholder="Precio" value="${productoEditar.precio}" required>
        <input type="number" step="0.01" name="cantidad" placeholder="Cantidad/Stock" value="${productoEditar.cantidad}" required>
        <textarea name="descripcion" placeholder="Descripción" required>${productoEditar.descripcion}</textarea>

        <select name="idTipo" required>
            <option value="">Selecciona tipo</option>
            <c:forEach items="${tipos}" var="tipo">
                <option value="${tipo.idTipo}" ${productoEditar.tipoProducto != null && productoEditar.tipoProducto.idTipo == tipo.idTipo ? 'selected' : ''}>
                        ${tipo.nombreTipo}
                </option>
            </c:forEach>
        </select>

        <button type="submit">${productoEditar.idProducto != null ? 'Actualizar' : 'Agregar'} Producto</button>
        <c:if test="${productoEditar.idProducto != null}">
            <a href="${pageContext.request.contextPath}/productos">Cancelar</a>
        </c:if>
    </form>

    <!-- Filtros -->
    <div>
        <form action="${pageContext.request.contextPath}/productos/buscar" method="get">
            <input type="text" name="texto" placeholder="Buscar producto">
            <button type="submit">Buscar</button>
        </form>

        <form action="${pageContext.request.contextPath}/productos" method="get">
            <select name="idTipo" onchange="this.form.submit()">
                <option value="">Todos los tipos</option>
                <c:forEach items="${tipos}" var="tipo">
                    <option value="${tipo.idTipo}">${tipo.nombreTipo}</option>
                </c:forEach>
            </select>
        </form>
    </div>

    <!-- Grid de productos -->
    <div class="productos-grid">
        <c:forEach items="${productos}" var="producto">
            <div class="producto-card">
                <h3>${producto.nombre}</h3>
                <p><strong>Tipo:</strong> ${producto.tipoProducto.nombreTipo}</p>
                <p><strong>Precio:</strong> S/ ${producto.precio}</p>
                <p><strong>Stock:</strong> ${producto.cantidad}</p>
                <p><strong>Descripción:</strong> ${producto.descripcion}</p>

                <div>
                    <a href="${pageContext.request.contextPath}/productos/editar/${producto.idProducto}">Editar</a>
                    <a href="${pageContext.request.contextPath}/productos/eliminar/${producto.idProducto}" onclick="return confirm('¿Eliminar?')">Eliminar</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty productos}">
        <p>No hay productos</p>
    </c:if>

</main>
</body>
</html>