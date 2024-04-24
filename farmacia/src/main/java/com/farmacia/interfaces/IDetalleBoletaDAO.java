package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.DetalleBoleta;

public interface IDetalleBoletaDAO {
int registrarDetalleBoleta(DetalleBoleta c);
DetalleBoleta buscarDetalleBoleta(int cod_boleta, int cod_lote);
ArrayList<DetalleBoleta> listadoDetalleBoleta();
}
