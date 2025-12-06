package com.example.demo.Membresia;

import java.util.List;

public interface MembresiaDAO {
    List<Membresia> listarMembresias();           // Solo disponibles
    List<Membresia> listarMembresiasActivas();    // Solo activas
    List<Membresia> listarMembresiasCanceladas(); // Solo canceladas
    List<Membresia> listarTodasMembresias();      // Todas
    Membresia obtenerMembresiaPorId(Integer id);
    void crearMembresia(Membresia membresia);
    void actualizarMembresia(Membresia membresia);
    void cancelarMembresia(Integer id);
    void reactivarMembresia(Integer id);
}
