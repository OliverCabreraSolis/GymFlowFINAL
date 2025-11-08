<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <h1>GymFlow</h1>
            <p>Tu Gimnasio Digital</p>
        </div>

        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/inicio" class="nav-item">
                <i class="fas fa-home"></i> Principal
            </a>
            <a href="${pageContext.request.contextPath}/anuncio" class="nav-item">
                <i class="fas fa-users"></i> Publicidad
            </a>
            <a href="${pageContext.request.contextPath}/membresias" class="nav-item active">
                <i class="fas fa-id-card"></i> Catálogo de membresías
            </a>
            <a href="${pageContext.request.contextPath}/contacto" class="nav-item">
                <i class="fas fa-credit-card"></i> Contacto
            </a>
            <a href="${pageContext.request.contextPath}/CRUDproductos" class="nav-item">
                <i class="fas fa-headset"></i> Productos de GymFlow
            </a>
        </nav>
    </aside>

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
                    <option value="efectivo">Efectivo</option>
                    <option value="tarjeta">Tarjeta</option>
                    <option value="transferencia">Transferencia</option>
                    <option value="yape">Yape</option>
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
                <span class="status pagado">Completado</span>
            </div>

            <div class="pago-card">
                <h3>María López</h3>
                <p>Email: <a href="mailto:marialopez@gmail.com">marialopez@gmail.com</a></p>
                <p>Membresía: Básico</p>
                <p>Pago: Efectivo</p>
                <span class="status pendiente">Pendiente</span>
            </div>
        </section>
    </main>
</div>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/js/Pagos.js"></script>
<script src="${pageContext.request.contextPath}/js/navegacion.js"></script>
</body>
</html>
