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
.hideInput{
	display: none;
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
          <div class="layui-card-header">修改密码</div>
          <div class="layui-card-body" pad15>
            <form action="updatePwd.do" method="post">
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" name="oldPassword" lay-verify="oldPassword" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" name="password" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">4到12个字符</div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">确认新密码</label>
                <div class="layui-input-inline">
                  <input type="password" name="repassword" lay-verify="repass" lay-verType="tips" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item" style="display: none;">
                <label class="layui-form-label" style="display: none;"></label>
                <div class="layui-input-inline" style="display: none;">
                  <input type="password" value="<%=user.getPwd() %>" name="isOldPwd" lay-verify="isOldPwd" lay-verType="tips" autocomplete="off" class="layui-input" style="display: none;">
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="setmypass">确认修改</button>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>layui.use(["element","form"], function(){
  const element = layui.element;
  const form = layui.form;
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