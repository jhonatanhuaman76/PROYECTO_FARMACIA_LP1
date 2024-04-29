package com.farmacia.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.farmacia.entidad.Boleta;
import com.farmacia.interfaces.IBoletaDAO;
import com.farmacia.util.MySqlConexion;

public class BoletaDAO implements IBoletaDAO {

	@Override
	public int registrarBoleta(Boleta c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		ResultSet rs = null;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_BOLETA(?,?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_cli());
			cstm.setInt(2, c.getCod_emp());
			cstm.setString(3, c.getMetodo_pago());
			cstm.setString(4, c.getFecha_em());
			
			//Ejecutamos el callablestatement
			rs = cstm.executeQuery();
			
			if (rs.next()) {
                r = rs.getInt(1);
            }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
				if(rs!= null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return r;
	}

	@Override
	public int modificarBoleta(Boleta c) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_MODIFICAR_BOLETA(?,?,?,?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getCod_boleta());
			cstm.setInt(2, c.getCod_cli());
			cstm.setInt(3, c.getCod_emp());
			cstm.setString(4, c.getMetodo_pago());
			cstm.setString(5, c.getFecha_em());
			
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
	public int eliminarBoleta(int cod_boleta) {
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_ELIMINAR_BOLETA(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_boleta);
			
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
	public Boleta buscarBoleta(int cod_boleta) {
		//Declaramos objeto cliente
		Boleta c = new Boleta();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_BUSCAR_BOLETA(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, cod_boleta);
			
			//Ejecutamos el callablestatement
			rs=cstm.executeQuery();
			
			while(rs.next()) {
				//Llenamos el objeto cliente con los datos
				c.setCod_boleta(rs.getInt(1));
				c.setCod_cli(rs.getInt(2));
				c.setCod_emp(rs.getInt(3));
				c.setMetodo_pago(rs.getString(4));
				c.setFecha_em(rs.getString(5));
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
	public ArrayList<Boleta> listadoBoleta() {
		//Declaramos la lista de los clientes
		ArrayList<Boleta> data = new ArrayList<Boleta>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_BOLETA()}");
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				Boleta c = new Boleta();
				c.setCod_boleta(rs.getInt(1));
				c.setCod_cli(rs.getInt(2));
				c.setCod_emp(rs.getInt(3));
				c.setMetodo_pago(rs.getString(4));
				c.setFecha_em(rs.getString(5));
				
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
