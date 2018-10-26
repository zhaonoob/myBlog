<%@page import="com.zhao.module.Article"%>
<%@page import="java.util.List"%>
<%@page import="com.zhao.dao.ArticleDAO"%>
<%@page import="com.zhao.module.User"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>博客首页</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<link rel="stylesheet" href="./css/index.css">
<script src="./layui/layui.js"></script>
</head>
<body>
	<%
		ArticleDAO articleDAO = new ArticleDAO();
		List<Article> articleList = articleDAO.findAll();
		
		session.setAttribute("articleList", articleList);
	%>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="blog-panel">
		<div class="layui-container">
			<ul class="layui-clear">
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML</a></li>
			</ul>
			<div class="blog-column-right">
				<%
					User user = (User)session.getAttribute("login");
					if(user != null){
						out.println("<a class='layui-btn' href='article.jsp'>发表文章</a>");
					}else{
						out.println("<a class='layui-btn' href='UserLogin.jsp'>发表文章</a>");
					}
				%>
			</div>
		</div>
	</div>
	<div class="layui-container">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				<ul class="article-list">
					<li>
						<a class="list-face">
							<img
							src="img/1.jpg"
							alt="{&quot;avatar&quot;:&quot;/avatar/1540448450317.png&quot;,&quot;_id&quot;:&quot;5bd160a4ebf79061c4c04155&quot;,&quot;username&quot;:&quot;aaa&quot;}">
						</a>
						<h2>
							<a class="layui-badge">react</a><a class="articlt-title ellipsis"
								href="/article/5bd160daebf79061c4c04156">dasd</a>
						</h2>
						<div class="list-info">
							<a>aaa</a>
							<span>2018-10-25 14:21:14</span>
							<span class="list-reply"><i class="layui-icon layui-icon-file-b" title="评论"></i>0</span>
						</div>
					</li>
					<c:forEach var="item" items="${articleList}">
						<li>
							<a class="list-face">
								<img
								src="img/1.jpg"
								alt="{&quot;avatar&quot;:&quot;/avatar/1540448450317.png&quot;,&quot;_id&quot;:&quot;5bd160a4ebf79061c4c04155&quot;,&quot;username&quot;:&quot;aaa&quot;}">
							</a>
							<h2>
								<a class="layui-badge">dasdsa</a><a class="articlt-title ellipsis"
									href="/article/5bd160daebf79061c4c04156">${ item.title}</a>
							</h2>
							<div class="list-info">
								<a>aaa</a>
								<span>
									<fmt:formatDate value="${item.pub_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<span class="list-reply"><i class="layui-icon layui-icon-file-b" title="评论"></i>0</span>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div id="laypage" data-maxNum="2"></div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">公告</div>
					<div class="layui-card-body">
						JSP+Servlet<br>实现一个简易的博客系统<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./js/index.js"></script>
</body>
</html>