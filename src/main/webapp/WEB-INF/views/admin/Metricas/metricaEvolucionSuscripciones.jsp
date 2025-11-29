<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymFlow - Evolución de Suscripciones</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metricasStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .bars-wrapper {
            display: flex;
            gap: 8px;
            align-items: flex-end;
            height: 150px;
        }
        .bar-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex: 1;
        }
        .bar-container {
            width: 40px;
            display: flex;
            align-items: flex-end;
        }
        .description-section {
            background: #f8fafc;
            border-left: 4px solid #ff6b6b;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
        }
        .description-section h3 {
            color: #1e293b;
            margin-bottom: 15px;
        }
        .description-section p {
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .description-section ul {
            color: #64748b;
            margin-left: 20px;
        }
        .description-section ul li {
            margin-bottom: 8px;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <h1>GymFlow</h1>
            <p>Panel Administrativo</p>
        </div>

        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/productos" class="nav-item">
                <i class="fas fa-box"></i> Gestión de Productos
            </a>
            <a href="${pageContext.request.contextPath}/membresias" class="nav-item">
                <i class="fas fa-tags"></i> Membresías
            </a>
            <a href="${pageContext.request.contextPath}/tipos-productos" class="nav-item">
                <i class="fas fa-box"></i> Tipos de productos
            </a>
            <a href="${pageContext.request.contextPath}/usuarios" class="nav-item">
                <i class="fas fa-users"></i> Usuarios
            </a>
            <a href="${pageContext.request.contextPath}/metricas" class="nav-item active">
                <i class="fas fa-chart-line"></i> Métricas
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/metricas"><i class="fas fa-arrow-left"></i> Volver a Métricas</a>
        </div>

        <header class="header">
            <div class="header-content">
                <div>
                    <h2>Evolución de Suscripciones</h2>
                    <p>Análisis de nuevas membresías, bajas y crecimiento neto por periodo</p>
                </div>
            </div>
        </header>

        <!-- Descripción de la Métrica -->
        <section class="description-section">
            <h3><i class="fas fa-info-circle"></i> Descripción de la Métrica</h3>
            <p><strong>¿Qué mide?</strong> Esta métrica analiza el comportamiento de las membresías del gimnasio, comparando las nuevas altas contra las bajas o cancelaciones registradas en cada periodo.</p>

            <p><strong>Periodo de medición:</strong> Los datos se analizan mensualmente, considerando un histórico de los últimos 12 meses para observar tendencias de crecimiento o caída.</p>

            <p><strong>Fuente de datos:</strong></p>
            <ul>
                <li><strong>Nuevas membresías:</strong> Se obtienen de la tabla <code>membresia</code>, agrupando por <code>fecha_inicio</code> (mes/año).</li>
                <li><strong>Bajas:</strong> Se consideran las membresías con <code>estado = 'CANCELADA'</code> o aquellas cuyo <code>fecha_fin</code> expiró sin renovación.</li>
                <li><strong>Crecimiento neto:</strong> Resultado de restar las bajas del total de nuevas membresías en cada periodo.</li>
            </ul>

            <p><strong>Utilidad:</strong> Ayuda a identificar patrones estacionales, medir la efectividad de campañas de captación y detectar periodos donde las bajas superan a las altas para tomar decisiones estratégicas.</p>
        </section>
    </main>
</div>
</body>
</html>