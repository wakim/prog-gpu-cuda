package br.com.wakim.index.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class JDBCUtils {
	private static final String URL = "jdbc:mysql://localhost:3306/ir";
	private static final String USER = "root";
	private static final String PASSWORD = "wakimjr";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	protected static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(DRIVER); 
			con = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
			
			return con;
		} catch(ClassNotFoundException e) {
			System.exit(-1);
			return null;
		} catch (SQLException e) {
			System.exit(-1);
			return null;
		}
	}
}
