package com.zhao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zhao.jdbc.DBConnection;
import com.zhao.module.Article;
import com.zhao.module.ArticleType;

public class ArticleDAO {
	// 添加文章
	public int insertArticle(Article article) {
		Connection con = null;
		PreparedStatement pest = null;

		try {
			con = DBConnection.getConnection();

			String sql = "insert into t_article(title,content,pub_date,user_id,articletype_id) values (?,?,?,?,?)";

			pest = con.prepareStatement(sql);

			pest.setString(1, article.getTitle());
			pest.setString(2, article.getContent());
			pest.setTimestamp(3, article.getPub_date());
			pest.setInt(4, article.getUser_id());
			pest.setInt(5, article.getArticletype_id());

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

	// 根据文章分类查找文章类型编号
	public ArticleType findTypeBy(String articleType) {
		Connection con = null;
		PreparedStatement pest = null;
		ResultSet res = null;

		try {
			con = DBConnection.getConnection();
			String sql = "select id from t_articletype where type = ?";
			pest = con.prepareStatement(sql);
			pest.setString(1, articleType);

			res = pest.executeQuery();
			ArticleType type = null;
			while (res.next()) {
				type = new ArticleType();
				type.setId(res.getInt("id"));
			}
			return type;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			DBConnection.close(con, pest, res);
		}
	}
	
	// 根据文章类型编号查找文章类型
		public ArticleType findById(int articleTypeId) {
			Connection con = null;
			PreparedStatement pest = null;
			ResultSet res = null;

			try {
				con = DBConnection.getConnection();
				String sql = "select type from t_articletype where id = ?";
				pest = con.prepareStatement(sql);
				pest.setInt(1, articleTypeId);

				res = pest.executeQuery();
				ArticleType type = null;
				while (res.next()) {
					type = new ArticleType();
					type.setArticletype(res.getString(articleTypeId));
				}
				return type;

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			} finally {
				DBConnection.close(con, pest, res);
			}
		}

	// 查找数据库所有文章
	public List<Article> findAll() {
		Connection con = null;
		PreparedStatement pest = null;
		ResultSet res = null;

		try {
			con = DBConnection.getConnection();
			String sql = "select * from t_article";
			pest = con.prepareStatement(sql);

			res = pest.executeQuery();
			List<Article> articleList = new ArrayList<Article>();
			Article article = null;
			while (res.next()) {
				article = new Article();
				article.setId(res.getInt("id"));
				article.setTitle(res.getString("title"));
				article.setContent(res.getString("content"));
				article.setPub_date(res.getTimestamp("pub_date"));
				article.setUser_id(res.getInt("user_id"));
				article.setArticletype_id(res.getInt("articletype_id"));
				
				articleList.add(article);
			}
			return articleList;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			DBConnection.close(con, pest, res);
		}
	}
}
