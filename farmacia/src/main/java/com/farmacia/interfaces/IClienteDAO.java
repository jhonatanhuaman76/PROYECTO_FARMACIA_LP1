package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Cliente;

public interface IClienteDAO {
int registrarCliente(Cliente c);
int modificarCliente(Cliente c);
int eliminarCliente(int cod_cli);
Cliente buscarCliente(int cod_cli);
ArrayList<Cliente> listadoCliente();
}
