package com.example.demo.Controller.Membresia;

import java.util.List;

public interface MembresiaService {
    List<Membresia> listarMembresias();
    List<Membresia> listarMembresiasInactivas();
    List<Membresia> listarTodasMembresias();
    List<Membresia> listarMembresiasPorUsuario(Integer idUsuario);
    List<Membresia> listarMembresiasPorPlan(Integer idPlan);
    Membresia obtenerMembresiaPorId(int id);
    void crearMembresia(Membresia membresia);
    void actualizarMembresia(Membresia membresia);
    void desactivarMembresia(Integer id);
    void reactivarMembresia(Integer id);
    void cancelarMembresia(Integer id);
    void activarMembresia(Integer id);
}