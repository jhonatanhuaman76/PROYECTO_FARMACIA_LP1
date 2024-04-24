package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.UnidadMedida;

public interface IUnidadMedidaDAO {
int registrarUnidadMedida(UnidadMedida c);
int modificarUnidadMedida(UnidadMedida c);
int eliminarUnidadMedida(int cod_uni);
UnidadMedida buscarUnidadMedida(int cod_uni);
ArrayList<UnidadMedida> listadoUnidadMedida();
}
