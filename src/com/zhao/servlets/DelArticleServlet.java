package com.zhao.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhao.dao.ArticleDAO;

/**
 * Servlet implementation class DelArticleServlet
 */
@WebServlet("/delArticle.do")
public class DelArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script src='layer/jquery-1.10.2.js'></script>");
		out.println("<script src='layer/layer.js'></script>");
		int article_id = Integer.parseInt(req.getParameter("article_id"));
		ArticleDAO articleDAO = new ArticleDAO();
		
		if(articleDAO.delArticleById(article_id) > 0) {
			out.println("<script>layer.msg('删除成功！',{'icon': 6})</script>");
			res.setHeader("refresh", "1,URL=article.jsp");
			//System.out.println("删除文章成功！");
		}else {
			//System.out.println("删除文章失败！");
			out.println("<script>layer.msg('删除失败！',{'icon': 5})</script>");
			res.setHeader("refresh", "1,URL=article.jsp");
			//res.sendRedirect("article.jsp");
		}
	}

}
