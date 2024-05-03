package com.farmacia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.ArrayList;

import com.farmacia.entidad.Cliente;
import com.farmacia.interfaces.IClienteDAO;
import com.farmacia.util.MySqlConexion;


public class ClienteDAO implements IClienteDAO{

	@Override
	public int registrarCliente(Cliente c){
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
			cstm=cone.prepareCall("{CALL SP_REGISTRAR_CLIENTE(?, ?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setString(1, c.getDni_cli());
			cstm.setString(2, c.getNom_cli());
			cstm.setString(3, c.getApe_cli());
	
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
	public int modificarCliente(Cliente c) {
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
			cstm=cone.prepareCall("{CALL SP_MODIFICAR_CLIENTE(?, ?, ?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, c.getCod_cli());
			cstm.setString(2, c.getDni_cli());
			cstm.setString(3, c.getNom_cli());
			cstm.setString(4, c.getApe_cli());

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
	public int eliminarCliente(int cod_cli) {
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
			cstm=cone.prepareCall("{CALL SP_ELIMINAR_CLIENTE(?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, cod_cli);
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
	public Cliente buscarCliente(int cod_cli) {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		Cliente cli=new Cliente();
		try {
			cone=MySqlConexion.miConexion();
			cstm=cone.prepareCall("{CALL SP_BUSCAR_CLIENTE(?)}");
			cstm.setInt(1, cod_cli);
			rs=cstm.executeQuery();
			while(rs.next()) {
				cli.setDni_cli(rs.getString(2));
				cli.setNom_cli(rs.getString(3));
				cli.setApe_cli(rs.getString(4));
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
		
		return cli;
	}

	@Override
	public ArrayList<Cliente> listadoCliente() {
		//CALL SP_LISTAR_CLIENTES()
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		ArrayList<Cliente>listame=new ArrayList<Cliente>();
		
		try {
			//Invocar conexion
			cone=MySqlConexion.miConexion();
			//Preparar el cstm
			cstm=cone.prepareCall("{CALL SP_LISTAR_CLIENTE()}");
			//Enviar lo q tiene cstm a rs
			rs=cstm.executeQuery();
			//Haciendo el recorrido
			while(rs.next()) {
				//Declarar un objeto basado a cliente
				Cliente cli=new Cliente();
				cli.setCod_cli(rs.getInt(1));
				cli.setDni_cli(rs.getString(2));
				cli.setNom_cli(rs.getString(3));
				cli.setApe_cli(rs.getString(4));
				//Enviando cli a listame
				listame.add(cli);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
				if(rs!=null)rs.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return listame;
	}

}
