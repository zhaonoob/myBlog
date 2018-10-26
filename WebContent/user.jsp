<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>后台管理</title>
<meta charset="utf-8">
<meta name="author" content="fengyu">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<script src="./layui/layui.js"></script>
<style>
.layui-side, .layui-body {
	top: 60px;
}

.layui-body {
	padding: 15px;
}
</style>
</head>
<body>
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
				<li class="layui-nav-item"><a href="user.jsp">用户管理</a></li>
				<li class="layui-nav-item"><a href="article.jsp">文章管理</a></li>
				<li class="layui-nav-item"><a href="comment.jsp">评论管理</a></li>
				<li class="layui-nav-item"><a href="#">头像上传</a></li>
			</ul>
		</div>
	</div>
	<!-- 后台管理主体部分-->
	<div class="layui-body">
		<table class="layui-table"
			lay-data="{url:'/user/users', page:true, id:'idTest'}"
			lay-filter="demo">
			<thead>
				<tr>
					<th lay-data="{field:'username', align:'center'}">用户名</th>
					<th lay-data="{field:'role', align:'center'}">权限</th>
					<th lay-data="{field:'articleCount', align:'center'}">文章数量</th>
					<th lay-data="{field:'commentCount', align:'center'}">评论数量</th>
					<th
						lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>
				</tr>
			</thead>
		</table>
		<script type="text/html" id="barDemo"><a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></script>
		<script>layui.use(['table', 'layer'], function(){
  const table = layui.table
  const layer = layui.layer
  const $ = layui.$
  
  table.on("tool(demo)", (obj) => {
    const data = obj.data
    const _id = data._id
    //console.log(data)
    if(obj.event !== "del") return

    layer.confirm("确认删除？", () => {
      $.ajax({
        method: "delete",
        url: "/article/" + _id,
        data: {
          _id
        },
        success(res){
          if(res.state){
            layer.msg(res.message, {
              anim: 1,
              time: 800
            }, () => location.reload())
          }else{
            console.error(res.message)
          }
        }
      })
    })
  })
});</script>
	</div>
	<script>layui.use('element', function(){
  var element = layui.element;
  const $ = layui.$

  $("a").each((i, v) => {
    const a_href = $(v).prop('href')

    
    if(a_href === location.href){
      $('li').eq(i).addClass("layui-this")
    }
    
  })
});</script>
</body>
</html>