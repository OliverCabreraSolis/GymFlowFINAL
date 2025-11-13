package com.example.demo.TipoProducto;

import java.util.List;
public interface TipoProductoService{
    List<TipoProducto> listarTipoProducto() ;
    TipoProducto obtenerTipoProductoporId(int id);
    void crearTipoProducto(TipoProducto tipoProducto);
    void actualizarTipoProducto(TipoProducto tipoProducto);
    void eliminarTipoProducto(int id);
}

