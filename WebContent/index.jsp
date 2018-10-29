<%@page import="com.zhao.module.ArticleInfo"%>
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
		List<ArticleInfo> allArticleList = articleDAO.findAll();
		
		session.setAttribute("allArticleList", allArticleList);
	%>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="blog-panel">
		<div class="layui-container">
			<ul class="layui-clear">
				<li><a href="#">最新</a></li>
				<li><a href="#">热门</a></li>
				<li><a href="#">推荐</a></li>
				<li><a href="#">话题</a></li>
				<li><a href="#">我的</a></li>
			</ul>
			<div class="blog-column-right">
				<%
					User user = (User)session.getAttribute("login");
					if(user != null){
						out.println("<a class='layui-btn' href='pub_article.jsp'>发表文章</a>");
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
					<c:forEach var="item" items="${allArticleList}">
						<li>
							<a class="list-face">
								<img
								src="${item.avator }"
								alt="{&quot;avatar&quot;:&quot;/avatar/1540448450317.png&quot;,&quot;_id&quot;:&quot;5bd160a4ebf79061c4c04155&quot;,&quot;username&quot;:&quot;aaa&quot;}">
							</a>
							<h2>
								<a class="layui-badge">${item.articletype }</a><a class="articlt-title ellipsis"
									href="showArticle.do?id=${item.id }">${ item.title}</a>
							</h2>
							<div class="list-info">
								<a>${item.userName }</a>
								<span>
									<fmt:formatDate value="${item.pub_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<span class="list-reply"><i class="layui-icon layui-icon-file-b" title="评论"></i>${item.count }</span>
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