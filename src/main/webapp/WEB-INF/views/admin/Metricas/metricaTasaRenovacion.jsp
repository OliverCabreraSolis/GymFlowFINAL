<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymFlow - Tasa de Renovación</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metricaTasaRenovStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>💪</text></svg>">
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
                <canvas id="tasaRenovacionChart"></canvas>
            </div>
        </section>

        <!-- Descripción de la Métrica -->
        <section class="description-section">
            <h3><i class="fas fa-info-circle"></i> Descripción de la Métrica</h3>
            <p><strong>¿Qué mide?</strong> Esta métrica calcula el porcentaje de clientes que renuevan su membresía al finalizar su periodo de suscripción, un indicador clave de satisfacción y lealtad del cliente.</p>

            <p><strong>Periodo de medición:</strong> Se analiza mensualmente, comparando las membresías que vencieron en el periodo contra las que fueron renovadas. El histórico de 12 meses permite identificar patrones estacionales.</p>

            <p><strong>Fuente de datos:</strong></p>
            <ul>
                <li><strong>Tabla principal:</strong> <code>membresia</code> donde se registran todas las suscripciones con sus fechas de inicio y fin.</li>
                <li><strong>Cálculo de vencimientos:</strong> Se filtran registros donde <code>fecha_fin</code> esté en el rango del mes analizado.</li>
                <li><strong>Renovaciones:</strong> Se cuentan los clientes que tienen una nueva membresía activa (nuevo registro en <code>membresia</code>) dentro de los 7 días posteriores al <code>fecha_fin</code> de su membresía anterior.</li>
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
    </main>

    <!-- Script para el gráfico -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let tasaRenovacionChartInstance = null;

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

        async function cargarDatosTasaRenovacion() {
            showElement('chartLoading', true);
            showElement('chartError', false);
            showElement('chartNoData', false);

            try {
                const response = await fetch('${pageContext.request.contextPath}/api/metricas/tasa-renovacion');

                if (!response.ok) {
                    throw new Error('Error al cargar datos del servidor');
                }

                const datos = await response.json();
                console.log('Datos recibidos del backend:', datos);

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
            const ctx = document.getElementById('tasaRenovacionChart').getContext('2d');

            const mesesNombres = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];

            const labels = [];
            const tasasRenovacion = [];
            const totalVencidas = [];
            const renovadas = [];
            const noRenovadas = [];

            for (let i = 0; i < datos.length; i++) {
                const item = datos[i];

                const mesNum = parseInt(item.MES) || 0;
                const anioNum = parseInt(item.ANIO) || 0;

                let label;
                if (mesNum >= 1 && mesNum <= 12) {
                    label = mesesNombres[mesNum - 1] + ' ' + anioNum;
                } else {
                    label = 'Mes ' + mesNum + ' ' + anioNum;
                }

                labels.push(label);
                tasasRenovacion.push(parseFloat(item.TASA_RENOVACION) || 0);
                totalVencidas.push(parseInt(item.TOTAL_VENCIDAS) || 0);
                renovadas.push(parseInt(item.RENOVADAS) || 0);
                noRenovadas.push(parseInt(item.NO_RENOVADAS) || 0);
            }

            console.log('=== DATOS PROCESADOS ===');
            console.log('Labels:', labels);
            console.log('Tasas:', tasasRenovacion);
            console.log('Total Vencidas:', totalVencidas);
            console.log('Renovadas:', renovadas);
            console.log('No Renovadas:', noRenovadas);

            if (tasaRenovacionChartInstance) {
                tasaRenovacionChartInstance.destroy();
            }

            tasaRenovacionChartInstance = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Renovadas',
                            data: renovadas,
                            backgroundColor: '#10b981',
                            borderColor: '#10b981',
                            borderWidth: 2
                        },
                        {
                            label: 'No Renovadas',
                            data: noRenovadas,
                            backgroundColor: '#ef4444',
                            borderColor: '#ef4444',
                            borderWidth: 2
                        },
                        {
                            label: 'Tasa de Renovación (%)',
                            data: tasasRenovacion,
                            type: 'line',
                            borderColor: '#3b82f6',
                            backgroundColor: 'rgba(59, 130, 246, 0.1)',
                            borderWidth: 3,
                            tension: 0.4,
                            fill: false,
                            pointBackgroundColor: '#3b82f6',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 2,
                            pointRadius: 6,
                            yAxisID: 'y1'
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    interaction: {
                        mode: 'index',
                        intersect: false
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: 'Tasa de Renovación de Membresías - Últimos 12 Meses',
                            font: {
                                size: 16,
                                weight: 'bold'
                            },
                            padding: { bottom: 20 }
                        },
                        legend: {
                            position: 'top',
                            labels: {
                                font: { size: 14 },
                                padding: 20,
                                usePointStyle: true
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.7)',
                            padding: 12,
                            titleFont: { size: 14 },
                            bodyFont: { size: 13 },
                            cornerRadius: 6,
                            callbacks: {
                                afterBody: function(context) {
                                    const index = context[0].dataIndex;
                                    const total = totalVencidas[index];
                                    const tasa = tasasRenovacion[index];
                                    return '\nTotal Vencidas: ' + total + '\nTasa: ' + tasa.toFixed(2) + '%';
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            type: 'linear',
                            display: true,
                            position: 'left',
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Cantidad de Membresías'
                            },
                            ticks: {
                                stepSize: 1
                            }
                        },
                        y1: {
                            type: 'linear',
                            display: true,
                            position: 'right',
                            beginAtZero: true,
                            max: 100,
                            title: {
                                display: true,
                                text: 'Tasa de Renovación (%)'
                            },
                            grid: {
                                drawOnChartArea: false
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

        document.addEventListener('DOMContentLoaded', cargarDatosTasaRenovacion);

        window.addEventListener('resize', function() {
            if (tasaRenovacionChartInstance) {
                tasaRenovacionChartInstance.resize();
            }
        });
    </script>
</div>
</body>
</html>