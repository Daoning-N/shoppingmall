package com.shopping.app;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;



public class DBConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/mall";
	private static final String USER = "woori";
	private static final String PW = "woori1234";

	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		try(Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
