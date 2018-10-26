package com.zhao.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhao.dao.ArticleDAO;
import com.zhao.module.ArticleInfo;

/**
 * Servlet implementation class ShowArticleServlet
 */
@WebServlet("/showArticle.do")
public class ShowArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int article_id = Integer.parseInt(req.getParameter("id"));
		ArticleDAO articleDAO = new ArticleDAO();
		ArticleInfo articleInfo = articleDAO.findArticleById(article_id);
		
		HttpSession session = req.getSession();
		session.setAttribute("showArticle", articleInfo);
		res.sendRedirect("showArticle.jsp");
	}
}
