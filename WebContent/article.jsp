<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>文章发表页</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<style>
#main .layui-container {
	margin-bottom: 15px;
	margin-top: 76px;
	border-radius: 2px;
	background-color: #fff;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);
	border: 1px solid #fff;
}

.article-add {
	padding-top: 7.5px;
}

.layui-form .layui-form-label {
	width: 110px;
	padding: 8px 15px;
	height: 38px;
	line-height: 20px;
	border: 1px solid #e6e6e6;
	border-radius: 2px 0 0 2px;
	text-align: center;
	background-color: #FBFBFB;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	box-sizing: border-box;
}

.layui-tab-title {
	margin-bottom: 20px;
}
</style>
<script src="./layui/layui.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div id="main">
		<div class="layui-container">
			<div class="article-add layui-form">
				<div class="layui-tab layui-tab-brief" lay-filter="user">
					<ul class="layui-tab-title">
						<li class="layui-this">文章编辑</li>
					</ul>
					<div class="layui-form layui-form-content" id="editing">
						<div class="layui-tab-item layui-show">
							<form action="/article" method="POST">
								<div class="layui-row layui-col-space15 layui-form-item">
									<div class="layui-col-md3">
										<label class="layui-form-label">文章分类</label>
										<div class="layui-input-block">
											<select lay-verify="required" name="tips" lay-filter="column"><option></option>
												<option value="nodejs">nodejs</option>
												<option value="vue">vue</option>
												<option value="react">react</option>
												<option value="angular">angular</option></select>
										</div>
									</div>
									<div class="layui-col-md9">
										<label class="layui-form-label" for="L_title">标题</label>
										<div class="layui-input-block">
											<input class="layui-input" type="text" name="title"
												required="" lay-verify="required" autocomplete="off"
												id="L_title">
										</div>
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<textarea style="display: none;" id="article-content"></textarea>
								</div>
							</form>
						</div>
					</div>
					<div class="layui-form-item">
						<button class="layui-btn" lay-filter="send" lay-submit>立即发布</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./js/article.js"></script>
</body>
</html>