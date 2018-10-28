<%@page import="com.zhao.module.User"%>
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
<link rel="stylesheet" href="./css/admin1.css" media="all">
<script src="./layui/layui.js"></script>
<style>
.layui-side, .layui-body {
	top: 60px;
}

.layui-body {
	padding: 15px;
}
.user-avator{
	margin-bottom: 10px;
}

</style>
</head>
<body>
	<%
		User user = (User)session.getAttribute("login");
	%>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<!-- 后台管理主体部分-->
	<div class="layui-body">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">设置我的资料</div>
          <div class="layui-card-body" pad15>
            <form action="updateInfo.do" method="post">
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" name="username" value="<%=user.getUserName() %>" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                  <input type="number" name="phone" value="<%=user.getPhone() %>" lay-verify="" autocomplete="off" class="layui-input" placeholder="请输入手机号码">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <input type="text" name="email" value="<%=user.getEmail() %>" lay-verify="email" autocomplete="off" class="layui-input" placeholder="请输入邮箱地址">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">QQ</label>
                <div class="layui-input-inline">
                  <input type="number" name="qq" value="<%=user.getQq() %>" lay-verify="qq" autocomplete="off" class="layui-input" placeholder="请输入qq号码">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-input-inline">
                  <input name="avator" lay-verify="required" id="LAY_avatarSrc" placeholder="图片地址" value="<%=user.getAvator() %>" class="layui-input">
                </div>
                <div class="layui-input-inline layui-btn-container" style="width: auto;">
                  <button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                  </button>
                  <img alt="avator" src="<%=user.getAvator() %>" class="user-avator layui-nav-img">
                  
                </div>
             </div>
              <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                  <textarea name="info" placeholder="请输入内容" class="layui-textarea"><%=user.getInfo() %></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                  <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>layui.use(['element','form'], function(){
  var element = layui.element;
  const $ = layui.$
//自定义验证规则
  form.verify({
    pass: function(value){
    	const oldPwd = $("input[name='oldPassword']").val();
    	if(value==""){
    		return "不能为空！"
    	}
    	else if(oldPwd==value){
    		return "新密码与旧密码最好不能相同！"
    	}
    }
    ,repass:function(value){
        var pvalue = $("input[name='password']").val();
        if(pvalue!=value){
            return "两次输入的密码不一致";
        }
    },
    oldPassword: function(value){
		  const oldPwd = $("input[name='isOldPwd']").val();
		  if(value == ""){
			  return "请输入当前密码！"
		  }
		  else if(oldPwd!=value){
			  return "当前密码错误！"
		  }
	  }
  }); 
  $("a").each((i, v) => {
    const a_href = $(v).prop('href')

    
    if(a_href === location.href){
      $('li').eq(i).addClass("layui-this")
    }
    
  })
});</script>
</body>
</html>