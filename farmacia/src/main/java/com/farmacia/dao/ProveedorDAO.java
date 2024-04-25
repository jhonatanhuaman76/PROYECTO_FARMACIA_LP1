package com.farmacia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.ArrayList;

import com.farmacia.entidad.Proveedor;
import com.farmacia.interfaces.IProveedorDAO;
import com.farmacia.util.MySqlConexion;

public class ProveedorDAO implements IProveedorDAO{

	@Override
	public int registrarProveedor(Proveedor c) {
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
			cstm=cone.prepareCall("{CALL SP_REGISTRAR_PROVEEDOR(null, ?, ?, ?, ?, ?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setString(1, c.getRuc_prov());
			cstm.setString(2, c.getNom_prov());
			cstm.setString(3, c.getTelf_prov());
			cstm.setString(4, c.getDire_prov());
			cstm.setString(5, c.getCorreo_prov());
			cstm.setString(6, c.getWeb_prov());
	
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
	public int modificarProveedor(Proveedor c) {
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
			cstm=cone.prepareCall("{CALL SP_MODIFICAR_PROVEEDOR(?, ?, ?, ?, ?, ?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, c.getCod_prov());
			cstm.setString(2, c.getRuc_prov());
			cstm.setString(3, c.getNom_prov());
			cstm.setString(4, c.getTelf_prov());
			cstm.setString(5, c.getDire_prov());
			cstm.setString(6, c.getCorreo_prov());
			cstm.setString(7, c.getWeb_prov());

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
	public int eliminarProveedor(int cod_prov) {
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
			cstm=cone.prepareCall("{CALL SP_ELIMINAR_PROVEEDOR(?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, cod_prov);
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
	public Proveedor buscarProveedor(int cod_prov) {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		Proveedor prov=new Proveedor();
		try {
			cone=MySqlConexion.miConexion();
			cstm=cone.prepareCall("{CALL SP_BUSCAR_PROVEEDOR(?)}");
			cstm.setInt(1, cod_prov);
			rs=cstm.executeQuery();
			while(rs.next()) {
				prov.setRuc_prov(rs.getString(2));
				prov.setNom_prov(rs.getString(3));
				prov.setTelf_prov(rs.getString(4));
				prov.setDire_prov(rs.getString(5));
				prov.setCorreo_prov(rs.getString(6));
				prov.setWeb_prov(rs.getString(7));
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
		
		return prov;
	}

	@Override
	public ArrayList<Proveedor> listadoProveedor() {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		ArrayList<Proveedor>listame=new ArrayList<Proveedor>();
		
		try {
			//Invocar conexion
			cone=MySqlConexion.miConexion();
			//Preparar el cstm
			cstm=cone.prepareCall("{CALL SP_LISTAR_PROVEEDOR()}");
			//Enviar lo q tiene cstm a rs
			rs=cstm.executeQuery();
			//Haciendo el recorrido
			while(rs.next()) {
				//Declarar un objeto basado a cliente
				Proveedor prov=new Proveedor();
				prov.setCod_prov(rs.getInt(1));
				prov.setRuc_prov(rs.getString(2));
				prov.setNom_prov(rs.getString(3));
				prov.setTelf_prov(rs.getString(4));
				prov.setDire_prov(rs.getString(5));
				prov.setCorreo_prov(rs.getString(6));
				prov.setWeb_prov(rs.getString(7));
				//Enviando cli a listame
				listame.add(prov);
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
