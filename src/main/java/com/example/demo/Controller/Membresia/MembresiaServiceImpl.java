package com.example.demo.Controller.Membresia;

import java.util.List;
import org.springframework.stereotype.Service;

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
    public List<Membresia> listarMembresiasInactivas() {
        return membresiaDAO.listarMembresiasInactivas();
    }

    @Override
    public List<Membresia> listarTodasMembresias() {
        return membresiaDAO.listarTodasMembresias();
    }

    @Override
    public List<Membresia> listarMembresiasPorUsuario(Integer idUsuario) {
        return membresiaDAO.listarMembresiasPorUsuario(idUsuario);
    }

    @Override
    public List<Membresia> listarMembresiasPorPlan(Integer idPlan) {
        return membresiaDAO.listarMembresiasPorPlan(idPlan);
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
    public void desactivarMembresia(Integer id) {
        membresiaDAO.desactivarMembresia(id);
    }

    @Override
    public void reactivarMembresia(Integer id) {
        membresiaDAO.reactivarMembresia(id);
    }

    @Override
    public void cancelarMembresia(Integer id) {
        membresiaDAO.cancelarMembresia(id);
    }

    @Override
    public void activarMembresia(Integer id) {
        membresiaDAO.activarMembresia(id);
    }
}