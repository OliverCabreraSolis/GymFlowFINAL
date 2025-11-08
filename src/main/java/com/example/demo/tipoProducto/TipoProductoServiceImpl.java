package com.example.demo.tipoProducto;

import  java.util.List;
import org.springframework.stereotype.Service;

@Service
public class TipoProductoServiceImpl implements TipoProductoService{
    private final TipoProductoDAO tipoProductoDAO;

    public TipoProductoServiceImpl(TipoProductoDAO tipoProductoDAO) {
        this.tipoProductoDAO = tipoProductoDAO;
    }

    @Override
    public List<TipoProducto> listarTipoProducto(){
        return tipoProductoDAO.listarTipoProducto();
    }
    @Override
    public TipoProducto obtenerTipoProductoporId(int id) {
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
    public void eliminarTipoProducto(int id) {
        tipoProductoDAO.eliminarTipoProducto(id);
    }
}