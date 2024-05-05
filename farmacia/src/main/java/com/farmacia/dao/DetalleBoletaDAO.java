package com.farmacia.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.farmacia.entidad.DetalleBoleta;
import com.farmacia.interfaces.IDetalleBoletaDAO;
import com.farmacia.util.MySqlConexion;

public class DetalleBoletaDAO implements IDetalleBoletaDAO {

	@Override
	public int registrarDetalleBoleta(DetalleBoleta c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_DETALLE_BOLETA(?,?,?,?,?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_boleta());
			cstm.setInt(2, c.getCod_lote());
			cstm.setInt(3, c.getCod_prod());
			cstm.setInt(4, c.getCod_uni());
			cstm.setInt(5, c.getCant_vend_base());
			cstm.setInt(6, c.getCant_vend_pres());
			cstm.setDouble(7, c.getPre_unit_venta());
			
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
	public int modificarDetalleBoleta(DetalleBoleta c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_MODIFICAR_DETALLE_BOLETA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_boleta());
			cstm.setInt(2, c.getCod_lote());
			cstm.setInt(3, c.getCod_prod());
			cstm.setInt(4, c.getCod_uni());
			cstm.setInt(5, c.getCant_vend_base());
			cstm.setInt(6, c.getCant_vend_pres());
			cstm.setDouble(7, c.getPre_unit_venta());
			
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
	public int eliminarDetalleBoleta(int cod_boleta, int cod_lote) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_ELIMINAR_DETALLE_BOLETA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_boleta);
			cstm.setInt(2, cod_lote);
			
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
	public DetalleBoleta buscarDetalleBoleta(int cod_boleta, int cod_lote) {
		//Declaramos objeto cliente
		DetalleBoleta c = new DetalleBoleta();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_BUSCAR_DETALLE_BOLETA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_boleta);
			cstm.setInt(2, cod_lote);
			
			//Ejecutamos el callablestatement
			rs=cstm.executeQuery();
			
			while(rs.next()) {
				//Llenamos el objeto cliente con los datos
				c.setCod_boleta(rs.getInt(1));
				c.setCod_lote(rs.getInt(2));
				c.setCod_prod(rs.getInt(3));
				c.setCod_uni(rs.getInt(4));
				c.setCant_vend_base(rs.getInt(5)); 
				c.setCant_vend_pres(rs.getInt(6)); 
				c.setPre_unit_venta(rs.getDouble(7)); 
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
	public ArrayList<DetalleBoleta> listadoDetalleBoleta() {
		//Declaramos la lista de los clientes
		ArrayList<DetalleBoleta> data = new ArrayList<DetalleBoleta>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_DETALLE_BOLETA()}");
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				DetalleBoleta c = new DetalleBoleta();
				c.setCod_boleta(rs.getInt(1));
				c.setCod_lote(rs.getInt(2));
				c.setCod_prod(rs.getInt(3));
				c.setCod_uni(rs.getInt(4));
				c.setCant_vend_base(rs.getInt(5)); 
				c.setCant_vend_pres(rs.getInt(6)); 
				c.setPre_unit_venta(rs.getDouble(7));
				
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
	public ArrayList<DetalleBoleta> listarDetalleBoletaXCodigoBoleta(int cod_boleta) {
		//Declaramos la lista de los clientes
		ArrayList<DetalleBoleta> data = new ArrayList<DetalleBoleta>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_DETALLE_BOLETA_X_CODIGO_BOLETA(?)}");
			cstm.setInt(1, cod_boleta);
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				DetalleBoleta c = new DetalleBoleta();
				c.setCod_boleta(rs.getInt(1));
				c.setCod_lote(rs.getInt(2));
				c.setCod_prod(rs.getInt(3));
				c.setCod_uni(rs.getInt(4));
				c.setCant_vend_base(rs.getInt(5)); 
				c.setCant_vend_pres(rs.getInt(6)); 
				c.setPre_unit_venta(rs.getDouble(7));
				c.setNom_pro(rs.getString(8));
				c.setAbtr_unidad(rs.getString(9));
				c.setTotal(rs.getDouble(10));
				
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
