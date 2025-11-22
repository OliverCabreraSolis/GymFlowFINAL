package com.example.demo.TipoProducto;

import java.util.List;

public interface TipoProductoDAO {
    List<TipoProducto> listarTipoProducto();           // Solo activos
    List<TipoProducto> listarTipoProductoInactivos();  // Solo inactivos
    List<TipoProducto> listarTodosTipoProducto();      // Todos
    TipoProducto obtenerTipoProductoporId(Integer id);
    void crearTipoProducto(TipoProducto tipoProducto);
    void actualizarTipoProducto(TipoProducto tipoProducto);
    void desactivarTipoProducto(Integer id);
    void reactivarTipoProducto(Integer id);
}