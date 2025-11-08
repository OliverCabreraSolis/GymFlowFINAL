<table border="1">
    <tr><th>ID</th><th>Nombre</th><th>Descripción</th><th>Acciones</th></tr>
    <c:forEach var="tipo" items="${tipoproductos}">
        <tr>
            <td>${tipo.idTipo}</td>
            <td>${tipo.nombreTipo}</td>
            <td>${tipo.descripcionProducto}</td>
            <td>
                <a href="/tipoproducto/editar?id=${tipo.idTipo}">Editar</a> |
                <a href="/tipoproducto/eliminar?id=${tipo.idTipo}">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/tipoproducto/crear">Agregar nuevo</a>
