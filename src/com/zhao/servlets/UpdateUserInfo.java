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
 * Servlet implementation class UpdateUserInfo
 */
@WebServlet("/updateInfo.do")
public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfo() {
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
		UserDAO userDAO = new UserDAO();
		out.println("<script src='layer/jquery-1.10.2.js'></script>");
		out.println("<script src='layer/layer.js'></script>");
		int uid = user.getId();
		String userName = req.getParameter("username");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String qq = req.getParameter("qq");
		String avator = req.getParameter("avator");
		String info = req.getParameter("info");
		
		User newUser = new User();
		
		if(userName.equalsIgnoreCase(user.getUserName())) {
			newUser.setId(uid);
			newUser.setUserName(userName);
			newUser.setPhone(phone);
			newUser.setEmail(email);
			newUser.setQq(qq);
			newUser.setAvator(avator);
			newUser.setInfo(info);
			
			if(userDAO.update(newUser) > 0) {
				res.sendRedirect("user.jsp");
				session.setAttribute("login", newUser);
			}else {
				System.out.println("修改失败");
				res.sendRedirect("index.jsp");
			}
		}
		else if(userDAO.findByName(userName) == null) {		
			newUser.setId(uid);
			newUser.setUserName(userName);
			newUser.setPhone(phone);
			newUser.setEmail(email);
			newUser.setQq(qq);
			newUser.setAvator(avator);
			newUser.setInfo(info);
			
			if(userDAO.update(newUser) > 0) {
				res.sendRedirect("user.jsp");
				session.setAttribute("login", newUser);
			}else {
				System.out.println("修改失败");
				res.sendRedirect("index.jsp");
			}
		}else {
			out.println("<script>layer.alert('用户名已被占用，请重新输入!',{'icon': 5})</script>");
			res.setHeader("refresh", "3,URL=user.jsp");
		}	
	}
}
