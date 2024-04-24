package com.farmacia.test;

import java.sql.Connection;
import com.farmacia.util.MySqlConexion;

public class TestMySqlConexion {

	public static void main(String[] args) {
		Connection cn = MySqlConexion.miConexion();
		
		if(cn!=null) {
			System.out.println("CONEXION EXITOSA");
		}
	}

}
