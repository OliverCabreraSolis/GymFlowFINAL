package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

@Repository
public class EvolucionSuscripcionesDAOImpl implements EvolucionSuscripcionesDAO {

    private final JdbcTemplate jdbcTemplate;

    public EvolucionSuscripcionesDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Map<String, Object>> obtenerDatosEvolucionSuscripciones() {
        String sql = """
        SELECT 
            YEAR(fecha_inicio) AS anio,
            MONTH(fecha_inicio) AS mes,
            COUNT(*) AS nuevas_membresias,
            SUM(CASE 
                WHEN estado = 'CANCELADA' THEN 1 
                ELSE 0 
            END) AS bajas,
            (COUNT(*) - SUM(CASE 
                WHEN estado = 'CANCELADA' THEN 1 
                ELSE 0 
            END)) AS crecimiento_neto
        FROM membresia
        WHERE fecha_inicio >= DATEADD('MONTH', -12, CURRENT_DATE)
        GROUP BY YEAR(fecha_inicio), MONTH(fecha_inicio)
        ORDER BY anio, mes
        """;

        return jdbcTemplate.queryForList(sql);
    }
}