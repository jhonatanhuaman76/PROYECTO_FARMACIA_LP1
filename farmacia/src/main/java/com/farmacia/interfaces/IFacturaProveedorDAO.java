package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.FacturaProveedor;

public interface IFacturaProveedorDAO {
	
int registrarFacturaProveedor(FacturaProveedor c);
int modificarFacturaProveedor(FacturaProveedor c);
int eliminarFacturaProveedor(int cod_FacturaProveedor);
FacturaProveedor buscarFacturaProveedor(int cod_factura);
ArrayList<FacturaProveedor> listadoFacturaProveedor();

}
