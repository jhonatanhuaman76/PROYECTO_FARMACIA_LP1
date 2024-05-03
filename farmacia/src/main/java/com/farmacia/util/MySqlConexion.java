package com.farmacia.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConexion {
	private static String url = "jdbc:mysql://localhost:3306/bd_farmaplus?useSSL=false&TimeZone=true&serverTimezone=UTC";
	private static String usuario = "root";
	private static String password = "carlossc";
	
	public static Connection miConexion() {
		Connection cn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			cn = DriverManager.getConnection(url, usuario, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cn;
	}
}
