<h1>Registrar Tipo de Producto</h1>

<form action="/tipoproducto/crear" method="post">
    <label>Nombre:</label>
    <input type="text" name="nombreTipo" value="${tipoProducto.nombreTipo}" required><br>

    <label>Descripción:</label>
    <textarea name="descripcionProducto">${tipoProducto.descripcionProducto}</textarea><br>

    <button type="submit">Guardar</button>
</form>

<a href="/tipoproducto/list">Volver</a>
