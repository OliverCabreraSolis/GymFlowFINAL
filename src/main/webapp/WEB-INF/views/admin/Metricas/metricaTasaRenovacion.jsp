<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymFlow - Tasa de Renovación</title>
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
            background: #f0fdf4;
            border-left: 4px solid #10b981;
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
        .bar.renovado { background: linear-gradient(135deg, #10b981 0%, #059669 100%); }
        .bar.no-renovado { background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); }
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
                    <h2>Tasa de Renovación de Membresías</h2>
                    <p>Análisis de retención y renovación de clientes</p>
                </div>
            </div>
        </header>

        <!-- Descripción de la Métrica -->
        <section class="description-section">
            <h3><i class="fas fa-info-circle"></i> Descripción de la Métrica</h3>
            <p><strong>¿Qué mide?</strong> Esta métrica calcula el porcentaje de clientes que renuevan su membresía al finalizar su periodo de suscripción, un indicador clave de satisfacción y lealtad del cliente.</p>

            <p><strong>Periodo de medición:</strong> Se analiza mensualmente, comparando las membresías que vencieron en el periodo contra las que fueron renovadas. El histórico de 12 meses permite identificar patrones estacionales.</p>

            <p><strong>Fuente de datos:</strong></p>
            <ul>
                <li><strong>Tabla principal:</strong> <code>membresias</code> donde se registran todas las suscripciones con sus fechas de inicio y fin.</li>
                <li><strong>Cálculo de vencimientos:</strong> Se filtran registros donde <code>fecha_fin</code> esté en el rango del mes analizado.</li>
                <li><strong>Renovaciones:</strong> Se cuentan los clientes que tienen una nueva membresía activa (nuevo registro en <code>membresias</code>) dentro de los 7 días posteriores al <code>fecha_fin</code> de su membresía anterior.</li>
                <li><strong>Fórmula:</strong> <code>Tasa de Renovación = (Membresías Renovadas / Membresías Vencidas) × 100</code></li>
                <li><strong>No renovados:</strong> Clientes cuya última membresía venció y no tienen un nuevo registro activo.</li>
            </ul>

            <p><strong>Criterios adicionales:</strong></p>
            <ul>
                <li>Solo se consideran renovaciones si el nuevo plan se adquiere dentro de 7 días del vencimiento.</li>
                <li>Se excluyen membresías canceladas antes de su fecha de finalización natural.</li>
                <li>Los cambios de plan (upgrade/downgrade) se consideran como renovaciones.</li>
            </ul>

            <p><strong>Utilidad:</strong> Permite medir la satisfacción del cliente, evaluar la efectividad de estrategias de retención, identificar periodos críticos de deserción, y calcular el valor de vida del cliente (Customer Lifetime Value).</p>
        </section>

        <!-- KPI Cards -->
        <section class="kpi-section">
            <div class="kpi-card">
                <div class="kpi-icon positive">
                    <i class="fas fa-sync-alt"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Tasa de Renovación</p>
                    <p class="kpi-value">82%</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-up"></i> +5% vs mes anterior
                    </span>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Membresías Renovadas</p>
                    <p class="kpi-value">164</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-up"></i> +10 vs mes anterior
                    </span>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon negative">
                    <i class="fas fa-times-circle"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">No Renovadas</p>
                    <p class="kpi-value">36</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-down"></i> -3 vs mes anterior
                    </span>
                </div>
            </div>
        </section>

        <!-- Gráficos -->
        <section class="charts-section">
            <!-- Gráfico de Barras Comparativo -->
            <div class="chart-card large">
                <h3><i class="fas fa-chart-bar"></i> Comparativa Mensual: Renovados vs No Renovados</h3>
                <div class="chart-container">
                    <div class="chart-bars">
                        <!-- Enero -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar renovado" style="height: 75%;">
                                        <span class="bar-value">145</span>
                                    </div>
                                </div>
                                <div class="bar-container">
                                    <div class="bar no-renovado" style="height: 25%;">
                                        <span class="bar-value">48</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Ene</p>
                        </div>

                        <!-- Febrero -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar renovado" style="height: 78%;">
                                        <span class="bar-value">152</span>
                                    </div>
                                </div>
                                <div class="bar-container">
                                    <div class="bar no-renovado" style="height: 22%;">
                                        <span class="bar-value">43</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Feb</p>
                        </div>

                        <!-- Marzo -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar renovado" style="height: 80%;">
                                        <span class="bar-value">154</span>
                                    </div>
                                </div>
                                <div class="bar-container">
                                    <div class="bar no-renovado" style="height: 20%;">
                                        <span class="bar-value">39</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Mar</p>
                        </div>

                        <!-- Abril -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar renovado" style="height: 82%;">
                                        <span class="bar-value">164</span>
                                    </div>
                                </div>
                                <div class="bar-container">
                                    <div class="bar no-renovado" style="height: 18%;">
                                        <span class="bar-value">36</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Abr</p>
                        </div>
                    </div>

                    <div class="chart-legend">
                        <div class="legend-item">
                            <span class="legend-color" style="background: #10b981;"></span>
                            Renovados
                        </div>
                        <div class="legend-item">
                            <span class="legend-color" style="background: #ef4444;"></span>
                            No Renovados
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gráfico de Líneas - Tendencia -->
            <div class="chart-card medium">
                <h3><i class="fas fa-chart-line"></i> Tendencia de Tasa de Renovación (%)</h3>
                <div class="line-chart">
                    <div class="line-graph">
                        <svg viewBox="0 0 400 200" class="chart-svg">
                            <!-- Grid lines -->
                            <line x1="40" y1="180" x2="380" y2="180" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="140" x2="380" y2="140" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="100" x2="380" y2="100" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="60" x2="380" y2="60" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="20" x2="380" y2="20" stroke="#e2e8f0" stroke-width="1"/>

                            <!-- Línea -->
                            <polyline
                                    points="60,110 140,100 220,90 300,80 380,60"
                                    fill="none"
                                    stroke="#10b981"
                                    stroke-width="3"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                            />

                            <!-- Puntos -->
                            <circle cx="60" cy="110" r="5" fill="#10b981"/>
                            <circle cx="140" cy="100" r="5" fill="#10b981"/>
                            <circle cx="220" cy="90" r="5" fill="#10b981"/>
                            <circle cx="300" cy="80" r="5" fill="#10b981"/>
                            <circle cx="380" cy="60" r="5" fill="#10b981"/>

                            <!-- Etiquetas -->
                            <text x="60" y="195" text-anchor="middle" font-size="12" fill="#64748b">Ene</text>
                            <text x="140" y="195" text-anchor="middle" font-size="12" fill="#64748b">Feb</text>
                            <text x="220" y="195" text-anchor="middle" font-size="12" fill="#64748b">Mar</text>
                            <text x="300" y="195" text-anchor="middle" font-size="12" fill="#64748b">Abr</text>
                            <text x="380" y="195" text-anchor="middle" font-size="12" fill="#64748b">May</text>

                            <!-- Valores de porcentaje -->
                            <text x="60" y="105" text-anchor="middle" font-size="11" fill="#10b981" font-weight="bold">75%</text>
                            <text x="140" y="95" text-anchor="middle" font-size="11" fill="#10b981" font-weight="bold">78%</text>
                            <text x="220" y="85" text-anchor="middle" font-size="11" fill="#10b981" font-weight="bold">80%</text>
                            <text x="300" y="75" text-anchor="middle" font-size="11" fill="#10b981" font-weight="bold">81%</text>
                            <text x="380" y="55" text-anchor="middle" font-size="11" fill="#10b981" font-weight="bold">82%</text>
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Distribución por Tipo de Membresía -->
            <div class="chart-card">
                <h3><i class="fas fa-chart-pie"></i> Tasa de Renovación por Tipo de Plan</h3>
                <div class="distribution-chart">
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 88%; background: #10b981;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Plan Anual</span>
                            <span class="dist-value">88%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 82%; background: #10b981;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Plan Trimestral</span>
                            <span class="dist-value">82%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 75%; background: #10b981;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Plan Mensual</span>
                            <span class="dist-value">75%</span>
                        </div>
                    </div>
                </div>
                <p style="color: #64748b; font-size: 14px; margin-top: 15px; padding: 10px; background: #f1f5f9; border-radius: 6px;">
                    <i class="fas fa-lightbulb" style="color: #f59e0b;"></i>
                    Los planes anuales tienen mayor tasa de renovación debido al compromiso a largo plazo.
                </p>
            </div>
        </section>

        <!-- Análisis Adicional -->
        <section class="charts-section">
            <div class="chart-card large">
                <h3><i class="fas fa-exclamation-triangle"></i> Motivos de No Renovación (Últimos 3 meses)</h3>
                <div class="distribution-chart">
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 35%; background: #ef4444;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Precio elevado</span>
                            <span class="dist-value">35%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 28%; background: #ef4444;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Cambio de residencia</span>
                            <span class="dist-value">28%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 18%; background: #ef4444;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Falta de tiempo</span>
                            <span class="dist-value">18%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 12%; background: #ef4444;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Insatisfacción con servicios</span>
                            <span class="dist-value">12%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 7%; background: #ef4444;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Otros motivos</span>
                            <span class="dist-value">7%</span>
                        </div>
                    </div>
                </div>
                <p style="color: #64748b; font-size: 14px; margin-top: 15px; padding: 10px; background: #fef2f2; border-radius: 6px; border-left: 3px solid #ef4444;">
                    <i class="fas fa-info-circle" style="color: #ef4444;"></i>
                    Esta información se obtiene de encuestas de salida registradas en la tabla <code>encuestas_clientes</code>.
                </p>
            </div>
        </section>
    </main>
</div>
</body>
</html>