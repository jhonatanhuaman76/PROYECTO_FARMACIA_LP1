package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Boleta;

public interface IBoletaDAO {
int registrarBoleta(Boleta b);
Boleta buscarBoleta(int cod_boleta);
ArrayList<Boleta> listadoBoleta();
}
