package com.example.demo.Producto;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoDAO productoDAO;

    // Inyeccion por constructor
    public ProductoServiceImpl(ProductoDAO productoDAO) {
        this.productoDAO = productoDAO;
    }

    @Override
    public List<Producto> listarProducto() {
        return productoDAO.listarProducto();
    }

    @Override
    public Producto obtenerProductoPorId(Integer id) {
        return productoDAO.obtenerProductoPorId(id);
    }

    @Override
    public void crearProducto(Producto producto) {
        productoDAO.crearProducto(producto);
    }

    @Override
    public void actualizarProducto(Producto producto) {
        productoDAO.actualizarProducto(producto);
    }

    @Override
    public void desactivarProducto(Integer id) {
        productoDAO.desactivarProducto(id); // Soft delete: pone disponible = FALSE
    }
}
