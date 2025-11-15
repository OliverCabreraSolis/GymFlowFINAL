package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

@Repository
public class EvolucionSuscripcionesDAOImpl implements EvolucionSuscripcionesDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Object[]> altasPorMes() {
        String sql = """
            SELECT MONTH(fecha_inicio) AS mes, COUNT(*) AS total
            FROM usuario
            WHERE rol = 'CLIENTE'
            GROUP BY MONTH(fecha_inicio)
            ORDER BY mes
        """;

        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new Object[]{rs.getInt("mes"), rs.getInt("total")});
    }

    @Override
    public List<Object[]> bajasPorMes() {
        String sql = """
            SELECT MONTH(fecha_fin) AS mes, COUNT(*) AS total
            FROM membresia
            WHERE estado = 'CANCELADA'
            GROUP BY MONTH(fecha_fin)
            ORDER BY mes
        """;

        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new Object[]{rs.getInt("mes"), rs.getInt("total")});
    }
}

