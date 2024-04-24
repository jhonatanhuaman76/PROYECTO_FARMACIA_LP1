package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Producto;

public interface IProductoDAO {
int registrarProducto(Producto c);
int modificarProducto(Producto c);
int eliminarProducto(int cod_pro);
Producto buscarProducto(int cod_pro);
ArrayList<Producto> listadoProducto();
}
