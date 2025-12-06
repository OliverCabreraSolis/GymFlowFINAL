package com.example.demo.Controller.Membresia;

import java.util.List;

public interface MembresiaDAO {
    List<Membresia> listarMembresias();                     // Solo disponibles
    List<Membresia> listarMembresiasInactivas();            // Solo inactivas
    List<Membresia> listarTodasMembresias();                // Todas
    List<Membresia> listarMembresiasPorUsuario(Integer idUsuario);  // Por usuario
    List<Membresia> listarMembresiasPorPlan(Integer idPlan);        // Por plan
    Membresia obtenerMembresiaPorId(Integer id);
    void crearMembresia(Membresia membresia);
    void actualizarMembresia(Membresia membresia);
    void desactivarMembresia(Integer id);
    void reactivarMembresia(Integer id);
    void cancelarMembresia(Integer id);
    void activarMembresia(Integer id);
}