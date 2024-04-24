package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Lote;

public interface ILoteDAO {
int registrarLote(Lote c);
int modificarLote(Lote c);
int eliminarLote(int nro_lote);
Lote buscarLote(int nro_lote);
ArrayList<Lote> listadoLote();
}
