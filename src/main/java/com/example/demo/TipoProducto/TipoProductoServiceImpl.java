package com.example.demo.TipoProducto;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class TipoProductoServiceImpl implements TipoProductoService {

    private final TipoProductoDAO tipoProductoDAO;

    public TipoProductoServiceImpl(TipoProductoDAO tipoProductoDAO) {
        this.tipoProductoDAO = tipoProductoDAO;
    }

    @Override
    public List<TipoProducto> listarTipoProducto() {
        return tipoProductoDAO.listarTipoProducto();
    }

    @Override
    public List<TipoProducto> listarTipoProductoInactivos() {
        return tipoProductoDAO.listarTipoProductoInactivos();
    }

    @Override
    public List<TipoProducto> listarTodosTipoProducto() {
        return tipoProductoDAO.listarTodosTipoProducto();
    }

    @Override
    public TipoProducto obtenerTipoProductoPorId(int id) {
        return tipoProductoDAO.obtenerTipoProductoporId(id);
    }

    @Override
    public void crearTipoProducto(TipoProducto tipoProducto) {
        tipoProductoDAO.crearTipoProducto(tipoProducto);
    }

    @Override
    public void actualizarTipoProducto(TipoProducto tipoProducto) {
        tipoProductoDAO.actualizarTipoProducto(tipoProducto);
    }

    @Override
    public void desactivarTipoProducto(Integer id) {
        tipoProductoDAO.desactivarTipoProducto(id);
    }

    @Override
    public void reactivarTipoProducto(Integer id) {
        tipoProductoDAO.reactivarTipoProducto(id);
    }
}