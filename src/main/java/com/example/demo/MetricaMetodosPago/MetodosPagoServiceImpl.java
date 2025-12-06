package com.example.demo.MetricaMetodosPago;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class MetodosPagoServiceImpl implements MetodosPagoService {

    private final MetodosPagoDAO metodosPagoDAO;

    public MetodosPagoServiceImpl(MetodosPagoDAO metodosPagoDAO) {
        this.metodosPagoDAO = metodosPagoDAO;
    }

    @Override
    public List<Map<String, Object>> obtenerDistribucionMetodosPago() {
        return metodosPagoDAO.obtenerDistribucionMetodosPago();
    }
}