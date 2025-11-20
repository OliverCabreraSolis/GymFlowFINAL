<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GymFlow - Pagos</title>

    <!-- CSS principal -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UsuarioStyles.css">

    <!-- Iconos Font Awesome -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
</head>

<body class="pagos-page">
<div class="dashboard">

    <%@ include file='barra_tareas.jsp' %>

    <!-- Contenido principal -->
    <main class="main-content">
        <header class="header">
            <h1>Gestión de Pagos</h1>
            <p>Registra y visualiza los pagos de clientes</p>
        </header>

        <!-- Formulario de pagos -->
        <section class="pago-form">
            <h2>Registrar Pago</h2>
            <form action="RegistrarPagoServlet" method="post">
                <label for="nombre">Nombre del Cliente</label>
                <input
                        type="text"
                        id="nombre"
                        name="nombre"
                        placeholder="Ej: Juan Pérez"
                        required
                />

                <label for="email">Correo Electrónico</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="cliente@gmail.com"
                        required
                />

                <label for="tipo">Tipo de Pago</label>
                <select id="tipo" name="tipo" required>
                    <option value="">Seleccionar...</option>
                    <option value="EFECTIVO">EFECTIVO</option>
                    <option value="TARJETA">TARJETA</option>
                    <option value="PLIN">PLIN</option>
                    <option value="YAPE">YAPE</option>
                </select>

                <label for="membresia">Membresía</label>
                <select id="membresia" name="membresia" required>
                    <option value="">Seleccionar...</option>
                    <option value="basico">Básico</option>
                    <option value="intermedio">Intermedio</option>
                    <option value="premium">Premium</option>
                </select>

                <button type="submit">Registrar Pago</button>
            </form>
        </section>

        <!-- Pagos recientes -->
        <section class="pagos-container">
            <h2>Pagos Recientes</h2>
            <div class="pago-card">
                <h3>Juan Pérez</h3>
                <p>Email: <a href="mailto:juanperez@gmail.com">juanperez@gmail.com</a></p>
                <p>Membresía: Premium</p>
                <p>Pago: Tarjeta</p>

            </div>

            <div class="pago-card">
                <h3>María López</h3>
                <p>Email: <a href="mailto:marialopez@gmail.com">marialopez@gmail.com</a></p>
                <p>Membresía: Básico</p>
                <p>Pago: Efectivo</p>

            </div>
        </section>
    </main>
</div>

<!-- Scripts -->


</body>
</html>
