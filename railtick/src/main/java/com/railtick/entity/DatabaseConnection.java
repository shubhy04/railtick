package com.railtick.entity;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DatabaseConnection {
	private static Connection conn = null;

	static {

		ResourceBundle rb = ResourceBundle.getBundle("application");

		try {
			Class.forName(rb.getString("driverName"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			System.out.println(rb.getString("connectionString"));
			System.out.println(rb.getString("username"));
			System.out.println(rb.getString("password"));
			conn = DriverManager.getConnection(rb.getString("connectionString"), rb.getString("username"),
					rb.getString("password"));
			System.out.println("Connection Success!!");
		}

		catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public static Connection getConnection() {
		if (conn == null) {
			System.out.println("Something went wrong");		
		}
		return conn;
	}
	
}
