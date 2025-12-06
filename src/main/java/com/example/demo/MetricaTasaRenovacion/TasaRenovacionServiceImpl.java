package com.example.demo.MetricaTasaRenovacion;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class TasaRenovacionServiceImpl implements TasaRenovacionService {

    private final TasaRenovacionDAO tasaRenovacionDAO;

    public TasaRenovacionServiceImpl(TasaRenovacionDAO tasaRenovacionDAO) {
        this.tasaRenovacionDAO = tasaRenovacionDAO;
    }

    @Override
    public List<Map<String, Object>> obtenerTasaRenovacion() {
        return tasaRenovacionDAO.obtenerTasaRenovacion();
    }
}