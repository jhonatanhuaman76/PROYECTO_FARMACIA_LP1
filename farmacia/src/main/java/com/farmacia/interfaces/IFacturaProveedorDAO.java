package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.FacturaProveedor;

public interface IFacturaProveedorDAO {
int registrarFacturaProveedor(FacturaProveedor c);
FacturaProveedor buscarFacturaProveedor(int cod_factura);
ArrayList<FacturaProveedor> listadoFacturaProveedor();
}
