package com.zhao.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String userName = req.getParameter("username");
		String pwd = req.getParameter("password");
		
		UserDAO userDAO = new UserDAO();
		
		User user = userDAO.findByName(userName);
		
		if(user != null) {
			if(userDAO.findBy(userName, pwd) != null) {
				System.out.println("用户"+userName+"登录成功！");
				req.getSession().setAttribute("login", user);
				res.sendRedirect("index.jsp");
			}else {
				System.out.println("用户名密码错误，登录失败！");
				res.sendRedirect("UserLogin.jsp");
			}
			
		}else {
			System.out.println("用户"+userName+"不存在，请注册用户！");
			res.sendRedirect("UserReg.jsp");
		}
	}

}
