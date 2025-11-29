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
                TO_CHAR(fecha_inicio, 'YYYY-MM') as periodo,
                EXTRACT(YEAR FROM fecha_inicio) as anio,
                EXTRACT(MONTH FROM fecha_inicio) as mes,
                COUNT(*) as nuevas_membresias,
                SUM(CASE WHEN estado = 'CANCELADA' OR fecha_fin < CURRENT_DATE THEN 1 ELSE 0 END) as bajas,
                (COUNT(*) - SUM(CASE WHEN estado = 'CANCELADA' OR fecha_fin < CURRENT_DATE THEN 1 ELSE 0 END)) as crecimiento_neto
            FROM membresia 
            WHERE fecha_inicio >= CURRENT_DATE - INTERVAL '12' MONTH
            GROUP BY EXTRACT(YEAR FROM fecha_inicio), EXTRACT(MONTH FROM fecha_inicio), TO_CHAR(fecha_inicio, 'YYYY-MM')
            ORDER BY anio, mes
            """;

        return jdbcTemplate.queryForList(sql);
    }
}
