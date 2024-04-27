package com.farmacia.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.farmacia.entidad.Boleta;
import com.farmacia.entidad.Producto;
import com.farmacia.interfaces.IBoletaDAO;
import com.farmacia.util.MySqlConexion;



public class BoletaDAO implements IBoletaDAO{

	@Override
	public int registrarBoleta(Boleta b) {
		// Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objetos para la conexion
		Connection cone = null;
		
		//Declarar objetos para manipular procedimientos almacenados
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_BOLETA(?,?,?,?)}");
			
			//Enviar datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, b.getCod_cli());
			cstm.setInt(2, b.getCod_emp());
			cstm.setString(3, b.getMetodo_pago());
			cstm.setString(4, b.getFecha_em());
			
			//Ejecutamos el callableStatement
			r = cstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cone.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return r;
	}

	@Override
	public int modificarBoleta(Boleta b) {
		//Declarar una variable para el resultado
		int r = -1;

		//Declarar objeto para la conexion
		Connection cone=null;
		
		//Declarar objetos para manipular los objetos almacenados
		CallableStatement cstm = null;
		try {
			cone=MySqlConexion.miConexion();
			
			//preparar el CallableStatement
			cstm=cone.prepareCall("{call SP_MODIFICAR_BOLETA(?,?,?,?,?)}");
			
			//Enviar datos a cstm obtenidos por la memoria ram 
			cstm.setInt(1, b.getCod_boleta());
			cstm.setInt(2, b.getCod_cli());
			cstm.setInt(3, b.getCod_emp());
			cstm.setString(4, b.getMetodo_pago());
			cstm.setString(5, b.getFecha_em());
			
			r= cstm.executeUpdate();
			
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
		//Declaramos objeto Boleta
				Boleta b = new Boleta();
				
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
						b.setCod_boleta(cstm.getInt(1));
						b.setCod_cli(cstm.getInt(2));
						b.setCod_emp(cstm.getInt(3));
						b.setMetodo_pago(cstm.getString(4));
						b.setFecha_em(cstm.getString(5));
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
				return b;
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
					cstm = cone.prepareCall("{call SP_LISTAR_PRODUCTO()}");
					
					//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
					rs=cstm.executeQuery();
					
					//Llenamos la lista con los clientes de la base de datos
					while(rs.next()) {
						Boleta b = new Boleta();
						b.setCod_boleta(cstm.getInt(1));
						b.setCod_cli(cstm.getInt(2));
						b.setCod_emp(cstm.getInt(3));
						b.setMetodo_pago(cstm.getString(4));
						b.setFecha_em(cstm.getString(5));				
						data.add(b);
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
