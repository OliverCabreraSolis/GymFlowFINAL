package com.example.demo.TipoProducto;

import java.util.List;

public interface TipoProductoService {

    List<TipoProducto> listarTipoProducto();

    TipoProducto obtenerTipoProductoPorId(int id);

    void crearTipoProducto(TipoProducto tipoProducto);

    void actualizarTipoProducto(TipoProducto tipoProducto);

    void desactivarTipoProducto(Integer id);
}
