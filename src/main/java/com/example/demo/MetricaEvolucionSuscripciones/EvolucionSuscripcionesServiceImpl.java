package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.example.demo.MetricaEvolucionSuscripciones.EvolucionSuscripcionesDAO;

@Service
public class EvolucionSuscripcionesServiceImpl implements EvolucionSuscripcionesService {

    private final EvolucionSuscripcionesDAO evolucionSuscripcionesDAO;

    public EvolucionSuscripcionesServiceImpl(EvolucionSuscripcionesDAO evolucionSuscripcionesDAO) {
        this.evolucionSuscripcionesDAO = evolucionSuscripcionesDAO;
    }

    @Override
    public List<Map<String, Object>> obtenerEvolucionSuscripciones() {
        return evolucionSuscripcionesDAO.obtenerDatosEvolucionSuscripciones();
    }
}
