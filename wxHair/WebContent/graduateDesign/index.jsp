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
		<title>首页</title>		
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" href="graduateDesign/css/bootstrap.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/weui.css" />
		<link rel="stylesheet" href="graduateDesign/css/swiper.min.css" />
		<link rel="stylesheet" href="graduateDesign/css/index.css" />
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
		<div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide"><img src="graduateDesign/img/img1.jpg" width="100%" /></div>
	            <div class="swiper-slide"><img src="graduateDesign/img/img2.jpg" width="100%" /></div>
	            <div class="swiper-slide"><img src="graduateDesign/img/img3.jpg" width="100%" /></div>
	            <div class="swiper-slide"><img src="graduateDesign/img/img4.jpg" width="100%" /></div>
	        </div>
	        <!-- Add Pagination -->
	        <div class="swiper-pagination"></div>
	        <!-- Add Arrows -->
	        <div class="swiper-button-next"></div>
	        <div class="swiper-button-prev"></div>
   		 </div>
   		<aside>
   			<div class="tab">
   				<span>美发平台</span>
   			</div>
   			<div class="tab" style="background-color:transparent;color: #f3f3f3;border-top:0px;">
   				<span>订单量排行</span>
   			</div>
   		</aside>
		<div class="main">		
		<!--	 <div class="item">
				<img class="item-img" src="graduateDesign/img/image.jpg"  /> 
				<div class="item-content">
					<div class="item-content-hd">1、华南农业大学-美发</div>
					<div class="item-content-bd">
						<span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>
						<span>广州天河区五山路华南农业大学华山学生公寓第3栋一楼架空层</span>
						<br/><span class="orderNum">订单数：5</span>
					</div>
				</div>
			</div>
		 	
			<div class="item">
				<img class="item-img" src="graduateDesign/img/image.jpg"  /> 
				<div class="item-content">
					<div class="item-content-hd">华南农业大学-美发</div>
					<div class="item-content-bd">
						<span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>
						<span>广州天河区五山路华南农业大学华山学生公寓第3栋一楼架空层</span>
					</div>
				</div>
			</div> -->
		</div>
		<div id="loadingToast" class="weui_loading_toast" style="display:none;">
		    <div class="weui_mask_transparent"></div>
		    <div class="weui_toast">
		        <div class="weui_loading">
		            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
		            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
		        </div>
		        <p class="weui_toast_content">数据加载中</p>
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
		<nav class="navbar navbar-default navbar-fixed-bottom" id="bottom">
			<div id="homePage">
				<img src="graduateDesign/img/homePage.png" />
				<div><span>预约</span></div>
			</div>
			<div id="order">
				<img src="graduateDesign/img/order.png" />
				<div><span>订单</span></div>
			</div>
			<div id="search">
				<img src="graduateDesign/img/search.png" />
				<div><span>查询</span></div>
			</div>
			<!--<div id="ranked">
				<img src="img/rank.png" />
				<div><span>排行</span></div>
			</div>-->
		</nav>
		<script type="text/javascript" src="graduateDesign/js/jquery.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/swiper.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/common.js" ></script>
		<script type="text/javascript" src="graduateDesign/js/index.js" ></script>
		
	</body>
</html>
