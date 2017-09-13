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
		<title>注册</title>	
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
                        <h3>商家注册</h3>
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
					<label class="col-xs-4 control-label">确认密码：</label>
					<div class="col-xs-6">
	                    <input type="password" class="form-control" name="confirmPass" placeholder="确认密码" />
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
			    <section>
				<div class="form-group">
					<div class="col-xs-12">
						<label class="col-xs-4 control-label">服务类型：</label>
						<div class="col-xs-6">
		                    <input type="text" class="form-control" name="service" placeholder="服务类型" />
		                </div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<label class="col-xs-4 control-label">价格：</label>
						<div class="col-xs-6">
		                    <input type="text" class="form-control" name="price" placeholder="价格" />
		                </div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<label class="col-xs-4 control-label">需要时间：</label>
						<div class="col-xs-6">
		                    <input type="text" class="form-control" name="needTime" placeholder="需要时间" />
		                </div>
					</div>
				</div>
				</section>
			</div>
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span><span class="addService">点击增加服务</span>
			<div class="form-group">
                <div class="col-xs-9 col-xs-offset-6">
                    <button type="submit" class="btn btn-primary" name="signUp" value="Sign up">注册</button>                
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
		<script type="text/javascript" src="graduateDesign/js/shopRegister.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/shopCommon.js" ></script>
	</body>
</html>
