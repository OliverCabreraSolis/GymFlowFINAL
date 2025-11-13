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
                    <p>Análisis comparativo de altas y bajas por periodo</p>
                </div>
            </div>
        </header>

        <!-- Descripción de la Métrica -->
        <section class="description-section">
            <h3><i class="fas fa-info-circle"></i> Descripción de la Métrica</h3>
            <p><strong>¿Qué mide?</strong> Esta métrica analiza el comportamiento de las suscripciones del gimnasio, comparando las nuevas altas de clientes contra las bajas o cancelaciones en cada periodo.</p>

            <p><strong>Periodo de medición:</strong> Los datos se registran mensualmente, con un histórico de los últimos 12 meses disponible para análisis de tendencias.</p>

            <p><strong>Fuente de datos:</strong></p>
            <ul>
                <li><strong>Nuevas Suscripciones:</strong> Se obtienen de la tabla <code>usuarios</code> filtrando por <code>rol = 'CLIENTE'</code> y agrupando por <code>fecha_registro</code> (mes/año).</li>
                <li><strong>Bajas:</strong> Se calculan mediante la tabla <code>membresias</code> donde <code>estado = 'CANCELADA'</code> o <code>fecha_fin</code> haya expirado sin renovación.</li>
                <li><strong>Crecimiento Neto:</strong> Resultado de restar las bajas del total de nuevas suscripciones por periodo.</li>
            </ul>

            <p><strong>Utilidad:</strong> Permite identificar patrones estacionales, evaluar el impacto de campañas de marketing, y detectar periodos críticos donde las bajas superan las altas para tomar acciones correctivas.</p>
        </section>

        <!-- KPI Cards -->
        <section class="kpi-section">
            <div class="kpi-card">
                <div class="kpi-icon positive">
                    <i class="fas fa-user-plus"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Nuevas Suscripciones</p>
                    <p class="kpi-value">${nuevasSuscripciones}</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-up"></i> +15% vs mes anterior
                    </span>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon negative">
                    <i class="fas fa-user-times"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Bajas del Periodo</p>
                    <p class="kpi-value">${bajasPeriodo}</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-down"></i> -8% vs mes anterior
                    </span>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon neutral">
                    <i class="fas fa-chart-line"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Crecimiento Neto</p>
                    <p class="kpi-value">+${crecimientoNeto}</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-up"></i> +22% vs mes anterior
                    </span>
                </div>
            </div>
        </section>

        <!-- Gráficos -->
        <section class="charts-section">
            <!-- Gráfico de Barras Comparativo -->
            <div class="chart-card large">
                <h3><i class="fas fa-chart-bar"></i> Comparativa Mensual: Altas vs Bajas</h3>
                <div class="chart-container">
                    <div class="chart-bars">
                        <c:forEach items="${datosComparativos}" var="dato">
                            <div class="bar-group">
                                <div class="bars-wrapper">
                                    <div class="bar-container">
                                        <div class="bar positive" style="height: ${dato.porcentajeAltas}%;">
                                            <span class="bar-value">${dato.altas}</span>
                                        </div>
                                    </div>
                                    <div class="bar-container">
                                        <div class="bar negative" style="height: ${dato.porcentajeBajas}%;">
                                            <span class="bar-value">${dato.bajas}</span>
                                        </div>
                                    </div>
                                </div>
                                <p class="bar-label">${dato.mes}</p>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="chart-legend">
                        <div class="legend-item">
                            <span class="legend-color positive"></span>
                            Nuevas Suscripciones
                        </div>
                        <div class="legend-item">
                            <span class="legend-color negative"></span>
                            Bajas
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gráfico de Líneas -->
            <div class="chart-card medium">
                <h3><i class="fas fa-chart-line"></i> Tendencia de Crecimiento Neto</h3>
                <div class="line-chart">
                    <div class="line-graph">
                        <svg viewBox="0 0 400 200" class="chart-svg">
                            <!-- Grid lines -->
                            <line x1="40" y1="180" x2="380" y2="180" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="140" x2="380" y2="140" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="100" x2="380" y2="100" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="60" x2="380" y2="60" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="20" x2="380" y2="20" stroke="#e2e8f0" stroke-width="1"/>

                            <!-- Line -->
                            <polyline
                                    points="60,120 140,130 220,90 300,70 380,40"
                                    fill="none"
                                    stroke="#ff6b6b"
                                    stroke-width="3"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                            />

                            <!-- Points -->
                            <circle cx="60" cy="120" r="5" fill="#ff6b6b"/>
                            <circle cx="140" cy="130" r="5" fill="#ff6b6b"/>
                            <circle cx="220" cy="90" r="5" fill="#ff6b6b"/>
                            <circle cx="300" cy="70" r="5" fill="#ff6b6b"/>
                            <circle cx="380" cy="40" r="5" fill="#ff6b6b"/>

                            <!-- Labels -->
                            <text x="60" y="195" text-anchor="middle" font-size="12" fill="#64748b">Ene</text>
                            <text x="140" y="195" text-anchor="middle" font-size="12" fill="#64748b">Feb</text>
                            <text x="220" y="195" text-anchor="middle" font-size="12" fill="#64748b">Mar</text>
                            <text x="300" y="195" text-anchor="middle" font-size="12" fill="#64748b">Abr</text>
                            <text x="380" y="195" text-anchor="middle" font-size="12" fill="#64748b">May</text>
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Distribución por Plan -->
            <div class="chart-card">
                <h3><i class="fas fa-chart-pie"></i> Distribución por Tipo de Plan</h3>
                <div class="distribution-chart">
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill monthly" style="width: 65%;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Plan Mensual</span>
                            <span class="dist-value">65%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill quarterly" style="width: 25%;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Plan Trimestral</span>
                            <span class="dist-value">25%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill annual" style="width: 10%;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Plan Anual</span>
                            <span class="dist-value">10%</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>