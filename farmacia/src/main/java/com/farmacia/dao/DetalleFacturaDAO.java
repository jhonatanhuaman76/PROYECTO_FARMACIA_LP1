package com.farmacia.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.farmacia.entidad.DetalleFactura;
import com.farmacia.interfaces.IDetalleFacturaDAO;
import com.farmacia.util.MySqlConexion;

public class DetalleFacturaDAO implements IDetalleFacturaDAO {

	@Override
	public int registrarDetalleFactura(DetalleFactura c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_DETALLE_FACTURA(?,?,?,?,?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getNro_lote());
			cstm.setInt(2, c.getNro_factura());
			cstm.setInt(3, c.getCod_pro());
			cstm.setInt(4, c.getCod_uni());
			cstm.setInt(5, c.getCant_recib_base());
			cstm.setInt(6, c.getCant_recib_pres());
			cstm.setDouble(7, c.getPre_unit_compra());
			
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
	public int modificarDetalleFactura(DetalleFactura c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_MODIFICAR_DETALLE_FACTURA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getNro_lote());
			cstm.setInt(2, c.getNro_factura());
			cstm.setInt(3, c.getCod_pro());
			cstm.setInt(4, c.getCod_uni());
			cstm.setInt(5, c.getCant_recib_base());
			cstm.setInt(6, c.getCant_recib_pres());
			cstm.setDouble(7, c.getPre_unit_compra());
			
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
	public int eliminarDetalleFactura(int cod_lote, int cod_factura) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_ELIMINAR_DETALLE_FACTURA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_lote);
			cstm.setInt(2, cod_factura);
			
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
	public DetalleFactura buscarDetalleFactura(int cod_lote, int cod_factura) {
		//Declaramos objeto cliente
		DetalleFactura c = new DetalleFactura();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_BUSCAR_DETALLE_FACTURA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_lote);
			cstm.setInt(2, cod_factura);
			
			//Ejecutamos el callablestatement
			rs=cstm.executeQuery();
			
			while(rs.next()) {
				//Llenamos el objeto cliente con los datos
				c.setNro_lote(rs.getInt(1));
				c.setNro_factura(rs.getInt(2));
				c.setCod_pro(rs.getInt(3));
				c.setCod_uni(rs.getInt(4));
				c.setCant_recib_base(rs.getInt(5)); 
				c.setCant_recib_pres(rs.getInt(6)); 
				c.setPre_unit_compra(rs.getDouble(7)); 
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
	public ArrayList<DetalleFactura> listadoDetalleFactura() {
		//Declaramos la lista de los clientes
		ArrayList<DetalleFactura> data = new ArrayList<DetalleFactura>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_DETALLE_FACTURA()}");
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				DetalleFactura c = new DetalleFactura();
				c.setNro_lote(rs.getInt(1));
				c.setNro_factura(rs.getInt(2));
				c.setCod_pro(rs.getInt(3));
				c.setCod_uni(rs.getInt(4));
				c.setCant_recib_base(rs.getInt(5)); 
				c.setCant_recib_pres(rs.getInt(6)); 
				c.setPre_unit_compra(rs.getDouble(7)); 
				
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
