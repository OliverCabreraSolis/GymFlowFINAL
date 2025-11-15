package com.example.demo.MetricaEvolucionSuscripciones;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EvolucionSuscripcionesServiceImpl implements EvolucionSuscripcionesService {

    @Autowired
    private EvolucionSuscripcionesDAO dao;

    @Override
    public int obtenerAltasMesActual() {
        List<Object[]> altas = dao.altasPorMes();
        return altas.isEmpty() ? 0 : ((Number) altas.get(altas.size() - 1)[1]).intValue();
    }

    @Override
    public int obtenerBajasMesActual() {
        List<Object[]> bajas = dao.bajasPorMes();
        return bajas.isEmpty() ? 0 : ((Number) bajas.get(bajas.size() - 1)[1]).intValue();
    }

    @Override
    public int obtenerCrecimientoNeto() {
        return obtenerAltasMesActual() - obtenerBajasMesActual();
    }

    @Override
    public List<EvolucionSuscripcionesDTO> obtenerComparativo() {
        List<Object[]> altas = dao.altasPorMes();
        List<Object[]> bajas = dao.bajasPorMes();

        List<EvolucionSuscripcionesDTO> resultado = new ArrayList<>();

        for (int i = 0; i < altas.size(); i++) {

            int mes = (int) altas.get(i)[0];
            int alt = ((Number) altas.get(i)[1]).intValue();
            int baj = (i < bajas.size()) ? ((Number) bajas.get(i)[1]).intValue() : 0;

            double total = alt + baj == 0 ? 1 : alt + baj;

            resultado.add(new EvolucionSuscripcionesDTO(
                    obtenerNombreMes(mes),
                    alt,
                    baj,
                    (alt * 100.0) / total,
                    (baj * 100.0) / total
            ));
        }

        return resultado;
    }

    private String obtenerNombreMes(int m) {
        return List.of("Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic").get(m - 1);
    }
}
