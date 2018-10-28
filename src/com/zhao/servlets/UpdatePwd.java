package com.zhao.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhao.dao.UserDAO;
import com.zhao.module.User;

/**
 * Servlet implementation class UpdatePwd
 */
@WebServlet("/updatePwd.do")
public class UpdatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwd() {
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
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("login");
		
		int uid = user.getId();
		String oldPwd = req.getParameter("oldPassword");
		if(oldPwd != user.getPwd()) {
			out.println("<script>alert(\"当前密码错误,请重新输入!\")</script>");
			res.setHeader("refresh", "0,URL=UpdatePwd.jsp");
		}else {
			String newPwd = req.getParameter("password");
			
			User newUser = new User();
			newUser.setPwd(newPwd);
			newUser.setId(uid);
			
			UserDAO userDAO = new UserDAO();
			if(userDAO.updatePwd(newUser) > 0) {
				session.invalidate();
				res.sendRedirect("UserLogin.jsp");
			}else {
				System.out.println("修改密码失败！");
				res.sendRedirect("index.jsp");
			}
		}
	}
}
