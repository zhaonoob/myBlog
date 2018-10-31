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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String userName = req.getParameter("username");
		String pwd = req.getParameter("password");
		
		UserDAO userDAO = new UserDAO();
		
		User user = userDAO.findByName(userName);
		
		if(user != null) {
			if(userDAO.findBy(userName, pwd) != null) {
				//System.out.println("用户"+userName+"登录成功！");
				req.getSession().setAttribute("login", user);
				//System.out.println(user.toString());
				out.println("<script>layer.msg('登录成功！',{'icon': 1})</script>");
				res.setHeader("refresh", "2,URL=index.jsp");
				
				//res.sendRedirect("index.jsp");
			}else {
				session.setAttribute("existUser", user.getUserName());
				out.println("<script>layer.msg('密码错误!',{'icon': 2})</script>");
				res.setHeader("refresh", "1,URL=UserLogin.jsp");
				//res.sendRedirect("UserLogin.jsp");
			}
			
		}else {
			out.println("<script>layer.alert('用户不存在，去注册用户！',{'icon': 5})</script>");
			
			//System.out.println("用户"+userName+"不存在，请注册用户！");
			res.setHeader("refresh", "2,URL=UserReg.jsp");
			//res.sendRedirect("UserReg.jsp");
		}
	}

}
