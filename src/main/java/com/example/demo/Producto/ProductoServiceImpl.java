package com.example.demo.Producto;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoDAO productoDAO;

    public ProductoServiceImpl(ProductoDAO productoDAO) {
        this.productoDAO = productoDAO;
    }

    @Override
    public List<Producto> listarProductos() {
        return productoDAO.listarProductos();
    }

    @Override
    public List<Producto> listarProductosInactivos() {
        return productoDAO.listarProductosInactivos();
    }

    @Override
    public List<Producto> listarTodosProductos() {
        return productoDAO.listarTodosProductos();
    }

    // 🆕 AGREGA esta implementación del nuevo método
    @Override
    public List<Producto> listarProductosPorTipo(Integer idTipo) {
        return productoDAO.listarProductosPorTipo(idTipo);
    }

    @Override
    public Producto obtenerProductoPorId(int id) {
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
        productoDAO.desactivarProducto(id);
    }

    @Override
    public void reactivarProducto(Integer id) {
        productoDAO.reactivarProducto(id);
    }
}