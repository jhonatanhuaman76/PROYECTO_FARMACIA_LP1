package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Categoria;

public interface ICategoriaDAO {
int registrarCategoria(Categoria c);
int modificarCategoria(Categoria c);
int eliminarCategoria(int num_cate);
Categoria buscarCategoria(int num_cate);
ArrayList<Categoria> listadoCategoria();
}
