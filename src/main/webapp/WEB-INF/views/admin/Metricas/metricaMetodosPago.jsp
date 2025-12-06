<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GymFlow - Métodos de Pago</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metricaMetPagosStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>💪</text></svg>">
    <style>
        .description-section {
            background: #f8fafc;
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

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .stat-card {
            background: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
        }

        .stat-value {
            font-size: 24px;
            font-weight: bold;
            color: #3b82f6;
            margin: 5px 0;
        }

        .stat-label {
            color: #64748b;
            font-size: 14px;
        }

        .chart-controls {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .chart-btn {
            padding: 8px 16px;
            background: #f1f5f9;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .chart-btn.active {
            background: #3b82f6;
            color: white;
            border-color: #3b82f6;
        }

        .chart-btn:hover {
            background: #e2e8f0;
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
                    <h2>Análisis de Métodos de Pago</h2>
                    <p>Distribución y tendencias de transacciones por tipo de pago</p>
                </div>
            </div>
        </header>

        <!-- Controles del gráfico -->
        <div class="chart-controls">
            <button class="chart-btn active" onclick="cambiarTipoGrafico('pie')">
                <i class="fas fa-chart-pie"></i> Gráfico de Torta
            </button>
            <button class="chart-btn" onclick="cambiarTipoGrafico('bar')">
                <i class="fas fa-chart-bar"></i> Gráfico de Barras
            </button>
        </div>

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
                <canvas id="metodosPagoChart"></canvas>
            </div>
        </section>

        <!-- Estadísticas -->
        <div class="stats-container" id="estadisticas" style="display: none;">
            <!-- Se llena dinámicamente con JavaScript -->
        </div>

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
    </main>

    <!-- Script para el gráfico -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Variables globales
        let metodosPagoChartInstance = null;
        let tipoGraficoActual = 'pie';
        let datosOriginales = [];

        // Colores para los métodos de pago
        const coloresMetodos = {
            'EFECTIVO': '#10b981',      // Verde
            'TARJETA': '#3b82f6',       // Azul
            'TRANSFERENCIA': '#8b5cf6', // Violeta
            'YAPE': '#f59e0b',          // Amarillo
            'PLIN': '#ef4444'           // Rojo
        };

        // Función para mostrar/ocultar elementos
        function showElement(id, show) {
            const element = document.getElementById(id);
            if (element) {
                element.style.display = show ? 'block' : 'none';
            }
        }

        // Función para mostrar error
        function showError(message) {
            const errorElement = document.getElementById('chartError');
            if (errorElement) {
                errorElement.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + message;
                errorElement.style.display = 'block';
            }
        }

        // Función para cambiar tipo de gráfico
        function cambiarTipoGrafico(tipo) {
            tipoGraficoActual = tipo;

            // Actualizar botones
            document.querySelectorAll('.chart-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');

            // Re-renderizar gráfico si ya hay datos
            if (datosOriginales.length > 0) {
                renderizarGrafico(datosOriginales);
            }
        }

        // Función principal para cargar datos
        async function cargarDatosMetodosPago() {
            // Mostrar loading
            showElement('chartLoading', true);
            showElement('chartError', false);
            showElement('chartNoData', false);
            showElement('estadisticas', false);

            try {
                const response = await fetch('${pageContext.request.contextPath}/api/metricas/metodos-pago');

                if (!response.ok) {
                    throw new Error('Error al cargar datos del servidor');
                }

                const datos = await response.json();

                // Ocultar loading
                showElement('chartLoading', false);

                // Verificar si hay datos
                if (!datos || datos.length === 0) {
                    showElement('chartNoData', true);
                    return;
                }

                // Guardar datos originales
                datosOriginales = datos;

                // Mostrar estadísticas
                mostrarEstadisticas(datos);

                // Renderizar gráfico
                renderizarGrafico(datos);

            } catch (error) {
                showElement('chartLoading', false);
                showError('No se pudieron cargar los datos: ' + error.message);
            }
        }

        // Función para mostrar estadísticas
        function mostrarEstadisticas(datos) {
            const container = document.getElementById('estadisticas');
            container.innerHTML = '';
            container.style.display = 'grid';

            // Calcular totales
            let totalTransacciones = 0;
            let totalMonto = 0;
            let metodosDigitales = 0;

            datos.forEach(item => {
                totalTransacciones += parseInt(item.CANTIDAD) || 0;
                totalMonto += parseFloat(item.MONTO_TOTAL) || 0;

                // Contar métodos digitales
                const metodo = item.METODO;
                if (metodo === 'TARJETA' || metodo === 'TRANSFERENCIA' || metodo === 'YAPE' || metodo === 'PLIN') {
                    metodosDigitales += parseInt(item.CANTIDAD) || 0;
                }
            });

            const porcentajeDigital = totalTransacciones > 0 ?
                Math.round((metodosDigitales / totalTransacciones) * 100) : 0;

            // Crear tarjetas de estadísticas
            const estadisticas = [
                { label: 'Total Transacciones', value: totalTransacciones, icon: 'fa-receipt' },
                { label: 'Monto Total', value: 'S/ ' + totalMonto.toFixed(2), icon: 'fa-money-bill-wave' },
                { label: 'Métodos Digitales', value: metodosDigitales, icon: 'fa-mobile-alt' },
                { label: '% Digital', value: porcentajeDigital + '%', icon: 'fa-chart-line' }
            ];

            estadisticas.forEach(stat => {
                const card = document.createElement('div');
                card.className = 'stat-card';
                card.innerHTML = `
                    <i class="fas ${stat.icon} fa-2x" style="color: #3b82f6; margin-bottom: 10px;"></i>
                    <div class="stat-value">${stat.value}</div>
                    <div class="stat-label">${stat.label}</div>
                `;
                container.appendChild(card);
            });
        }

        // Función para renderizar el gráfico
        function renderizarGrafico(datos) {
            const ctx = document.getElementById('metodosPagoChart').getContext('2d');

            // Preparar datos para Chart.js
            const labels = datos.map(item => item.METODO);
            const valores = datos.map(item => parseInt(item.CANTIDAD) || 0);
            const porcentajes = datos.map(item => parseFloat(item.PORCENTAJE) || 0);
            const montos = datos.map(item => 'S/ ' + (parseFloat(item.MONTO_TOTAL) || 0).toFixed(2));
            const colores = labels.map(label => coloresMetodos[label] || '#6b7280');

            // Configuración común
            const configBase = {
                data: {
                    labels: labels,
                    datasets: [{
                        data: valores,
                        backgroundColor: colores,
                        borderColor: '#fff',
                        borderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'right',
                            labels: {
                                font: {
                                    size: 14
                                },
                                padding: 20,
                                generateLabels: function(chart) {
                                    const data = chart.data;
                                    if (data.labels.length && data.datasets.length) {
                                        return data.labels.map((label, i) => {
                                            const value = data.datasets[0].data[i];
                                            const porcentaje = porcentajes[i];
                                            const monto = montos[i];

                                            return {
                                                text: `${label}: ${value} (${porcentaje}%) - ${monto}`,
                                                fillStyle: data.datasets[0].backgroundColor[i],
                                                strokeStyle: data.datasets[0].borderColor,
                                                lineWidth: data.datasets[0].borderWidth,
                                                hidden: false,
                                                index: i
                                            };
                                        });
                                    }
                                    return [];
                                }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const label = context.label || '';
                                    const value = context.raw || 0;
                                    const porcentaje = porcentajes[context.dataIndex] || 0;
                                    const monto = montos[context.dataIndex] || '';
                                    return `${label}: ${value} transacciones (${porcentaje}%) - ${monto}`;
                                }
                            }
                        }
                    }
                }
            };

            // Destruir gráfico anterior si existe
            if (metodosPagoChartInstance) {
                metodosPagoChartInstance.destroy();
            }

            // Crear nuevo gráfico según el tipo seleccionado
            if (tipoGraficoActual === 'pie') {
                metodosPagoChartInstance = new Chart(ctx, {
                    type: 'pie',
                    ...configBase,
                    options: {
                        ...configBase.options,
                        plugins: {
                            ...configBase.options.plugins,
                            title: {
                                display: true,
                                text: 'Distribución de Métodos de Pago',
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                },
                                padding: { bottom: 20 }
                            }
                        }
                    }
                });
            } else {
                metodosPagoChartInstance = new Chart(ctx, {
                    type: 'bar',
                    ...configBase,
                    options: {
                        ...configBase.options,
                        plugins: {
                            ...configBase.options.plugins,
                            title: {
                                display: true,
                                text: 'Métodos de Pago - Cantidad de Transacciones',
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                },
                                padding: { bottom: 20 }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Cantidad de Transacciones'
                                },
                                ticks: {
                                    stepSize: 1
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Método de Pago'
                                }
                            }
                        }
                    }
                });
            }
        }

        // Cargar datos cuando la página esté lista
        document.addEventListener('DOMContentLoaded', cargarDatosMetodosPago);

        // Redimensionar gráfico al cambiar tamaño de ventana
        window.addEventListener('resize', function() {
            if (metodosPagoChartInstance) {
                metodosPagoChartInstance.resize();
            }
        });
    </script>
</div>
</body>
</html>