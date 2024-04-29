package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.UmProducto;

public interface IUmProductoDAO {
int registrarUmProducto(UmProducto c);
int modificarUmProducto(UmProducto c);
int eliminarUmProducto(int cod_uni, int cod_pro);
UmProducto buscarUmProducto(int cod_uni, int cod_pro);
ArrayList<UmProducto> listadoUmProducto();
ArrayList<UmProducto> listadoUmProductoxCodigoProd(int cod_pro);
}
