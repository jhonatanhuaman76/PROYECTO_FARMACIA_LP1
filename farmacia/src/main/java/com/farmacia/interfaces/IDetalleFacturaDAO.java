package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.DetalleFactura;

public interface IDetalleFacturaDAO {
int registrarDetalleFactura(DetalleFactura c);
int modificarDetalleFactura(DetalleFactura c);
int eliminarDetalleFactura(int nro_lote, int nrofactura);
DetalleFactura buscarDetalleFactura(int nro_lote, int nro_factura);
ArrayList<DetalleFactura> listadoDetalleFactura();
}
