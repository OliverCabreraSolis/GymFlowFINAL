package com.example.demo.Membresia;

import java.util.List;

public interface MembresiaService {
    List<Membresia> listarMembresias();
    List<Membresia> listarMembresiasActivas();
    List<Membresia> listarMembresiasCanceladas();
    List<Membresia> listarTodasMembresias();
    Membresia obtenerMembresiaPorId(int id);
    void crearMembresia(Membresia membresia);
    void actualizarMembresia(Membresia membresia);
    void cancelarMembresia(Integer id);
    void reactivarMembresia(Integer id);
}