package com.farmacia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.ArrayList;

import com.farmacia.entidad.Empleado;
import com.farmacia.interfaces.IEmpleadoDAO;
import com.farmacia.util.MySqlConexion;

public class EmpleadoDAO implements IEmpleadoDAO{

	@Override
	public int registrarEmpleado(Empleado c) {
		//DECLARAR VARIABLE PARA EL RESULTADO
		int r=-1;
		
		//DECLARAR UN OBJETO PARA LA CONEXIÓN
		Connection cone=null;
		
		//DECLARAR OBJETO PARA MANIPULAR EL PROCEDIMIENTO ALMACENADO
		CallableStatement cstm=null;
		
		try {
			//PASO 01 - INVOCAR LA CONEXIÓN
			cone=MySqlConexion.miConexion();
			
			//PASO 02 - PREPARAR CALLABLESTATEMENT
			cstm=cone.prepareCall("{CALL SP_REGISTRAR_EMPLEADO(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setString(1, c.getDni_emp());
			cstm.setString(2, c.getNom_emp());
			cstm.setString(3, c.getApe_emp());
			cstm.setString(4, c.getTelf_emp());
			cstm.setString(5, c.getCorreo_emp());
			cstm.setString(6, c.getDire_emp());
			cstm.setString(7, c.getTipo_usu());
			cstm.setString(8, c.getNom_usu());
			cstm.setString(9, c.getPas_usu());
	
			//COMPROBANDO LO Q TIENE CSTM
			System.out.println("==>"+cstm);
			
			//PASO 04 - EJECUTAMOS CSTM
			r=cstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return r;
	}

	@Override
	public int modificarEmpleado(Empleado c) {
		//DECLARAR VARIABLE PARA EL RESULTADO
		int r=-1;
		
		//DECLARAR UN OBJETO PARA LA CONEXIÓN
		Connection cone=null;
		
		//DECLARAR OBJETO PARA MANIPULAR EL PROCEDIMIENTO ALMACENADO
		CallableStatement cstm=null;
		
		try {
			//PASO 01 - INVOCAR LA CONEXIÓN
			cone=MySqlConexion.miConexion();
			
			//PASO 02 - PREPARAR CALLABLESTATEMENT
			cstm=cone.prepareCall("{CALL SP_MODIFICAR_EMPLEADO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, c.getCod_emp());
			cstm.setString(2, c.getDni_emp());
			cstm.setString(3, c.getNom_emp());
			cstm.setString(4, c.getApe_emp());
			cstm.setString(5, c.getTelf_emp());
			cstm.setString(6, c.getCorreo_emp());
			cstm.setString(7, c.getDire_emp());
			cstm.setString(8, c.getTipo_usu());
			cstm.setString(9, c.getNom_usu());
			cstm.setString(10, c.getPas_usu());

			//COMPROBANDO LO Q TIENE CSTM
			System.out.println("==>"+cstm);
			
			//PASO 04 - EJECUTAMOS CSTM
			r=cstm.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return r;
	}

	@Override
	public int eliminarEmpleado(int cod_emp) {
		//DECLARAR VARIABLE PARA EL RESULTADO
		int r=-1;
		
		//DECLARAR UN OBJETO PARA LA CONEXIÓN
		Connection cone=null;
		
		//DECLARAR OBJETO PARA MANIPULAR EL PROCEDIMIENTO ALMACENADO
		CallableStatement cstm=null;
		
		try {
			//PASO 01 - INVOCAR LA CONEXIÓN
			cone=MySqlConexion.miConexion();
			
			//PASO 02 - PREPARAR CALLABLESTATEMENT
			cstm=cone.prepareCall("{CALL SP_ELIMINAR_EMPLEADO(?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, cod_emp);
			//COMPROBANDO LO Q TIENE CSTM
			System.out.println("==>"+cstm);
			
			//PASO 04 - EJECUTAMOS CSTM
			r=cstm.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return r;
	}

	@Override
	public Empleado buscarEmpleado(int cod_emp) {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		Empleado emp=new Empleado();
		try {
			cone=MySqlConexion.miConexion();
			cstm=cone.prepareCall("{CALL SP_BUSCAR_EMPLEADO(?)}");
			cstm.setInt(1, cod_emp);
			rs=cstm.executeQuery();
			while(rs.next()) {
				emp.setDni_emp(rs.getString(2));
				emp.setNom_emp(rs.getString(3));
				emp.setApe_emp(rs.getString(4));
				emp.setTelf_emp(rs.getString(5));
				emp.setCorreo_emp(rs.getString(6));
				emp.setDire_emp(rs.getString(7));
				emp.setTipo_usu(rs.getString(8));
				emp.setNom_usu(rs.getString(9));
				emp.setPas_usu(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close(); //PROECEDIMIENTOS ALMACENADOS
				if(rs!=null) rs.close(); //PARA REGISTROS
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return emp;
	}

	@Override
	public ArrayList<Empleado> listadoEmpleado() {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		ArrayList<Empleado>listame=new ArrayList<Empleado>();
		
		try {
			//Invocar conexion
			cone=MySqlConexion.miConexion();
			//Preparar el cstm
			cstm=cone.prepareCall("{CALL SP_LISTAR_EMPLEADO()}");
			//Enviar lo q tiene cstm a rs
			rs=cstm.executeQuery();
			//Haciendo el recorrido
			while(rs.next()) {
				//Declarar un objeto basado a cliente
				Empleado emp=new Empleado();
				emp.setCod_emp(rs.getInt(1));
				emp.setDni_emp(rs.getString(2));
				emp.setNom_emp(rs.getString(3));
				emp.setApe_emp(rs.getString(4));
				emp.setTelf_emp(rs.getString(5));
				emp.setCorreo_emp(rs.getString(6));
				emp.setDire_emp(rs.getString(7));
				emp.setTipo_usu(rs.getString(8));
				emp.setNom_usu(rs.getString(9));
				emp.setPas_usu(rs.getString(10));
				//Enviando cli a listame
				listame.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
				if(rs!=null)rs.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return listame;
	}

	@Override
	public ArrayList<Empleado> reporteGeneralEmpleado() {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		ArrayList<Empleado>listame=new ArrayList<Empleado>();
		
		try {
			//Invocar conexion
			cone=MySqlConexion.miConexion();
			//Preparar el cstm
			cstm=cone.prepareCall("{CALL SP_REPORTE_GENERAL_VENDEDORES()}");
			//Enviar lo q tiene cstm a rs
			rs=cstm.executeQuery();
			//Haciendo el recorrido
			while(rs.next()) {
				//Declarar un objeto basado a cliente
				Empleado emp=new Empleado();
				emp.setCod_emp(rs.getInt(1));
				emp.setDni_emp(rs.getString(2));
				emp.setNom_emp(rs.getString(3));
				emp.setApe_emp(rs.getString(4));
				emp.setTelf_emp(rs.getString(5));
				emp.setTotal_ventas(rs.getInt(6));
				//Enviando cli a listame
				listame.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
				if(rs!=null)rs.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return listame;
	}

}
