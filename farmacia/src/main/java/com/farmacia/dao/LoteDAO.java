package com.farmacia.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.farmacia.entidad.Lote;
import com.farmacia.interfaces.ILoteDAO;
import com.farmacia.util.MySqlConexion;

public class LoteDAO implements ILoteDAO {

	@Override
	public int registrarLote(Lote c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_LOTE(?,?,?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_pro());
			cstm.setInt(2, c.getStock());
			cstm.setString(3, c.getFecha_venc());
			cstm.setString(4, c.getFecha_fab());
			cstm.setString(5, c.getCond_trans());
			
			//Ejecutamos el callablestatement
			r=cstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return r;
	}

	@Override
	public int modificarLote(Lote c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_MODIFICAR_LOTE(?,?,?,?,?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getNro_lote());
			cstm.setInt(2, c.getCod_pro());
			cstm.setInt(3, c.getStock());
			cstm.setString(4, c.getFecha_venc());
			cstm.setString(5, c.getFecha_fab());
			cstm.setString(6, c.getCond_trans());
			
			//Ejecutamos el callablestatement
			r=cstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return r;
	}

	@Override
	public int eliminarLote(int nro_lote) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_ELIMINAR_LOTE(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, nro_lote);
			
			//Ejecutamos el callablestatement
			r=cstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return r;
	}

	@Override
	public Lote buscarLote(int nro_lote) {
		//Declaramos objeto cliente
		Lote c = new Lote();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_BUSCAR_LOTE(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, nro_lote);
			
			//Ejecutamos el callablestatement
			rs=cstm.executeQuery();
			
			while(rs.next()) {
				//Llenamos el objeto cliente con los datos
				c.setNro_lote(rs.getInt(1));
				c.setCod_pro(rs.getInt(2));
				c.setStock(rs.getInt(3));
				c.setFecha_venc(rs.getString(4));
				c.setFecha_fab(rs.getString(5));				
				c.setCond_trans(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
				if(rs!=null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return c;
	}

	@Override
	public ArrayList<Lote> listadoLote() {
		//Declaramos la lista de los clientes
		ArrayList<Lote> data = new ArrayList<Lote>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_LOTE()}");
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				Lote c = new Lote();
				c.setNro_lote(rs.getInt(1));
				c.setCod_pro(rs.getInt(2));
				c.setStock(rs.getInt(3));
				c.setFecha_venc(rs.getString(4));
				c.setFecha_fab(rs.getString(5));				
				c.setCond_trans(rs.getString(6));
				
				data.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
				if(rs!=null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return data;
	}

}
