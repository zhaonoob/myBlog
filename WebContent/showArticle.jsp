<%@page import="com.zhao.module.CommentInfo"%>
<%@page import="com.zhao.dao.CommentDAO"%>
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
		
		CommentDAO commentDAO = new CommentDAO();
		List<CommentInfo> allcommentList = commentDAO.findCommentById(article.getId());
		session.setAttribute("allcommentList", allcommentList);
		
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
					<form action="pub_comment.do?article_id=<%=article.getId() %>" method="post">
						<div class="txt">
							<textarea id="comment-txt" class="layui-hide" name="comment"></textarea>
							<button class="layui-btn">回复</button>
						</div>
					</form>
					<ul class="comment-list">
						<c:forEach var="item" items="${allcommentList}">
							<li><img src="${item.avator }">
								<div>
									<p class="author">${item.userName }</p>
									<p class="time"><fmt:formatDate value="${item.comment_date}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
								</div>
								<div class="she-said">${item.content }</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./js/index.js"></script>
	
	<script type="text/javascript">
		layui.use(['layedit', 'layer', 'element'], function(){
			  const $ = layui.$
			  const layedit = layui.layedit;
			  const layer = layui.layer


			  const idx = layedit.build('comment-txt', {
			    tool: [],
			    height: 160
			  }); //建立编辑器

			  $(".layui-unselect.layui-layedit-tool").hide()

			  

			  $(".comment button").click(async () => {
			    let content = layedit.getContent(idx).trim()

			    if(content.length === 0){
			    	layer.msg("评论内容不能为空")
			    	return false;
			    }

			    const data = {
			      content,
			      article: $(".art-title").data("artid")
			    }

			    $.post("/comment", data, (data) => {
			      layer.msg(data.msg, {
			        time: 1000,
			        end(){
			          if(data.status === 1){
			            // 评论成功就重载页面
			            window.location.reload()
			          }
			        }
			      })
			    })
			  })
			});
		
		</script>
</body>
</html>