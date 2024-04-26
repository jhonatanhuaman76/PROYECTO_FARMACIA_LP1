package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Boleta;

public interface IBoletaDAO {
int registrarBoleta(Boleta b);
int modificarBoleta(Boleta b);
int eliminarBoleta(int cod_boleta);
Boleta buscarBoleta(int cod_boleta);
ArrayList<Boleta> listadoBoleta();
}
