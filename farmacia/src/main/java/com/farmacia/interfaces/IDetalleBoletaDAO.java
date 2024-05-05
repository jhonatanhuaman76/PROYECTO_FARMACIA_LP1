package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.DetalleBoleta;

public interface IDetalleBoletaDAO {
int registrarDetalleBoleta(DetalleBoleta c);
int modificarDetalleBoleta(DetalleBoleta c);
int eliminarDetalleBoleta(int cod_boleta, int cod_lote);
DetalleBoleta buscarDetalleBoleta(int cod_boleta, int cod_lote);
ArrayList<DetalleBoleta> listadoDetalleBoleta();
ArrayList<DetalleBoleta> listarDetalleBoletaXCodigoBoleta(int cod_boleta);
}
