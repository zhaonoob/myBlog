<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/register.css">
<script src="./layui/layui.js"></script>
<title>用户登录</title>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div id="main">
		<div class="layui-container">
			<div class="layui-tab">
				<ul class="layui-tab-title">
					<li class="layui-this">用户登录</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<form class="layui-form" action="login.do" method="post">
							<div class="layui-form-item">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-inline">
									<input class="layui-input" type="text" name="username"
										required="required" lay-verify="required" placeholder="请输入用户名" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">密码</label>
								<div class="layui-input-inline">
									<input class="layui-input" type="password" name="password"
										required="required" lay-verify="required" placeholder="请输入密码" />
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit="lay-submit"
										lay-filter="formDemo">立即提交</button>
									<button class="layui-btn layui-btn-primary" type="reset">重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">	
		layui.use(['form'], function(){
			  const form = layui.form;
			  const $ = layui.$

			  //自定义验证规则
			  form.verify({
			  }); 
			  
			});
	</script>
</body>
</html>