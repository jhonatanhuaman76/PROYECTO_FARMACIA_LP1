package com.farmacia.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.farmacia.entidad.UmProducto;
import com.farmacia.interfaces.IUmProductoDAO;
import com.farmacia.util.MySqlConexion;

public class UmProductoDAO implements IUmProductoDAO {

	@Override
	public int registrarUmProducto(UmProducto c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_UM_PRODUCTO(?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_uni());
			cstm.setInt(2, c.getCod_pro());
			cstm.setInt(3, c.getFactor());
			
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
	public int modificarUmProducto(UmProducto c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_MODIFICAR_UM_PRODUCTO(?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_uni());
			cstm.setInt(2, c.getCod_pro());
			cstm.setInt(3, c.getFactor());
			
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
	public int eliminarUmProducto(int cod_uni, int cod_pro) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_ELIMINAR_UM_PRODUCTO(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_uni);
			cstm.setInt(1, cod_pro);
			
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
	public UmProducto buscarUmProducto(int cod_uni, int cod_pro) {
		//Declaramos objeto cliente
		UmProducto c = new UmProducto();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_BUSCAR_UM_PRODUCTO(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_uni());
			cstm.setInt(2, c.getCod_pro());
			
			//Ejecutamos el callablestatement
			rs=cstm.executeQuery();
			
			while(rs.next()) {
				//Llenamos el objeto cliente con los datos
				c.setCod_uni(rs.getInt(1));
				c.setCod_pro(rs.getInt(2));
				c.setFactor(rs.getInt(3));
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
	public ArrayList<UmProducto> listadoUmProducto() {
		//Declaramos la lista de los clientes
		ArrayList<UmProducto> data = new ArrayList<UmProducto>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_UM_PRODUCTO()}");
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				UmProducto c = new UmProducto();
				c.setCod_uni(rs.getInt(1));
				c.setCod_pro(rs.getInt(2));
				c.setFactor(rs.getInt(3));
				
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

	@Override
	public ArrayList<UmProducto> listadoUmProductoxCodigoProd(int cod_prod) {
		//Declaramos la lista de los clientes
		ArrayList<UmProducto> data = new ArrayList<UmProducto>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_UM_PRODUCTO_X_COD_PROD(?)}");
			
			cstm.setInt(1, cod_prod);
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				UmProducto c = new UmProducto();
				c.setCod_uni(rs.getInt(1));
				c.setCod_pro(rs.getInt(2));
				c.setFactor(rs.getInt(3));
				c.setAbtr_uni(rs.getString(4));
				c.setDes_uni(rs.getString(5));
				
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
