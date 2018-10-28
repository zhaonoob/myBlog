<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 导航-->
<div class="blog-header layui-bg-black">
	<div class="layui-container">
		<ul class="layui-nav">
			<li class="layui-nav-item" id="haha"><a href="index.jsp"><i
					class="layui-icon layui-icon-home"> </i>首页</a></li>
		</ul>
		<ul class="layui-nav blog-user">
			<li class="layui-nav-item"><a href="logout.do">退了</a></li>
		</ul>
	</div>
</div>
<!-- 左侧导航-->
<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">
		<ul class="layui-nav layui-nav-tree" lay-filter="list">
			<li class="layui-nav-item"><a href="user.jsp">基本设置</a></li>
			<li class="layui-nav-item"><a href="UpdatePwd.jsp">密码修改</a></li>
			<li class="layui-nav-item"><a href="article.jsp">文章管理</a></li>
			<li class="layui-nav-item"><a href="comment.jsp">评论管理</a></li>
		</ul>
	</div>
</div>