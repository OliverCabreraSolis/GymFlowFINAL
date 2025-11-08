<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Planes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/planes.css">
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/dashboard" class="btn-volver">Regresar al panel</a>

<main class="main-content">
    <h1>Gestión de Planes</h1>

    <!-- 🧾 Formulario para agregar plan -->
    <form id="formPlan" class="form-producto">
        <input type="text" id="nombre" placeholder="Nombre del plan" required>
        <select id="duracion" required>
            <option value="">Selecciona duración</option>
            <option value="1 mes">1 mes</option>
            <option value="3 meses">3 meses</option>
            <option value="6 meses">6 meses</option>
            <option value="1 año">1 año</option>
        </select>
        <input type="number" id="precio" placeholder="Precio (S/.)" min="0" required>
        <textarea id="descripcion" placeholder="Descripción del plan" required></textarea>
        <button type="submit">Agregar Plan</button>
    </form>

    <!-- 🎛️ Filtro -->
    <label for="filtroDuracion">Filtrar por duración:</label>
    <select id="filtroDuracion">
        <option value="">Todos</option>
        <option value="1 mes">1 mes</option>
        <option value="3 meses">3 meses</option>
        <option value="6 meses">6 meses</option>
        <option value="1 año">1 año</option>
    </select>

    <!-- 📦 Contenedor -->
    <div id="productos-container" class="productos-grid">
        <c:forEach var="plan" items="${planes}">
            <div class="producto-card" data-id="${plan.id}">
                <h3 class="nombre">${plan.nombre}</h3>
                <p><strong>Duración:</strong> <span class="duracion">${plan.duracion}</span></p>
                <p><strong>Precio:</strong> S/ <span class="precio">${plan.precio}</span></p>
                <p><strong>Descripción:</strong> <span class="texto-descripcion">${plan.descripcion}</span></p>

                <div class="botones">
                    <button class="editar-btn">Editar</button>
                    <button class="guardar-btn oculto">Guardar</button>
                    <button class="cancelar-btn oculto">Cancelar</button>
                    <button class="eliminar-btn">Eliminar</button>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<script>
    const form = document.getElementById("formPlan");
    const container = document.getElementById("productos-container");
    const filtro = document.getElementById("filtroDuracion");

    function renderPlanes() {
        // Ya renderizados por el servidor al cargar la página
    }

    // Agregar un nuevo plan
    form.addEventListener("submit", async e => {
        e.preventDefault();

        const nuevoPlan = {
            nombre: document.getElementById("nombre").value,
            duracion: document.getElementById("duracion").value,
            precio: parseFloat(document.getElementById("precio").value),
            descripcion: document.getElementById("descripcion").value
        };

        const res = await fetch("${pageContext.request.contextPath}/admin/planes/api", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(nuevoPlan)
        });

        if (res.ok) location.reload();
    });

    // Delegación de eventos para editar/eliminar
    container.addEventListener("click", async e => {
        const card = e.target.closest(".producto-card");
        const id = card.dataset.id;

        if (e.target.classList.contains("eliminar-btn")) {
            const res = await fetch(`${pageContext.request.contextPath}/admin/planes/api/${id}`, {
                method: "DELETE"
            });
            if (res.ok) card.remove();
        }

        if (e.target.classList.contains("editar-btn")) {
            const nombreEl = card.querySelector(".nombre");
            const duracionEl = card.querySelector(".duracion");
            const precioEl = card.querySelector(".precio");
            const descEl = card.querySelector(".texto-descripcion");

            const guardarBtn = card.querySelector(".guardar-btn");
            const cancelarBtn = card.querySelector(".cancelar-btn");
            e.target.classList.add("oculto");
            guardarBtn.classList.remove("oculto");
            cancelarBtn.classList.remove("oculto");

            const inputDuracion = document.createElement("select");
            ["1 mes", "3 meses", "6 meses", "1 año"].forEach(op => {
                const option = document.createElement("option");
                option.value = op;
                option.textContent = op;
                if (op === duracionEl.textContent) option.selected = true;
                inputDuracion.appendChild(option);
            });

            const inputPrecio = document.createElement("input");
            inputPrecio.type = "number";
            inputPrecio.value = precioEl.textContent;

            const inputDesc = document.createElement("textarea");
            inputDesc.value = descEl.textContent;

            duracionEl.replaceWith(inputDuracion);
            precioEl.replaceWith(inputPrecio);
            descEl.replaceWith(inputDesc);

            guardarBtn.onclick = async () => {
                const actualizado = {
                    nombre: nombreEl.textContent,
                    duracion: inputDuracion.value,
                    precio: parseFloat(inputPrecio.value),
                    descripcion: inputDesc.value
                };

                const res = await fetch(`${pageContext.request.contextPath}/admin/planes/api/${id}`, {
                    method: "PUT",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(actualizado)
                });

                if (res.ok) location.reload();
            };

            cancelarBtn.onclick = () => location.reload();
        }
    });

    filtro.addEventListener("change", e => {
        const duracion = e.target.value;
        const url = duracion
            ? `${pageContext.request.contextPath}/admin/planes?duracion=${duracion}`
            : `${pageContext.request.contextPath}/admin/planes`;
        window.location.href = url;
    });
</script>
</body>
</html>
