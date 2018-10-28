package com.zhao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.zhao.jdbc.DBConnection;
import com.zhao.module.User;

public abstract class BaseDAO<T>{
	//"Delete FROM users WHERE id = ?";
	//INSERT INTO account(userName,balance) VALUES(?,?)
	public int update(String sql,Object...values){
		Connection connection = null;
		PreparedStatement pstmt = null;
		try {
			connection = DBConnection.getConnection();
			pstmt = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object value : values) {
				pstmt.setObject(parameterIndex, value);
				parameterIndex++;
			}
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally{
			//关闭对象
			DBConnection.close(connection, pstmt,null);
			
		}
	}
}

