<%@page import="com.zhao.module.CommentInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.zhao.dao.CommentDAO"%>
<%@page import="com.zhao.module.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.laytable-cell-1-article {
	width: 502px;
}

.laytable-cell-1-content {
	width: 502px;
}

.laytable-cell-1-created {
	width: 502px;
}

.laytable-cell-1-3 {
	width: 178px;
}
</style>
</head>
<body>
<%
	User user = (User)session.getAttribute("login");
	CommentDAO commentDAO = new CommentDAO();
	List<CommentInfo> commentList = commentDAO.findCommentByUserName(user.getUserName());
	
	session.setAttribute("commentList", commentList);
%>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<!-- 后台管理主体部分-->
	<div class="layui-body">
		<div class="layui-form layui-border-box layui-table-view"
		lay-filter="LAY-table-1" style="">
		<div class="layui-table-box">
			<div class="layui-table-header">
				<table cellspacing="0" cellpadding="0" border="0"
					class="layui-table">
					<thead>
						<tr>
							<th data-field="article"><div
									class="layui-table-cell laytable-cell-1-article" align="center">
									<span>被评文章</span>
								</div></th>
							<th data-field="content"><div
									class="layui-table-cell laytable-cell-1-content" align="center">
									<span>评论内容</span>
								</div></th>
							<th data-field="created"><div
									class="layui-table-cell laytable-cell-1-created" align="center">
									<span>评论时间</span>
								</div></th>
							<th data-field="3"><div
									class="layui-table-cell laytable-cell-1-3" align="center">
									<span>操作</span>
								</div></th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="layui-table-body layui-table-main">
				<table cellspacing="0" cellpadding="0" border="0"
					class="layui-table">
					<tbody>
						<c:forEach var="item" items="${sessionScope.commentList }">
							<tr data-index="0" class="">
								<td data-field="article" align="center"
									data-content="[object Object]"><div
										class="layui-table-cell laytable-cell-1-article"><a href="showArticle.do?id=${item.article_id }">${item.title }</a></div></td>
								<td data-field="content" align="center"><div
										class="layui-table-cell laytable-cell-1-content">${item.content }</div></td>
								<td data-field="created" align="center"
									data-content="2018-10-27T04:53:58.035Z"><div
										class="layui-table-cell laytable-cell-1-created"><fmt:formatDate value="${item.comment_date}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
								<td data-field="3" align="center" data-off="true"><div
										class="layui-table-cell laytable-cell-1-3">
										<a class="layui-btn layui-btn-danger layui-btn-xs"
											lay-event="del" href="delComment.do?c_id=${item.comment_id }">删除</a>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="layui-table-page">
			<div id="layui-table-page1">
				<div class="layui-box layui-laypage layui-laypage-default"
					id="layui-laypage-1">
					<a href="javascript:;" class="layui-laypage-prev layui-disabled"
						data-page="0"><i class="layui-icon"></i></a><span
						class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>1</em></span><a
						href="javascript:;" class="layui-laypage-next layui-disabled"
						data-page="2"><i class="layui-icon"></i></a><span
						class="layui-laypage-skip">到第<input type="text" min="1"
						value="1" class="layui-input">页
						<button type="button" class="layui-laypage-btn">确定</button></span><span
						class="layui-laypage-count">共 1 条</span><span
						class="layui-laypage-limits"><select lay-ignore=""><option
								value="10" selected="">10 条/页</option>
							<option value="20">20 条/页</option>
							<option value="30">30 条/页</option>
							<option value="40">40 条/页</option>
							<option value="50">50 条/页</option>
							<option value="60">60 条/页</option>
							<option value="70">70 条/页</option>
							<option value="80">80 条/页</option>
							<option value="90">90 条/页</option></select></span>
				</div>
			</div>
		</div>
	</div>
		<script type="text/html" id="barDemo"><a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></script>
		<script>layui.use(['table', 'layer'], function(){
  const table = layui.table
  const layer = layui.layer
  const $ = layui.$
  
  table.on("tool(demo)", (obj) => {
    const data = obj.data
    // 评论id
    const commentId = data._id
    // 文章id
    const articleId = data.article._id


    if(obj.event !== "del") return

    layer.confirm("确认删除？", () => {
      $.ajax({
        method: "delete",
        url: "/comment/" + commentId,
        data: {
          // 发送文章id值，减少后台查询
          articleId
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
})</script>
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