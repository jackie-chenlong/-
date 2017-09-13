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
		<title>评价店家</title>
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" href="graduateDesign/css/weui.css" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrap.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/common.css" />
		<link rel="stylesheet" href="graduateDesign/css/evaluate.css"  />
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
		<div id="main" >
		    <div class="item-content">
		   	 <div class="item-content-hd">潮流前线</div>
			    <div class="item-content-bd">
			    <span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>
			    <span class="shopAddress">广州天河区五山路华南农业大学华山区</span>
			    </div>
		    </div>
			
		    <div class="weui_cells weui_cells_form">
		        <div class="weui_cell">
		            <div class="weui_cell_bd weui_cell_primary">
		                <textarea class="weui_textarea" id="evalText" placeholder="请输入评论" rows="3"></textarea>
		                <div class="weui_textarea_counter"><span>0</span>/200</div>
		            </div>
		        </div>
		    </div>
			
			<div class="weui_cells">
			<a href="javascript:;" class="weui_btn weui_btn_primary" id="commitBtn" style="margin:0px 4px;">确认</a>
			</div>
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
		<script type="text/javascript" src="graduateDesign/js/evaluate.js" ></script> 
	</body>

</html>