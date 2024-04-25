package com.farmacia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.ArrayList;

import com.farmacia.entidad.Marca;
import com.farmacia.interfaces.IMarcaDAO;
import com.farmacia.util.MySqlConexion;

public class MarcaDAO implements IMarcaDAO{

	@Override
	public int registrarMarca(Marca c) {
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
			cstm=cone.prepareCall("{CALL SP_REGISTRAR_MARCA(null, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setString(1, c.getNom_marca());
	
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
	public int modificarMarca(Marca c) {
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
			cstm=cone.prepareCall("{CALL SP_MODIFICAR_MARCA(?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, c.getCod_marca());
			cstm.setString(2, c.getNom_marca());

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
	public int eliminarMarca(int cod_marca) {
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
			cstm=cone.prepareCall("{CALL SP_ELIMINAR_MARCA(?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, cod_marca);
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
	public Marca buscarMarca(int cod_marca) {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		Marca marca=new Marca();
		try {
			cone=MySqlConexion.miConexion();
			cstm=cone.prepareCall("{CALL SP_BUSCAR_MARCA(?)}");
			cstm.setInt(1, cod_marca);
			rs=cstm.executeQuery();
			while(rs.next()) {
				marca.setNom_marca(rs.getString(2));
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
		
		return marca;
	}

	@Override
	public ArrayList<Marca> listadoMarca() {
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		ArrayList<Marca>listame=new ArrayList<Marca>();
		
		try {
			//Invocar conexion
			cone=MySqlConexion.miConexion();
			//Preparar el cstm
			cstm=cone.prepareCall("{CALL SP_LISTAR_MARCA()}");
			//Enviar lo q tiene cstm a rs
			rs=cstm.executeQuery();
			//Haciendo el recorrido
			while(rs.next()) {
				//Declarar un objeto basado a cliente
				Marca marca=new Marca();
				marca.setCod_marca(rs.getInt(1));
				marca.setNom_marca(rs.getString(2));

				//Enviando cli a listame
				listame.add(marca);
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
