package com.farmacia.dao;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
=======
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
import java.util.ArrayList;

import com.farmacia.entidad.Categoria;
import com.farmacia.interfaces.ICategoriaDAO;
import com.farmacia.util.MySqlConexion;

public class CategoriaDAO implements ICategoriaDAO {

	@Override
	public int registrarCategoria(Categoria c) {
<<<<<<< HEAD
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
			cstm=cone.prepareCall("{CALL SP_REGISTRAR_CATEGORIA(null, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setString(1, c.getNom_cate());
	
			//COMPROBANDO LO Q TIENE CSTM
			System.out.println("==>"+cstm);
			
			//PASO 04 - EJECUTAMOS CSTM
=======
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_REGISTRAR_CATEGORIA(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setString(1, c.getNom_cate());
			
			//Ejecutamos el callablestatement
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
			r=cstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
<<<<<<< HEAD
		}
		
		finally {
			try {
				if(cone!=null)cone.close();
				if(cstm!=null)cstm.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
=======
		} finally {
			try {
				if(cone!=null) cone.close();
				if(cstm!=null) cstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
		}
		
		return r;
	}

	@Override
	public int modificarCategoria(Categoria c) {
<<<<<<< HEAD
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
			cstm=cone.prepareCall("{CALL SP_MODIFICAR_CATEGORIA(?, ?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, c.getNum_cate());
			cstm.setString(2, c.getNom_cate());

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

=======
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_MODIFICAR_CATEGORIA(?,?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, c.getNum_cate());
			cstm.setString(2, c.getNom_cate());
			
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
		
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
		return r;
	}

	@Override
	public int eliminarCategoria(int num_cate) {
<<<<<<< HEAD
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
			cstm=cone.prepareCall("{CALL SP_ELIMINAR_CATEGORIA(?)}");
			
			//PASO 03 - ENVIAR LOS DATOS A CSTM OBTENIDO DE LA MEMORIA RAM
			cstm.setInt(1, num_cate);
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
=======
		//Declarar una variable para el resultado
		int r = -1;
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_ELIMINAR_CATEGORIA(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, num_cate);
			
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
			
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
		}
		
		return r;
	}

	@Override
	public Categoria buscarCategoria(int num_cate) {
<<<<<<< HEAD
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		Categoria cate=new Categoria();
		try {
			cone=MySqlConexion.miConexion();
			cstm=cone.prepareCall("{CALL SP_BUSCAR_CATEGORIA(?)}");
			cstm.setInt(1, num_cate);
			rs=cstm.executeQuery();
			while(rs.next()) {
				cate.setNom_cate(rs.getString(2));
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
		
		return cate;
=======
		//Declaramos objeto cliente
		Categoria c = new Categoria();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_BUSCAR_CATEGORIA(?)}");
			
			//Enviar los datos a cstm obtenidos por la memoria ram
			cstm.setInt(1, num_cate);
			
			//Ejecutamos el callablestatement
			rs=cstm.executeQuery();
			
			while(rs.next()) {
				//Llenamos el objeto cliente con los datos
				c.setNum_cate(rs.getInt(1));
				c.setNom_cate(rs.getString(2));
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
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
	}

	@Override
	public ArrayList<Categoria> listadoCategoria() {
<<<<<<< HEAD
		Connection cone=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		ArrayList<Categoria>listame=new ArrayList<Categoria>();
		
		try {
			//Invocar conexion
			cone=MySqlConexion.miConexion();
			//Preparar el cstm
			cstm=cone.prepareCall("{CALL SP_LISTAR_CATEGORIA()}");
			//Enviar lo q tiene cstm a rs
			rs=cstm.executeQuery();
			//Haciendo el recorrido
			while(rs.next()) {
				//Declarar un objeto basado a cliente
				Categoria cate=new Categoria();
				cate.setNum_cate((rs.getInt(1)));
				cate.setNom_cate(rs.getString(2));

				//Enviando cli a listame
				listame.add(cate);
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
=======
		//Declaramos la lista de los clientes
		ArrayList<Categoria> data = new ArrayList<Categoria>();
		
		//Declarar objeto para la conexion
		Connection cone = null;
		
		//Declarar objeto para manipular procedimiento almacenado
		CallableStatement cstm = null;
		
		//Declarar objeto ResultSet que tiene el resultado del SELECT, para hacer listado
		ResultSet rs = null;
		
		try {
			cone = MySqlConexion.miConexion();
			
			//Preparar el callableStatement
			cstm = cone.prepareCall("{call SP_LISTAR_CATEGORIA()}");
			
			//Ejecutamos el callablestatement, enviar lo que tiene cstm a rs
			rs=cstm.executeQuery();
			
			//Llenamos la lista con los clientes de la base de datos
			while(rs.next()) {
				Categoria c = new Categoria();
				c.setNum_cate(rs.getInt(1));
				c.setNom_cate(rs.getString(2));
				
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
>>>>>>> 83df94bcc94cbddac7eddaf3b84385606ac28a2b
	}

}
