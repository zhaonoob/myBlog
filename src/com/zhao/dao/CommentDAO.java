package com.zhao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zhao.jdbc.DBConnection;
import com.zhao.module.Comment;
import com.zhao.module.CommentInfo;

public class CommentDAO {
	// 添加评论
	public int insertComment(Comment comment) {
		Connection con = null;
		PreparedStatement pest = null;

		try {
			con = DBConnection.getConnection();

			String sql = "insert into t_comment(c_content,time,user_id,article_id) values (?,?,?,?)";

			pest = con.prepareStatement(sql);

			pest.setString(1, comment.getContent());
			pest.setTimestamp(2, comment.getTime());
			pest.setInt(3, comment.getUser_id());
			pest.setInt(4, comment.getArticle_id());

			int rows = pest.executeUpdate();
			return rows;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		} finally {
			DBConnection.close(con, pest);
		}
	}

	// 根据文章编号查找所有评论信息
	public List<CommentInfo> findCommentById(int article_id) {
		Connection con = null;
		PreparedStatement pest = null;
		ResultSet res = null;

		try {
			con = DBConnection.getConnection();
			String sql = "select avator,c_content,time,username from t_comment as a inner join t_user as b on a.user_id = b.id where article_id = ?";
			pest = con.prepareStatement(sql);
			pest.setInt(1, article_id);

			res = pest.executeQuery();
			List<CommentInfo> commentList = new ArrayList<CommentInfo>();
			CommentInfo comment = null;
			while (res.next()) {
				comment = new CommentInfo();
				comment.setAvator(res.getString("avator"));
				comment.setContent(res.getString("c_content"));
				comment.setComment_date(res.getTimestamp("time"));
				comment.setUserName(res.getString("username"));
				commentList.add(comment);
			}
			return commentList;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			DBConnection.close(con, pest, res);
		}
	}

	// 根据用户名查找所有评论信息
	public List<CommentInfo> findCommentByUserName(String userName) {
		Connection con = null;
		PreparedStatement pest = null;
		ResultSet res = null;

		try {
			con = DBConnection.getConnection();
			String sql = "select title,c_content,time,b.article_id,c_id from t_comment as a inner join t_article as b on a.article_id = b.article_id inner join t_user as c on a.user_id = c.id where c.username = ?";
			pest = con.prepareStatement(sql);
			pest.setString(1, userName);

			res = pest.executeQuery();
			List<CommentInfo> commentList = new ArrayList<CommentInfo>();
			CommentInfo comment = null;
			while (res.next()) {
				comment = new CommentInfo();			
				comment.setContent(res.getString("c_content"));
				comment.setComment_date(res.getTimestamp("time"));
				comment.setTitle(res.getString("title"));
				comment.setArticle_id(res.getInt("article_id"));
				comment.setComment_id(res.getInt("c_id"));
				commentList.add(comment);
			}
			return commentList;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			DBConnection.close(con, pest, res);
		}
	}

	// 根据文章编号统计评论数量
	public int findCommentNumById(int article_id) {
		Connection con = null;
		PreparedStatement pest = null;
		ResultSet res = null;

		try {
			con = DBConnection.getConnection();
			String sql = "select count(1) rec from t_comment where article_id = ?";
			pest = con.prepareStatement(sql);
			pest.setInt(1, article_id);

			res = pest.executeQuery();
			int rowCount = 0;
			while (res.next()) {
				rowCount = res.getInt("rec");
			}
			return rowCount;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		} finally {
			DBConnection.close(con, pest, res);
		}
	}

	// 根据文章编号删除所有评论
	public int delAllCommentById(int article_id) {
		Connection con = null;
		PreparedStatement pest = null;

		try {
			con = DBConnection.getConnection();
			String sql = "DELETE from t_comment where article_id = ?";
			pest = con.prepareStatement(sql);
			pest.setInt(1, article_id);

			int row = pest.executeUpdate();
			return row;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		} finally {
			DBConnection.close(con, pest, null);
		}
	}

	// 根据评论编号删除评论
	public int delCommentById(int comment_id) {
		Connection con = null;
		PreparedStatement pest = null;

		try {
			con = DBConnection.getConnection();
			String sql = "DELETE from t_comment where c_id = ?";
			pest = con.prepareStatement(sql);
			pest.setInt(1, comment_id);

			int row = pest.executeUpdate();
			return row;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		} finally {
			DBConnection.close(con, pest, null);
		}
	}
}
