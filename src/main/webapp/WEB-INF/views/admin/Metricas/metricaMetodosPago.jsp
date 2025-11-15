<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymFlow - Métodos de Pago</title>
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
            background: #f0f9ff;
            border-left: 4px solid #3b82f6;
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
        .bar.efectivo { background: linear-gradient(135deg, #10b981 0%, #059669 100%); }
        .bar.tarjeta { background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); }
        .bar.transferencia { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); }
        .bar.yape { background: linear-gradient(135deg, #ec4899 0%, #db2777 100%); }
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
                    <h2>Análisis de Métodos de Pago</h2>
                    <p>Distribución y tendencias de transacciones por tipo de pago</p>
                </div>
            </div>
        </header>

        <!-- Descripción de la Métrica -->
        <section class="description-section">
            <h3><i class="fas fa-info-circle"></i> Descripción de la Métrica</h3>
            <p><strong>¿Qué mide?</strong> Esta métrica analiza la distribución de los métodos de pago utilizados por los clientes al realizar pagos de membresías, productos y servicios del gimnasio.</p>

            <p><strong>Periodo de medición:</strong> Los datos se actualizan en tiempo real y se pueden visualizar por día, semana, mes o año. El análisis histórico permite identificar tendencias de adopción de métodos digitales.</p>

            <p><strong>Fuente de datos:</strong></p>
            <ul>
                <li><strong>Tabla principal:</strong> <code>pagos</code> que registra cada transacción con su <code>metodo_pago</code> (EFECTIVO, TARJETA, TRANSFERENCIA, YAPE, PLIN).</li>
                <li><strong>Campos utilizados:</strong> <code>metodo_pago</code>, <code>monto</code> y <code>fecha_pago</code>.</li>
                <li><strong>Cálculo de porcentajes:</strong> Se divide el total de transacciones por método entre el total general de pagos del periodo.</li>
                <li><strong>Métodos digitales:</strong> Suma de TARJETA + TRANSFERENCIA + YAPE + PLIN.</li>
            </ul>

            <p><strong>Utilidad:</strong> Permite optimizar los métodos de cobro disponibles, identificar preferencias de los clientes, negociar comisiones con procesadores de pago, y planificar la infraestructura tecnológica necesaria.</p>
        </section>

        <!-- KPI Cards -->
        <section class="kpi-section">
            <div class="kpi-card">
                <div class="kpi-icon" style="background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);">
                    <i class="fas fa-credit-card"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Pagos Digitales</p>
                    <p class="kpi-value">68%</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-up"></i> +12% vs mes anterior
                    </span>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Efectivo</p>
                    <p class="kpi-value">32%</p>
                    <span class="kpi-change negative">
                        <i class="fas fa-arrow-down"></i> -12% vs mes anterior
                    </span>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon" style="background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);">
                    <i class="fas fa-chart-pie"></i>
                </div>
                <div class="kpi-content">
                    <p class="kpi-label">Total Transacciones</p>
                    <p class="kpi-value">1,247</p>
                    <span class="kpi-change positive">
                        <i class="fas fa-arrow-up"></i> +8% vs mes anterior
                    </span>
                </div>
            </div>
        </section>

        <!-- Gráficos -->
        <section class="charts-section">
            <!-- Gráfico de Barras por Método -->
            <div class="chart-card large">
                <h3><i class="fas fa-chart-bar"></i> Distribución por Método de Pago</h3>
                <div class="chart-container">
                    <div class="chart-bars">
                        <!-- Efectivo -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar efectivo" style="height: 65%;">
                                        <span class="bar-value">400</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Efectivo</p>
                        </div>

                        <!-- Tarjeta -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar tarjeta" style="height: 85%;">
                                        <span class="bar-value">520</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Tarjeta</p>
                        </div>

                        <!-- Transferencia -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar transferencia" style="height: 45%;">
                                        <span class="bar-value">227</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Transferencia</p>
                        </div>

                        <!-- Yape/Plin -->
                        <div class="bar-group">
                            <div class="bars-wrapper">
                                <div class="bar-container">
                                    <div class="bar yape" style="height: 20%;">
                                        <span class="bar-value">100</span>
                                    </div>
                                </div>
                            </div>
                            <p class="bar-label">Yape/Plin</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Evolución Mensual -->
            <div class="chart-card medium">
                <h3><i class="fas fa-chart-line"></i> Tendencia Digital vs Efectivo</h3>
                <div class="line-chart">
                    <div class="line-graph">
                        <svg viewBox="0 0 400 200" class="chart-svg">
                            <!-- Grid lines -->
                            <line x1="40" y1="180" x2="380" y2="180" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="140" x2="380" y2="140" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="100" x2="380" y2="100" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="60" x2="380" y2="60" stroke="#e2e8f0" stroke-width="1"/>
                            <line x1="40" y1="20" x2="380" y2="20" stroke="#e2e8f0" stroke-width="1"/>

                            <!-- Línea Digital (Azul) -->
                            <polyline
                                    points="60,140 140,120 220,90 300,70 380,50"
                                    fill="none"
                                    stroke="#3b82f6"
                                    stroke-width="3"
                                    stroke-linecap="round"
                            />

                            <!-- Línea Efectivo (Verde) -->
                            <polyline
                                    points="60,60 140,80 220,110 300,130 380,150"
                                    fill="none"
                                    stroke="#10b981"
                                    stroke-width="3"
                                    stroke-linecap="round"
                            />

                            <!-- Labels -->
                            <text x="60" y="195" text-anchor="middle" font-size="12" fill="#64748b">Ene</text>
                            <text x="140" y="195" text-anchor="middle" font-size="12" fill="#64748b">Feb</text>
                            <text x="220" y="195" text-anchor="middle" font-size="12" fill="#64748b">Mar</text>
                            <text x="300" y="195" text-anchor="middle" font-size="12" fill="#64748b">Abr</text>
                            <text x="380" y="195" text-anchor="middle" font-size="12" fill="#64748b">May</text>
                        </svg>
                    </div>
                    <div class="chart-legend">
                        <div class="legend-item">
                            <span class="legend-color" style="background: #3b82f6;"></span>
                            Métodos Digitales
                        </div>
                        <div class="legend-item">
                            <span class="legend-color" style="background: #10b981;"></span>
                            Efectivo
                        </div>
                    </div>
                </div>
            </div>

            <!-- Porcentaje por Método -->
            <div class="chart-card">
                <h3><i class="fas fa-percentage"></i> Porcentaje por Método</h3>
                <div class="distribution-chart">
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 42%; background: #3b82f6;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Tarjeta de Crédito/Débito</span>
                            <span class="dist-value">42%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 32%; background: #10b981;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Efectivo</span>
                            <span class="dist-value">32%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 18%; background: #8b5cf6;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Transferencia Bancaria</span>
                            <span class="dist-value">18%</span>
                        </div>
                    </div>
                    <div class="distribution-item">
                        <div class="dist-bar">
                            <div class="dist-fill" style="width: 8%; background: #ec4899;"></div>
                        </div>
                        <div class="dist-info">
                            <span class="dist-label">Yape / Plin</span>
                            <span class="dist-value">8%</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>