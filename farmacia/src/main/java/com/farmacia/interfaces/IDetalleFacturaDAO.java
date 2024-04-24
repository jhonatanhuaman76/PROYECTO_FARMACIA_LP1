package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.DetalleFactura;

public interface IDetalleFacturaDAO {
int registrarDetalleFactura(DetalleFactura c);
DetalleFactura buscarDetalleFactura(int nro_lote, int nro_factura);
ArrayList<DetalleFactura> listadoDetalleFactura();
}
