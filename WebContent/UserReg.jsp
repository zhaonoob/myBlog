<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta charset="utf-8">
<meta name="author" content="fengyu">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<link rel="stylesheet" href="./css/register.css">
<script src="./layui/layui.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div id="main">
		<div class="layui-container" id="reg">
			<div class="layui-tab">
				<ul class="layui-tab-title">
					<li class="layui-this">用户注册</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<form class="layui-form" action="register.do" method="post" onsubmit="return check()">
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
										required="required" lay-verify="pass" placeholder="请输入密码" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">确认密码</label>
								<div class="layui-input-inline">
									<input class="layui-input" type="password" name="confirmPWD"
										required lay-verify="repass" placeholder="请确认密码">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">email</label>
								<div class="layui-input-inline">
									<input class="layui-input" type="email" name="email"
										required lay-verify="required" placeholder="请输入邮箱">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">phone</label>
								<div class="layui-input-inline">
									<input class="layui-input" type="number" name="phone"
										 lay-verify="" placeholder="请输入电话号码(非必填)">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">QQ</label>
								<div class="layui-input-inline">
									<input class="layui-input" type="number" name="qq"
										 lay-verify="" placeholder="请输入Q  Q号码(非必填)">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">备注</label>
								<div class="layui-input-inline">
									<textarea class="layui-textarea" rows="10" placeholder="说点什么吧..." name="self-info"></textarea>
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
			    pass: [/(.+){4,12}$/, '密码必须4到12位']
			    ,repass:function(value){
			        var pvalue = $("input[name='password']").val();
			        if(pvalue!=value){
			            return "两次输入的密码不一致";
			        }
			    }
			  }); 
			  
			});
	</script>
</body>
</html>