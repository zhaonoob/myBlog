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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String qq = req.getParameter("qq");
		String info = req.getParameter("self-info");
		
		
		User user = new User(userName, pwd, email, phone, qq, info);
		
		UserDAO userDAO = new UserDAO();
		
		if(userDAO.findBy(userName,pwd) != null) {
			System.out.println("用户已注册！即将跳到登录界面");
			res.sendRedirect("UserLogin.jsp");
		}
		else if(userDAO.insert(user) > 0) {
			System.out.println("注册成功");
			req.getSession().setAttribute("login", user);
			res.sendRedirect("index.jsp");
		}else {
			System.out.println("注册失败");
			res.sendRedirect("UserReg.jsp");
		}
	}
}
