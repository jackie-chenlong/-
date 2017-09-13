<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		 <base href="<%=basePath%>" />
		<meta charset="utf-8" />
		<title>登录</title>	
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrap.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/weui.css" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrapValidator.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/register.css" />
		<link rel="stylesheet" href="graduateDesign/css/common.css" />
	</head>
	<body>
		<header>
			<label class="hd">美发预约平台</label>
			<div class="hd_right">
				<span></span>&nbsp;/
				<a href="graduateDesign/register.jsp" style="color: white;">注册  </a>
				<a href="graduateDesign/signIn.jsp" style="color: white;">登录</a>
			</div>
		</header>
		<form class="form-horizontal" id="signInForm">
			<div class="page-header" id="header">
                        <h3>登录</h3>
             </div>
			<div class="form-group">
				<div class="col-xs-12">
					<label class="col-xs-4 control-label">用户名：</label>
					<div class="col-xs-6">
	                    <input type="text" class="form-control" name="name" placeholder="姓名" />
	                </div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<label class="col-xs-4 control-label">密码：</label>
					<div class="col-xs-6">
	                    <input type="password" class="form-control" name="password" placeholder="密码" />
	                </div>
				</div>
			</div>
		   <div class="form-group">
				<div class="col-xs-12">
				     <label class="col-xs-4 control-label">验证码：</label>
				     <div class="col-xs-6">
	                     <input type="text" class="form-control" name="pic" placeholder="图形验证码" />                     
	                     <img src="userController/loadPic.action" id="pic" style="margin-top:4px;"/>
	                     <a>看不清，换一张</a>
	                 </div>
	                     
				</div>
			</div>
			<div class="form-group">
                <div class="col-xs-9 col-xs-offset-6">
                    <button type="submit" class="btn btn-primary" name="signIn" value="Sign in ">登录</button>               
                     <a href="graduateDesign/register.jsp">请先注册</a>
                </div>
             </div>
		</form>
		<div class="weui_dialog_alert" id="dialog2" style="display: none;">
		    <div class="weui_mask"></div>
		    <div class="weui_dialog">
		        <div class="weui_dialog_hd"><strong class="weui_dialog_title">提示</strong></div>
		        <div class="weui_dialog_bd">用户名不存在或密码错误</div>
		        <div class="weui_dialog_ft">
		            <a href="javascript:;" class="weui_btn_dialog primary" id="dialogBtn">确定</a>
		        </div>
		    </div>
		</div>
		<script type="text/javascript" src="graduateDesign/js/jquery.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrapValidator.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/signIn.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/common.js" ></script>
		
	</body>
</html>
