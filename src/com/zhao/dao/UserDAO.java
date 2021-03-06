package com.zhao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zhao.jdbc.DBConnection;
import com.zhao.module.User;


public class UserDAO extends BaseDAO<User>{
	// 添加用户
	public int insert(User user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//获得连接
			con = DBConnection.getConnection();
			//创建Statement
			String sql = "Insert into t_user(username,password,email,phone,qq,info,avator) values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getQq());
			pstmt.setString(6, user.getInfo());
			pstmt.setString(7, "img/default.jpg");
			//执行sql语句，
			int rows = pstmt.executeUpdate();
			return rows;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally{
			//关闭对象
			DBConnection.close(con, pstmt, null);
		}
	}
	
	// 根据用户名与密码查找用户
	public User findBy(String username,String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		try {
			//获得连接
			con = DBConnection.getConnection();
			//创建Statement
			String sql = "select username from t_user where username = ? and password = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, pwd);
			res = pstmt.executeQuery();
			
			User user = null;
			while(res.next()) {
				user = new User();
				user.setUserName(res.getString("username"));
			}
			
			return user;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			//关闭对象
			DBConnection.close(con, pstmt, res);
		}
	}
	
	// 根据用户名查找用户
	public User findByName(String username) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		try {
			//获得连接
			con = DBConnection.getConnection();
			//创建Statement
			String sql = "select * from t_user where username = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			res = pstmt.executeQuery();
			
			User user = null;
			while(res.next()) {
				user = new User();
				user.setUserName(res.getString("username"));
				user.setPwd(res.getString("password"));
				user.setId(res.getInt("id"));
				user.setEmail(res.getString("email"));
				user.setPhone(res.getString("phone"));
				user.setQq(res.getString("qq"));
				user.setInfo(res.getString("info"));
				user.setAvator(res.getString("avator"));
			}
			
			return user;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			//关闭对象
			DBConnection.close(con, pstmt, res);
		}
	}
	
	// 根据用户名查找用户
		public User findById(int uid) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet res = null;
			try {
				//获得连接
				con = DBConnection.getConnection();
				//创建Statement
				String sql = "select * from t_user where id = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, uid);
				res = pstmt.executeQuery();
				
				User user = null;
				while(res.next()) {
					user = new User();
					user.setUserName(res.getString("username"));
					user.setPwd(res.getString("password"));
					user.setId(res.getInt("id"));
					user.setEmail(res.getString("email"));
					user.setPhone(res.getString("phone"));
					user.setQq(res.getString("qq"));
					user.setInfo(res.getString("info"));
					user.setAvator(res.getString("avator"));
				}
				
				return user;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}finally{
				//关闭对象
				DBConnection.close(con, pstmt, res);
			}
		}
	
	public int update(User user) {
		String sql = "UPDATE t_user SET userName = ?,email = ?,phone = ?,qq = ?,info = ?,avator = ? WHERE id = ?";
		return update(sql, user.getUserName(),user.getEmail(),user.getPhone(),user.getQq(),user.getInfo(),user.getAvator(),user.getId());
	}
	
	public int updatePwd(User user) {
		String sql = "UPDATE t_user SET password = ? WHERE id = ?";
		return update(sql, user.getPwd(),user.getId());
	}
}
