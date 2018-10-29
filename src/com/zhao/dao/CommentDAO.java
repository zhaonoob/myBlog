package com.zhao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zhao.jdbc.DBConnection;
import com.zhao.module.ArticleInfo;
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

	// 根据文章编号查找评论信息
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

}
