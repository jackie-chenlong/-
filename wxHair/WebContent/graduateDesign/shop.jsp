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
		<link rel="stylesheet" href="graduateDesign/css/bootstrap-datetimepicker.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/shop.css"  />
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
			<section>
				<div class="weui_cells">
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p style="color: #88a7ec;">选择服务</p>
						</div>
						<div class="weui_cell_ft" id="hairType">精剪</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>参考价格</p>
						</div>
						<div class="weui_cell_ft" id="hairCost">￥20</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>理发时间</p>
						</div>
						<div class="weui_cell_ft" id="hairTime">10分钟</div>
					</div>
					
				</div>
			</section>
			<section>			
				<div id="selectTime">
					<label id="timeLabel">预约时间</label>
					<input type="text" class="dateTime" id="dateTime" value="" readonly/>
				</div>
			</section>
			<section>
				<div class="weui_cells">
					<div class="weui_cell weui_cell_select weui_select_after">
						<div class="weui_cell_hd">
							<label for="" class="weui_label">理发类型</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<select class="weui_select" id="selectType" name="select1">					
							</select>
						</div>
					</div>
					<div class="weui_cell weui_cell_select weui_select_after">
						<div class="weui_cell_hd">
							<label for="" class="weui_label">选择发型师</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<select class="weui_select" id="selectStylist" name="select2">
							</select>
						</div>
					</div>
					<div class="weui_cell" id="evalCell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>评价内容</p>
						</div>
						<div class="weui_cell_ft">></div>
					</div>
				</div>
			</section>
			
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
		<script type="text/javascript" src="graduateDesign/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrap-datetimepicker.zh-CN.js"></script>
		<script type="text/javascript" src="graduateDesign/js/common.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/shop.js" ></script>
	</body>

</html>