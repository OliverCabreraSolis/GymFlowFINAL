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
            YEAR(fecha_inicio) AS ANIO,
            MONTH(fecha_inicio) AS MES,
            COUNT(*) AS NUEVAS_MEMBRESIAS,
            SUM(CASE 
                WHEN estado = 'CANCELADA' THEN 1 
                ELSE 0 
            END) AS BAJAS,
            (COUNT(*) - SUM(CASE 
                WHEN estado = 'CANCELADA' THEN 1 
                ELSE 0 
            END)) AS CRECIMIENTO_NETO
        FROM membresia
        WHERE fecha_inicio >= DATEADD('MONTH', -24, CURRENT_DATE)
        GROUP BY YEAR(fecha_inicio), MONTH(fecha_inicio)
        ORDER BY ANIO, MES
        """;

        return jdbcTemplate.queryForList(sql);
    }
}
