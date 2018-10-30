package com.zhao.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhao.dao.CommentDAO;

/**
 * Servlet implementation class DelCommentServlet
 */
@WebServlet("/delComment.do")
public class DelCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script src='layer/jquery-1.10.2.js'></script>");
		out.println("<script src='layer/layer.js'></script>");
		int comment_id = Integer.parseInt(req.getParameter("c_id"));
		
		CommentDAO commentDAO = new CommentDAO();
		if(commentDAO.delCommentById(comment_id) > 0) {
			out.println("<script>layer.msg('删除成功！',{'icon': 6})</script>");
			res.setHeader("refresh", "1,URL=comment.jsp");
		}else {
			out.println("<script>layer.msg('删除失败！',{'icon': 5})</script>");
			res.setHeader("refresh", "1,URL=comment.jsp");
		}
		
	}

}
