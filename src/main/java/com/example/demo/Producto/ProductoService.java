package com.example.demo.Producto;

import java.util.List;

public interface ProductoService {
    List<Producto> listarProductos();
    List<Producto> listarProductosInactivos();
    List<Producto> listarTodosProductos();
    List<Producto> listarProductosPorTipo(Integer idTipo);  // 🆕 AGREGA este método
    Producto obtenerProductoPorId(int id);
    void crearProducto(Producto producto);
    void actualizarProducto(Producto producto);
    void desactivarProducto(Integer id);
    void reactivarProducto(Integer id);
}