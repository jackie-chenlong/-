<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		 <base href="<%=basePath%>" />
		<meta charset="UTF-8">
		<title>店家</title>
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" href="graduateDesign/css/weui.css" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrap.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/common.css" />
		<link rel="stylesheet" href="graduateDesign/css/evaluateList.css"  />
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
		<div id="main">
		   <nav>
		    	<span class="glyphicon glyphicon-arrow-left" id="backBtn" aria-hidden="true"></span>
		    	<label>评价内容</label>
		   </nav>		   
			
		</div>
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
		<script type="text/javascript" src="graduateDesign/js/jquery.min.js"></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="graduateDesign/js/common.js" ></script>
	    <script type="text/javascript" src="graduateDesign/js/evaluateList.js" ></script>
	</body>

</html>