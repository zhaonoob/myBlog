<%@ page language="java" pageEncoding="UTF-8"%>
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
				<a class="layui-btn" href="article.jsp">发表文章</a>
			</div>
		</div>
	</div>
	<div class="layui-container">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				<ul class="article-list"></ul>
				<div id="laypage" data-maxNum="0"></div>
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