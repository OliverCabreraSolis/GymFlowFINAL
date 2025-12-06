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
        let datosGrafico = null;

        // Colores para los métodos de pago
        const coloresMetodos = {
            'EFECTIVO': '#10b981',
            'TARJETA': '#3b82f6',
            'TRANSFERENCIA': '#8b5cf6',
            'YAPE': '#f59e0b',
            'PLIN': '#ef4444'
        };

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

        // Función principal para cargar datos
        async function cargarDatosMetodosPago() {
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
                console.log('Datos recibidos del backend:', datos);

                showElement('chartLoading', false);

                if (!datos || datos.length === 0) {
                    showElement('chartNoData', true);
                    return;
                }

                datosGrafico = datos;
                mostrarEstadisticas(datos);
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

            let totalTransacciones = 0;
            let totalMonto = 0;
            let metodosDigitales = 0;

            for (let i = 0; i < datos.length; i++) {
                const item = datos[i];
                const cantidad = parseInt(item.CANTIDAD) || 0;
                const monto = parseFloat(item.MONTO_TOTAL) || 0;

                totalTransacciones += cantidad;
                totalMonto += monto;

                const metodo = item.METODO;
                if (metodo === 'TARJETA' || metodo === 'TRANSFERENCIA' || metodo === 'YAPE' || metodo === 'PLIN') {
                    metodosDigitales += cantidad;
                }
            }

            const porcentajeDigital = totalTransacciones > 0 ?
                Math.round((metodosDigitales / totalTransacciones) * 100) : 0;

            const estadisticas = [
                {
                    label: 'Total Transacciones',
                    value: totalTransacciones,
                    icon: 'fa-receipt',
                    color: '#3b82f6'
                },
                {
                    label: 'Monto Total',
                    value: 'S/ ' + totalMonto.toFixed(2),
                    icon: 'fa-money-bill-wave',
                    color: '#10b981'
                },
                {
                    label: 'Métodos Digitales',
                    value: metodosDigitales,
                    icon: 'fa-mobile-alt',
                    color: '#8b5cf6'
                },
                {
                    label: '% Digital',
                    value: porcentajeDigital + '%',
                    icon: 'fa-chart-line',
                    color: '#f59e0b'
                }
            ];

            for (let i = 0; i < estadisticas.length; i++) {
                const stat = estadisticas[i];
                const card = document.createElement('div');
                card.className = 'stat-card';
                card.innerHTML = '<i class="fas ' + stat.icon + ' fa-2x" style="color: ' + stat.color + '; margin-bottom: 10px;"></i>' +
                    '<div class="stat-value">' + stat.value + '</div>' +
                    '<div class="stat-label">' + stat.label + '</div>';
                container.appendChild(card);
            }

            container.style.display = 'grid';
        }

        // Función para cambiar tipo de gráfico
        function cambiarTipoGrafico(tipo) {
            tipoGraficoActual = tipo;

            const botones = document.querySelectorAll('.chart-btn');
            for (let i = 0; i < botones.length; i++) {
                botones[i].classList.remove('active');
            }

            if (event && event.target) {
                const botonClickeado = event.target.closest('.chart-btn');
                if (botonClickeado) {
                    botonClickeado.classList.add('active');
                }
            }

            if (datosGrafico) {
                renderizarGrafico(datosGrafico);
            }
        }

        // Función para renderizar el gráfico
        function renderizarGrafico(datos) {
            const ctx = document.getElementById('metodosPagoChart').getContext('2d');

            // Preparar arrays de datos usando bucle for (como en el ejemplo que funciona)
            const labels = [];
            const valores = [];
            const porcentajes = [];
            const montos = [];
            const colores = [];

            for (let i = 0; i < datos.length; i++) {
                const item = datos[i];

                const metodo = item.METODO || '';
                const cantidad = parseInt(item.CANTIDAD) || 0;
                const porcentaje = parseFloat(item.PORCENTAJE) || 0;
                const monto = parseFloat(item.MONTO_TOTAL) || 0;
                const color = coloresMetodos[metodo] || '#6b7280';

                labels.push(metodo);
                valores.push(cantidad);
                porcentajes.push(porcentaje);
                montos.push(monto);
                colores.push(color);
            }

            console.log('=== DATOS PROCESADOS ===');
            console.log('Labels:', labels);
            console.log('Valores:', valores);
            console.log('Porcentajes:', porcentajes);
            console.log('Montos:', montos);

            // Destruir gráfico anterior si existe
            if (metodosPagoChartInstance) {
                metodosPagoChartInstance.destroy();
            }

            // Crear nuevo gráfico
            metodosPagoChartInstance = new Chart(ctx, {
                type: tipoGraficoActual === 'pie' ? 'pie' : 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Cantidad de Transacciones',
                        data: valores,
                        backgroundColor: colores,
                        borderColor: '#fff',
                        borderWidth: 2,
                        hoverOffset: tipoGraficoActual === 'pie' ? 15 : 0
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: tipoGraficoActual === 'pie' ?
                                'Distribución de Métodos de Pago' :
                                'Métodos de Pago - Cantidad de Transacciones',
                            font: {
                                size: 16,
                                weight: 'bold'
                            },
                            padding: { bottom: 20 }
                        },
                        legend: {
                            position: 'right',
                            labels: {
                                font: { size: 14 },
                                padding: 20,
                                generateLabels: function(chart) {
                                    const data = chart.data;
                                    const resultado = [];

                                    if (data.labels.length && data.datasets.length) {
                                        for (let i = 0; i < data.labels.length; i++) {
                                            const label = labels[i];
                                            const cantidad = valores[i];
                                            const porcentaje = porcentajes[i].toFixed(2);
                                            const monto = montos[i].toFixed(2);

                                            resultado.push({
                                                text: label + ': ' + cantidad + ' (' + porcentaje + '%) - S/ ' + monto,
                                                fillStyle: colores[i],
                                                strokeStyle: '#fff',
                                                lineWidth: 2,
                                                hidden: false,
                                                index: i
                                            });
                                        }
                                    }

                                    return resultado;
                                }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const idx = context.dataIndex;
                                    const label = labels[idx];
                                    const cantidad = valores[idx];
                                    const porcentaje = porcentajes[idx].toFixed(2);
                                    const monto = montos[idx].toFixed(2);

                                    return label + ': ' + cantidad + ' transacciones (' + porcentaje + '%) - S/ ' + monto;
                                }
                            }
                        }
                    },
                    scales: tipoGraficoActual === 'bar' ? {
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
                    } : undefined
                }
            });
        }

        // Cargar datos al iniciar
        document.addEventListener('DOMContentLoaded', cargarDatosMetodosPago);

        // Redimensionar gráfico
        window.addEventListener('resize', function() {
            if (metodosPagoChartInstance) {
                metodosPagoChartInstance.resize();
            }
        });
    </script>
</div>
</body>
</html>