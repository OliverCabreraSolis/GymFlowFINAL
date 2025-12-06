package com.example.demo.Membresia;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MembresiaServiceImpl implements MembresiaService {

    private final MembresiaDAO membresiaDAO;

    public MembresiaServiceImpl(MembresiaDAO membresiaDAO) {
        this.membresiaDAO = membresiaDAO;
    }

    @Override
    public List<Membresia> listarMembresias() {
        return membresiaDAO.listarMembresias();
    }

    @Override
    public List<Membresia> listarMembresiasActivas() {
        return membresiaDAO.listarMembresiasActivas();
    }

    @Override
    public List<Membresia> listarMembresiasCanceladas() {
        return membresiaDAO.listarMembresiasCanceladas();
    }

    @Override
    public List<Membresia> listarTodasMembresias() {
        return membresiaDAO.listarTodasMembresias();
    }

    @Override
    public Membresia obtenerMembresiaPorId(int id) {
        return membresiaDAO.obtenerMembresiaPorId(id);
    }

    @Override
    public void crearMembresia(Membresia membresia) {
        membresiaDAO.crearMembresia(membresia);
    }

    @Override
    public void actualizarMembresia(Membresia membresia) {
        membresiaDAO.actualizarMembresia(membresia);
    }

    @Override
    public void cancelarMembresia(Integer id) {
        membresiaDAO.cancelarMembresia(id);
    }

    @Override
    public void reactivarMembresia(Integer id) {
        membresiaDAO.reactivarMembresia(id);
    }
}