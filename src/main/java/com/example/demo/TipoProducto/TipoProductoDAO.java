package com.example.demo.TipoProducto;

import java.util.List;

public interface TipoProductoDAO {

    List<TipoProducto> listarTipoProducto();

    TipoProducto obtenerTipoProductoporId(Integer id);

    void crearTipoProducto(TipoProducto tipoProducto);

    void actualizarTipoProducto(TipoProducto tipoProducto);

    void desactivarTipoProducto(Integer id);
}
