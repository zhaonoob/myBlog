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
<title>文章详情</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/article.css">
<link rel="stylesheet" type="text/css" href="./simditor/css/simditor.css" />
<script src="./layui/layui.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<%
		ArticleInfo article = (ArticleInfo)session.getAttribute("showArticle");
		User user = (User)session.getAttribute("login");
	%>
	<div class="layui-container">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="content default-box layui-text">
					<h1 class="art-title text-center"
						data-artid="5bd1b769ebf79061c4c04157"><%=article.getTitle() %></h1>
					<div class="other-info text-center">
						<span><%=article.getUserName() %></span><span>&nbsp;&nbsp;发表于：</span><span><fmt:formatDate value="<%=article.getPub_date() %>" pattern="yyyy-MM-dd HH:mm:ss"/></span><span>&nbsp;分类：</span><span><%=article.getArticletype() %></span>
					</div>
					<div class="article-detail simditor" style="padding: 10px;">
						<div class="simditor-wrapper">
							<div class="simditor-body"><%=article.getContent() %></div>
						</div>
					</div>
				</div>
				<div class="comment default-box">
					<fieldset class="text-center">
						<legend>评论</legend>
					</fieldset>
					<div class="txt">
						<textarea id="comment-txt"></textarea>
						<button class="layui-btn">回复</button>
					</div>
					<ul class="comment-list"></ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./js/index.js"></script>
	<script src="./js/article.js"></script>
</body>
</html>