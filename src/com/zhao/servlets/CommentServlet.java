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

import com.zhao.dao.CommentDAO;
import com.zhao.module.Comment;
import com.zhao.module.User;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/pub_comment.do")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
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
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();
		out.println("<script src='layer/jquery-1.10.2.js'></script>");
		out.println("<script src='layer/layer.js'></script>");
		User user = (User)session.getAttribute("login");
		
		if(user != null) {
			String content = req.getParameter("comment");
			int user_id = user.getId();
			int article_id = Integer.parseInt(req.getParameter("article_id"));
			
			java.util.Date now = new java.util.Date();
			Timestamp date = new Timestamp(now.getTime());
			
			Comment comment = new Comment();
			comment.setContent(content);
			comment.setTime(date);
			comment.setUser_id(user_id);
			comment.setArticle_id(article_id);
			
			CommentDAO commentDAO = new CommentDAO();
			
			if(commentDAO.insertComment(comment) > 0) {
				//System.out.println("发表评论成功！");
				out.println("<script>layer.msg('评论成功！',{'icon': 1})</script>");
				res.setHeader("refresh", "1,URL=showArticle.jsp");
				//res.sendRedirect("showArticle.jsp");
			}else {
				//System.out.println("发表评论失败！");
				out.println("<script>layer.msg('评论失败！',{'icon': 2})</script>");
				res.setHeader("refresh", "1,URL=showArticle.jsp");
				//res.sendRedirect("showArticle.jsp");
			}	
		}else {
			out.println("<script>layer.msg('登陆后才能评论！',{'icon': 2})</script>");
			res.setHeader("refresh", "1,URL=UserLogin.jsp");
		}
		
	}
}
