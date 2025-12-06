<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymFlow - Evolución de Suscripciones</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metricaEvSuscripcionesStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>💪</text></svg>">
    <style>
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

        .chart-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .chart-container {
            position: relative;
            height: 500px;
            width: 100%;
        }

        .alert {
            padding: 15px;
            margin: 10px 0;
            border-radius: 4px;
            text-align: center;
        }

        .alert-info {
            background: #e8f4fd;
            color: #0c5460;
            border: 1px solid #b8daff;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
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

        <!-- Gráfico -->
        <section class="chart-section">
            <div class="chart-container">
                <div id="chartLoading" class="alert alert-info" style="display: none;">
                    <i class="fas fa-spinner fa-spin"></i> Cargando datos...
                </div>
                <div id="chartError" class="alert alert-error" style="display: none;"></div>
                <div id="chartNoData" class="alert alert-info" style="display: none;">
                    <i class="fas fa-info-circle"></i> No hay datos disponibles para mostrar.
                </div>
                <canvas id="evolucionChart"></canvas>
            </div>
        </section>

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

    <!-- Script para el gráfico -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let evolucionChartInstance = null;

        function showElement(id, show) {
            const element = document.getElementById(id);
            if (element) {
                element.style.display = show ? 'block' : 'none';
            }
        }

        function showError(message) {
            const errorElement = document.getElementById('chartError');
            if (errorElement) {
                errorElement.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + message;
                errorElement.style.display = 'block';
            }
        }

        async function cargarDatosEvolucion() {
            showElement('chartLoading', true);
            showElement('chartError', false);
            showElement('chartNoData', false);

            try {
                const response = await fetch('${pageContext.request.contextPath}/api/metricas/evolucion-suscripciones');

                if (!response.ok) {
                    throw new Error('Error al cargar datos del servidor');
                }

                const datos = await response.json();

                showElement('chartLoading', false);

                if (!datos || datos.length === 0) {
                    showElement('chartNoData', true);
                    return;
                }

                renderizarGrafico(datos);

            } catch (error) {
                showElement('chartLoading', false);
                showError('No se pudieron cargar los datos: ' + error.message);
            }
        }

        function renderizarGrafico(datos) {
            const ctx = document.getElementById('evolucionChart').getContext('2d');

            const mesesNombres = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];

            const labels = [];
            const nuevasMembresias = [];
            const bajas = [];
            const crecimientoNeto = [];

            for (let i = 0; i < datos.length; i++) {
                const item = datos[i];

                // Crear label
                const mesNum = parseInt(item.MES) || 0;
                const anioNum = parseInt(item.ANIO) || 0;

                let label;
                if (mesNum >= 1 && mesNum <= 12) {
                    label = mesesNombres[mesNum - 1] + ' ' + anioNum;
                } else {
                    label = 'Mes ' + mesNum + ' ' + anioNum;
                }

                labels.push(label);
                nuevasMembresias.push(parseInt(item.NUEVAS_MEMBRESIAS) || 0);
                bajas.push(parseInt(item.BAJAS) || 0);
                crecimientoNeto.push(parseInt(item.CRECIMIENTO_NETO) || 0);
            }

            // Destruir gráfico anterior si existe
            if (evolucionChartInstance) {
                evolucionChartInstance.destroy();
            }

            // Crear nuevo gráfico
            evolucionChartInstance = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Nuevas Membresías',
                            data: nuevasMembresias,
                            borderColor: '#10b981',
                            backgroundColor: 'rgba(16, 185, 129, 0.1)',
                            borderWidth: 3,
                            tension: 0.2,
                            fill: false,
                            pointBackgroundColor: '#10b981',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 2,
                            pointRadius: 6
                        },
                        {
                            label: 'Bajas',
                            data: bajas,
                            borderColor: '#ef4444',
                            backgroundColor: 'rgba(239, 68, 68, 0.1)',
                            borderWidth: 3,
                            tension: 0.2,
                            fill: false,
                            pointBackgroundColor: '#ef4444',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 2,
                            pointRadius: 6
                        },
                        {
                            label: 'Crecimiento Neto',
                            data: crecimientoNeto,
                            borderColor: '#3b82f6',
                            backgroundColor: 'rgba(59, 130, 246, 0.1)',
                            borderWidth: 3,
                            tension: 0.2,
                            fill: false,
                            pointBackgroundColor: '#3b82f6',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 2,
                            pointRadius: 6
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: 'Evolución de Suscripciones - Últimos 24 Meses',
                            font: {
                                size: 16,
                                weight: 'bold'
                            },
                            padding: { bottom: 20 }
                        },
                        legend: {
                            position: 'top',
                            labels: {
                                font: {
                                    size: 14
                                },
                                padding: 20,
                                usePointStyle: true
                            }
                        },
                        tooltip: {
                            mode: 'index',
                            intersect: false,
                            backgroundColor: 'rgba(0, 0, 0, 0.7)',
                            padding: 12,
                            titleFont: { size: 14 },
                            bodyFont: { size: 13 },
                            cornerRadius: 6
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Cantidad de Membresías'
                            },
                            ticks: {
                                stepSize: 1
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Periodo'
                            }
                        }
                    }
                }
            });
        }

        // Cargar datos
        document.addEventListener('DOMContentLoaded', cargarDatosEvolucion);

        // Redimensionar
        window.addEventListener('resize', function() {
            if (evolucionChartInstance) {
                evolucionChartInstance.resize();
            }
        });
    </script>
</div>
</body>
</html>