package com.example.demo.MetricaTasaRenovacion;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class TasaRenovacionDAOImpl implements TasaRenovacionDAO {

    private final JdbcTemplate jdbcTemplate;

    public TasaRenovacionDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Map<String, Object>> obtenerTasaRenovacion() {
        String sql = """
            WITH membresias_vencidas AS (
                SELECT 
                    EXTRACT(MONTH FROM fecha_fin) AS MES,
                    EXTRACT(YEAR FROM fecha_fin) AS ANIO,
                    id_usuario,
                    fecha_fin,
                    MAX(id_membresia) AS id_membresia_max
                FROM membresia
                WHERE fecha_fin < CURRENT_DATE
                    AND estado IN ('VENCIDA', 'ACTIVA')  -- Cambiado según tu schema
                GROUP BY EXTRACT(MONTH FROM fecha_fin), EXTRACT(YEAR FROM fecha_fin), 
                         id_usuario, fecha_fin
            ),
            renovaciones AS (
                SELECT 
                    v.MES,
                    v.ANIO,
                    v.id_usuario,
                    CASE 
                        WHEN EXISTS (
                            SELECT 1 
                            FROM membresia m2
                            WHERE m2.id_usuario = v.id_usuario
                                AND m2.fecha_inicio BETWEEN v.fecha_fin 
                                    AND DATEADD('DAY', 7, v.fecha_fin)
                                AND m2.id_membresia != v.id_membresia_max
                        ) THEN 1 
                        ELSE 0 
                    END AS renovado
                FROM membresias_vencidas v
            )
            SELECT 
                MES,
                ANIO,
                COUNT(*) AS TOTAL_VENCIDAS,
                SUM(renovado) AS RENOVADAS,
                COUNT(*) - SUM(renovado) AS NO_RENOVADAS,
                ROUND((SUM(renovado) * 100.0 / NULLIF(COUNT(*), 0)), 2) AS TASA_RENOVACION
            FROM renovaciones
            GROUP BY ANIO, MES
            ORDER BY ANIO DESC, MES DESC
            LIMIT 12
            """;

        return jdbcTemplate.queryForList(sql);
    }
}