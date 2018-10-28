<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>文章发表页</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<link rel="stylesheet" type="text/css" href="./simditor/css/simditor.css" />
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
							<form action="article.do" method="POST">
								<div class="layui-row layui-col-space15 layui-form-item">
									<div class="layui-col-md3">
										<label class="layui-form-label">文章分类</label>
										<div class="layui-input-block">
											<select lay-verify="required" name="tips" lay-filter="column"><option></option>
												<option value="nodejs">nodejs</option>
												<option value="vue">vue</option>
												<option value="react">react</option>
												<option value="angular">angular</option>
												<option value="jsp">jsp</option>
												<option value="java">java</option>
												<option value="servlet">servlet</option>
												<option value="js">js</option>
												<option value="php">php</option>
												<option value="python">python</option>
												<option value="share">经验分享</option>
											</select>
										</div>
									</div>
									<div class="layui-col-md9">
										<label class="layui-form-label" for="L_title">标题</label>
										<div class="layui-input-block">
											<input class="layui-input" type="text" name="title"
												required lay-verify="required" autocomplete="off"
												id="L_title">
										</div>
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<textarea id="editor"
										name="content" autofocus></textarea>
								</div>
								<div class="layui-form-item">
									<button class="layui-btn" lay-filter="send" lay-submit id="publish-article">立即发布</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./js/article.js"></script>
	<!-- 引入以下 simditor 文本编辑器需要的js -->
		<script type="text/javascript" src="./simditor/js/jquery.min.js"></script>
		<script type="text/javascript" src="./simditor/js/module.js"></script>
		<script type="text/javascript" src="./simditor/js/hotkeys.js"></script>
		<script type="text/javascript" src="./simditor/js/uploader.js"></script>
		<script type="text/javascript" src="./simditor/js/simditor.js"></script>
		
		<script>
			(function () {
				$(function () {
					// 编辑器初始化
					var editor, toolbar;
					Simditor.locale = 'zh-CN';
					toolbar = ['title', 'bold', 'italic', 'underline', 'fontScale', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent', 'alignment'];
					editor = new Simditor({
						textarea: $('#editor'),
						placeholder: '开始书写你的 idea ^_^',
						toolbar: toolbar,
						pasteImage: true,
						defaultImage: './images/image.png',
						upload: {
							url: 'ImgUpload.action', //文件上传的接口地址
							params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
							fileKey: 'fileDataFileName', //服务器端获取文件数据的参数名
							connectionCount: 3,
							leaveConfirm: '正在上传文件'
						}
					});

					// 测试文本的获取,打印在控制台上，该按钮自行创建
					$('#publish-article').on('click', function (e) {
						console.log(editor.getValue());
					})
				});

			}).call(this);
		</script>
</body>
</html>