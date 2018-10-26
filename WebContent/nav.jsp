<%@page import="com.zhao.module.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="blog-header layui-bg-black">
		<div class="layui-container">
			<ul class="layui-nav">
				<li class="layui-nav-item" id="haha"><a href="index.jsp"><i
						class="layui-icon layui-icon-home"> </i>首页</a></li>
				<li class="layui-nav-item"><a href="#">Web</a></li>
				<li class="layui-nav-item"><a href="#">大数据</a></li>
				<li class="layui-nav-item"><a href="#">Java</a></li>
				<li class="layui-nav-item"><a href="#">Python</a></li>
				<li class="layui-nav-item"><a href="#">关于博主</a></li>
			</ul>
			<%
				User user = (User)session.getAttribute("login");
				if(user != null){
					out.println("<ul class='layui-nav blog-user'>");
					out.println("<li class='layui-nav-item'><a href='user.jsp'>个人中心</a></li>");
					out.println("<li class='layui-nav-item'><a href='#'><img class='layui-nav-img' src='"+user.getAvator() +"'><span>");
					out.println(user.getUserName());
					out.println("</span></a><dl class='layui-nav-child'><dd><a href='logout.do'>退了</a></dd></dl></li>");
					
					out.println("</ul>");
				}else{
					out.println("<ul class='layui-nav blog-user'>");
					out.println("<li class='layui-nav-item'><a href='UserLogin.jsp'>登入</a></li>");
					out.println("<li class='layui-nav-item'><a href='UserReg.jsp'>注册</a></li>");
					out.println("</ul>");
				}
			%>
			<!-- <ul class="layui-nav blog-user">
				<li class="layui-nav-item"><a href="UserLogin.jsp">登入</a></li>
				<li class="layui-nav-item"><a href="UserReg.jsp">注册</a></li>
			</ul> -->
			
			<!-- <ul class="layui-nav blog-user">
				<li class="layui-nav-item"><a href="#">个人中心</a></li>
				<li class="layui-nav-item"><a href="#"><img
						class="layui-nav-img" src="img/default.jpg"><span>aaa</span></a>
				<dl class="layui-nav-child">
						<dd>
							<a href="#">退了</a>
						</dd>
					</dl></li>
			</ul> -->
		</div>
	</div>