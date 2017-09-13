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
		<title>商家信息</title>	
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrap.css" />
		<link rel="stylesheet" href="graduateDesign/css/weui.css" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrapValidator.min.css" />	
		<link rel="stylesheet" href="graduateDesign/css/register.css" />
		<link rel="stylesheet" href="graduateDesign/css/common.css" />
	</head>
	<body>
		<header>
			<label class="hd">美发预约平台</label>
			<div class="hd_right">
				<span></span>&nbsp;/
				<a href="graduateDesign/shopRegister.jsp" style="color: white;">注册  </a>
				<a href="graduateDesign/shopSignIn.jsp" style="color: white;">登录</a>
			</div>
		</header>
		<form class="form-horizontal" id="registerForm">
			<div class="page-header" id="header">
                        <h3>商家信息</h3>
             </div>
			<div class="form-group">
				<div class="col-xs-12">
					<label class="col-xs-4 control-label">商店名：</label>
					<div class="col-xs-6">
	                    <input type="text" class="form-control" name="name" placeholder="商店名" />
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
					<label class="col-xs-4 control-label">商店地址：</label>
					<div class="col-xs-6">
	                    <input type="text" class="form-control" name="address" placeholder="商店地址" />
	                </div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<label class="col-xs-4 control-label">发型师：</label>
					<div class="col-xs-6">
	                    <input type="text" class="form-control" name="stylist" placeholder="发型师" />
	                </div>
				</div>
			</div>
			<div class="serviceSection">
				
			</div>
			<div class="form-group">
                <div class="col-xs-9 col-xs-offset-6">
                    <button type="submit" class="btn btn-primary" name="update" value="update">修改</button>                
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
		<nav class="navbar navbar-default navbar-fixed-bottom" id="bottom">
			<div id="order" style=" width: 54%;">
				<img src="graduateDesign/img/order.png" />
				<div><span>订单</span></div>
			</div>
			<div id="homePage">
				<img src="graduateDesign/img/homePage.png" />
				<div><span>信息</span></div>
			</div>
			<!--<div id="search">
				<img src="graduateDesign/img/search.png" />
				<div><span>查询</span></div>
			</div>
			<div id="ranked">
				<img src="img/rank.png" />
				<div><span>排行</span></div>
			</div>-->
		</nav>
		<script type="text/javascript" src="graduateDesign/js/jquery.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrapValidator.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/shopInfo.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/shopCommon.js" ></script>
	</body>
</html>
