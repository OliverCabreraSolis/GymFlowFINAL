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

        <!-- Gráfico -->
        <section class="chart-section">
            <div class="chart-container">
                <canvas id="evolucionChart" width="400" height="200"></canvas>
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
        // Función para cargar los datos del backend
        async function cargarDatosEvolucion() {
            try {
                const response = await fetch('${pageContext.request.contextPath}/api/metricas/evolucion-suscripciones');
                const datos = await response.json();

                renderizarGrafico(datos);
            } catch (error) {
                console.error('Error cargando datos:', error);
                // Mostrar datos de ejemplo si hay error
                mostrarDatosEjemplo();
            }
        }

        // Función para renderizar el gráfico
        // Función para renderizar el gráfico
        function renderizarGrafico(datos) {
            const ctx = document.getElementById('evolucionChart').getContext('2d');

            console.log('Datos recibidos para gráfico:', datos);

            // Procesar datos para el gráfico - USAR MAYÚSCULAS para coincidir con el JSON
            const labels = datos.map(item => {
                const meses = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
                const mesNumero = parseInt(item.MES) || 1; // MAYÚSCULA
                return `${meses[mesNumero - 1]} ${item.ANIO}`; // MAYÚSCULA
            });

            const nuevasMembresias = datos.map(item => item.NUEVAS_MEMBRESIAS || 0); // MAYÚSCULA
            const bajas = datos.map(item => item.BAJAS || 0); // MAYÚSCULA
            const crecimientoNeto = datos.map(item => item.CRECIMIENTO_NETO || 0); // MAYÚSCULA

            console.log('Labels procesados:', labels);
            console.log('Nuevas membresías:', nuevasMembresias);
            console.log('Bajas:', bajas);
            console.log('Crecimiento neto:', crecimientoNeto);

            // Destruir gráfico anterior si existe
            if (window.evolucionChartInstance) {
                window.evolucionChartInstance.destroy();
            }

            window.evolucionChartInstance = new Chart(ctx, {
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
                            tension: 0.4,
                            fill: true
                        },
                        {
                            label: 'Bajas',
                            data: bajas,
                            borderColor: '#ef4444',
                            backgroundColor: 'rgba(239, 68, 68, 0.1)',
                            borderWidth: 3,
                            tension: 0.4,
                            fill: true
                        },
                        {
                            label: 'Crecimiento Neto',
                            data: crecimientoNeto,
                            borderColor: '#3b82f6',
                            backgroundColor: 'rgba(59, 130, 246, 0.1)',
                            borderWidth: 3,
                            tension: 0.4,
                            fill: true
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: 'Evolución de Suscripciones - Últimos 12 Meses',
                            font: {
                                size: 16,
                                weight: 'bold'
                            }
                        },
                        legend: {
                            position: 'top',
                            labels: {
                                font: {
                                    size: 12
                                }
                            }
                        },
                        tooltip: {
                            mode: 'index',
                            intersect: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Cantidad de Membresías',
                                font: {
                                    weight: 'bold'
                                }
                            },
                            ticks: {
                                stepSize: 1
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Periodo',
                                font: {
                                    weight: 'bold'
                                }
                            }
                        }
                    },
                    interaction: {
                        intersect: false,
                        mode: 'nearest'
                    }
                }
            });

            console.log('Gráfico renderizado exitosamente');
        }

        // Función de respaldo con datos de ejemplo
        function mostrarDatosEjemplo() {
            const datosEjemplo = [
                { anio: 2024, mes: 1, nuevas_membresias: 15, bajas: 5, crecimiento_neto: 10 },
                { anio: 2024, mes: 2, nuevas_membresias: 18, bajas: 7, crecimiento_neto: 11 },
                { anio: 2024, mes: 3, nuevas_membresias: 22, bajas: 8, crecimiento_neto: 14 },
                { anio: 2024, mes: 4, nuevas_membresias: 20, bajas: 6, crecimiento_neto: 14 },
                { anio: 2024, mes: 5, nuevas_membresias: 25, bajas: 10, crecimiento_neto: 15 },
                { anio: 2024, mes: 6, nuevas_membresias: 30, bajas: 12, crecimiento_neto: 18 }
            ];

            renderizarGrafico(datosEjemplo);

            // Mostrar mensaje de advertencia
            const chartContainer = document.querySelector('.chart-container');
            chartContainer.innerHTML = `
            <div class="alert alert-warning">
                <i class="fas fa-exclamation-triangle"></i>
                Se están mostrando datos de ejemplo. Verifique la conexión con el servidor.
            </div>
            <canvas id="evolucionChart" width="400" height="200"></canvas>
        `;
        }

        // Cargar los datos cuando la página esté lista
        document.addEventListener('DOMContentLoaded', cargarDatosEvolucion);
    </script>

    <style>
        .chart-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .chart-container {
            position: relative;
            height: 400px;
            width: 100%;
        }

        .alert {
            padding: 10px 15px;
            background: #fef3cd;
            border: 1px solid #ffeaa7;
            border-radius: 4px;
            margin-bottom: 15px;
            color: #856404;
        }
    </style>
</div>
</body>
</html>