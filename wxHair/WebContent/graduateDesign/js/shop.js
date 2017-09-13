var shop={
	init:function(){},
	bindEvent:function(){},
	changeType:function(){},
	strategies:{},
	shopId:""
};
shop.init = function(){
	if(window.location.href.indexOf("?") != -1){
		var arr = window.location.href.split("?");
		var arrValue = arr[1].split("=");
		shop.shopId = arrValue[1];
	}	
	//用来显示用户名
	if(localStorage.getItem("name")){
		$(".hd_right span").text("用户名："+localStorage.getItem("name"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/signIn.jsp" style="color: white;">注销</a>');
	}
	//请求商店服务数据
//	var ajaxObj =  $.ajax({
//		url: "shopController/getShopList.action",
//		type: "post",
//		dataType:'json',
//		data: "",
//		success: function(res){
//			if(res){
//				for(var i=0;i<res.length;i++){
//				   var html = '<div class="item" id="firstItem" shopId="'+res[i].id+'"><img class="item-img" src="graduateDesign/img/shop'+(i+1)+'.jpg"  />'+
//					'<div class="item-content"><div class="item-content-hd">'+res[i].name+'</div>'+				
//					'<div class="item-content-bd"><span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>'+
//					'<span>'+res[i].address+'</span></div></div></div>';
//				   $(".main").append(html);
//				}
//			}
//		}
//			
//	});
	//请求发型师数据
	var ajaxObj =  $.ajax({
		url: "shopController/getStylist.action",
		type: "post",
		dataType:'json',
		data: {"shopId":shop.shopId},
		success: function(res){
			if(res){
				for(var i = 0;i < res.length;i++){
					var html='<option value="'+i+'">'+res[i]+'</option>';
					$("#selectStylist").append(html);
				}
			}
			
		}
			
	});
	//请求服务数据
	var ajaxObj =  $.ajax({
		url: "shopController/getService.action",
		type: "post",
		dataType:'json',
		data: {"shopId":shop.shopId},
		success: function(res){
			if(res){
				$("#hairType").text(res[0].service);
				$("#hairCost").text(res[0].price);
				$("#hairTime").text(res[0].needTime);
				for(var i = 0;i < res.length;i++){
					var html='<option value="'+i+'">'+res[i].service+'</option>';
					$("#selectType").append(html);
					(function(i){
					var hairType = res[i].service;
					var hairCost = res[i].price;
					var hairTime = res[i].needTime;
					shop.strategies[i] = function(){
						$("#hairType").text(hairType);
						$("#hairCost").text(hairCost);
						$("#hairTime").text(hairTime);
					}
				   })(i);
				}
			}
			
		}
			
	});
	//使用datetimepicker插件
	$(".dateTime").datetimepicker({
			 	 format: 'yyyy-mm-dd hh:ii',			 
			 	 bootcssVer:3,
			 	 language:'zh-CN',
			 	 startDate:new Date(),
			 	 autoclose:true
	});
	this.bindEvent();
};
shop.changeType = function(type){
	this.strategies[type]();
}

shop.bindEvent = function(){
	$("#selectType").on("change",function(){
		shop.changeType($(this).val());		
	});
	$("#evalCell").on("click",function(){
		window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/evaluateList.jsp?shopId="+shop.shopId;
	});
	//为确定按钮绑定事件
	$("#commitBtn").on("click",function(){
		if(!localStorage.getItem("name")){
			$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
		        $('#dialog2').off('click').hide();
		    });
			$("#dialog2 .weui_dialog_bd").text("请先登录");
			return false;
		}
		if($("#dateTime").val() == ""){
			$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
		        $('#dialog2').off('click').hide();
		    });
			$("#dialog2 .weui_dialog_bd").text("请先预约时间");
			return false;
		}
		var orders={};
		orders.userName = localStorage.getItem("name");
		orders.shopId = shop.shopId;
		orders.hairType = $("#hairType").text();
		orders.hairCost = $("#hairCost").text();
		orders.hairTime = $("#hairTime").text();
		orders.dateTime = Date.parse($("#dateTime").val());		
		orders.stylist = $("#selectStylist option").eq($("#selectStylist").val()).text();
		orders.stat = "已提交";
		var ajaxObj =  $.ajax({
			url: "ordersController/submitOrders.action",
			type: "post",
			dataType:'json',
			data: orders,
			success: function(res){
				if(res.msg == "ok"){		
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				        window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/order.jsp";
				    });
					$("#dialog2 .weui_dialog_bd").text("订单提交成功");
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("订单提交失败");
				}
				
			}
				
		});
	});
	
};
$(function(){
	shop.init();
});