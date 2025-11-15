package com.example.demo.Producto;

import java.util.List;

public interface ProductoDAO {
    List<Producto> listarProducto();

    Producto obtenerProductoPorId(Integer id);
    void crearProducto(Producto producto);
    void actualizarProducto(Producto producto);

    //Soft delete
    void desactivarProducto(Integer id);
}
