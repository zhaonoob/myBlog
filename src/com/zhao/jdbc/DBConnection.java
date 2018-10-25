package com.zhao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	private static String url = "jdbc:mysql://localhost:3306/myblog?characterEncoding=utf8&useSSL=true";
	private static String user = "root";
	private static String pwd = "1234";
	static{
	
		try {
			Class.forName("com.mysql.jdbc.Driver");	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 最基本的获取数据库连接对象Connection对象的方法
	 * @return Connection对象
	 */
	public static Connection getConnection(){
		try {
			return DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 基本的关闭Connection、Statement和ResultSet对象的方法，若使用DBCP连接池时是无需自行关闭相关对象。
	 * @param connection 数据连接对象
	 * @param stmt Statement对象
	 * @param rs ResultSet对象
	 */
	public static void close(Connection connection,Statement stmt,ResultSet rs){
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/**
	 * 基本的关闭Connection、Statement对象的方法，若使用DBCP连接池时是无需自行关闭相关对象。
	 * @param connection 数据库连接对象
	 * @param stmt Statement对象
	 */
	public static void close(Connection connection,Statement stmt){
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/**
	 * 基本的关闭ResultSet对象的方法。
	 * @param rs 结果集对象
	 */
	public static void close(ResultSet rs){
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
