package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Marca;

public interface IMarcaDAO {
int registrarMarca(Marca c);
int modificarMarca(Marca c);
int eliminarMarca(int cod_marca);
Marca buscarMarca(int cod_marca);
ArrayList<Marca> listadoMarca();
}
