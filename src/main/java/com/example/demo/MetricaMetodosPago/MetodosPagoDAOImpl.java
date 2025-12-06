package com.example.demo.MetricaMetodosPago;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class MetodosPagoDAOImpl implements MetodosPagoDAO {

    private final JdbcTemplate jdbcTemplate;

    public MetodosPagoDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Map<String, Object>> obtenerDistribucionMetodosPago() {
        String sql = """
            SELECT 
                metodo_pago AS METODO,
                COUNT(*) AS CANTIDAD,
                SUM(total) AS MONTO_TOTAL,
                ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS PORCENTAJE
            FROM pago
            WHERE metodo_pago IS NOT NULL
            GROUP BY metodo_pago
            ORDER BY CANTIDAD DESC
            """;

        return jdbcTemplate.queryForList(sql);
    }
}