package com.farmacia.interfaces;

import java.util.ArrayList;

import com.farmacia.entidad.Empleado;

public interface IEmpleadoDAO {
int registrarEmpleado(Empleado c);
int modificarEmpleado(Empleado c);
int eliminarEmpleado(int cod_emp);
Empleado buscarEmpleado(int cod_emp);
ArrayList<Empleado> listadoEmpleado();
ArrayList<Empleado> reporteGeneralEmpleado();
}
