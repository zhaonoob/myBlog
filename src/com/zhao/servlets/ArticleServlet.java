package com.zhao.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhao.dao.ArticleDAO;
import com.zhao.module.Article;
import com.zhao.module.User;

/**
 * Servlet implementation class ArticleServlet
 */
@WebServlet("/article.do")
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script src='layer/jquery-1.10.2.js'></script>");
		out.println("<script src='layer/layer.js'></script>");
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("login");
		
		String title = req.getParameter("title");
		String content  = req.getParameter("content");
		String type = req.getParameter("tips");
		
		java.util.Date now = new java.util.Date();
		Timestamp date = new Timestamp(now.getTime());
		
		
		Article article = new Article();
		ArticleDAO articleDAO = new ArticleDAO();
		article.setTitle(title);
		article.setContent(content);
		article.setUser_id(user.getId());
		article.setPub_date(date);
		article.setArticletype_id(articleDAO.findTypeBy(type).getId());
		
		if(articleDAO.insertArticle(article) > 0) {
			//System.out.println("文章发表成功！");
			out.println("<script>layer.msg('文章发布成功！',{'icon': 6})</script>");
			res.setHeader("refresh", "1,URL=index.jsp");
			//res.sendRedirect("index.jsp");
		}else {
			//System.out.println("文章发表失败！");
			out.println("<script>layer.msg('文章发布失败！',{'icon': 5})</script>");
			res.setHeader("refresh", "1,URL=index.jsp");
			//res.sendRedirect("index.jsp");
		}
	}

}
