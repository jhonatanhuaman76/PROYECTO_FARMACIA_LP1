package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Proveedor;

public interface IProveedorDAO {
int registrarProveedor(Proveedor c);
int modificarProveedor(Proveedor c);
int eliminarProveedor(int cod_prov);
Proveedor buscarProveedor(int cod_prov);
ArrayList<Proveedor> listadoProveedor();
}
