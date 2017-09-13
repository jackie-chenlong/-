var shopIndex={
	init:function(){},
	bindEvent:function(){}
};
shopIndex.init = function(){
	if(localStorage.getItem("shopName")){
		$("#loadingToast").show();
		$(".hd_right span").text("商家名："+localStorage.getItem("shopName"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/shopSignIn.jsp" style="color: white;">注销</a>');
		//请求订单数据
		var ajaxObj =  $.ajax({
			url: "ordersController/getOrdersListByShopId.action",
			type: "post",
			dataType:'json',
			data: {"name":localStorage.getItem("shopName"),"nowTime":Date.parse(new Date())},
			success: function(res){
				$("#loadingToast").hide();
				if(res.length != 0){
					var html = "";
					for(var i = 0;i < res.length;i++){		
						if(res[i].waitNum > 0){
							res[i].waitNum = res[i].waitNum - 1;
						}
						var date = new Date(parseInt(res[i].time));
						var time = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
					    if(res[i].stat == "已提交"){
							html = html +'<section class="order-item"><div class="item-hd"><div class="order-shop">用户名 ： '+res[i].userName+'</div>'+
							'<div class="order-type">'+res[i].stat+'</div></div><div class="item-bd"><img class="shopImg" src="graduateDesign/img/img2.jpg" />'+
							'<div class="item-bd-right"><div class="priceItem"><span class="glyphicon glyphicon-usd priceItem-img" aria-hidden="true"></span>'+				
							'<div class="priceItem-bd"><span>服务价格：</span><div class="price">'+res[i].price+'</div></div></div><div class="hairTypeItem">'+
							'<span class="glyphicon glyphicon-tag hairTypeItem-img" aria-hidden="true"></span><div class="hairTypeItem-bd">'+
							'<span>理发类型：</span><div class="hairType">'+res[i].service+'</div></div></div><div class="timeItem">'+
	                        '<span class="glyphicon glyphicon-time timeItem-img" aria-hidden="true"></span><div class="timeItem-bd">'+
							'<span>时间:'+time+'</span></div></div><div class="addressItem"><span class="glyphicon glyphicon-map-marker addressItem-img" aria-hidden="true"></span>'+
							'<div class="addressItem-bd"><span>发型师：'+res[i].stylist+'</span>	</div></div></div></div><div class="item-ft">'+
							'<div class="orderNum">订单号：<span class="number">'+res[i].id+'</span><span>前面等待人数：'+ res[i].waitNum+'</span></div><button class="btn btn-default ensureBtn" type="submit">确认订单</button></div></section>	';					
						   }
					    else{
					    	html = html +'<section class="order-item"><div class="item-hd"><div class="order-shop">用户名 ： '+res[i].userName+'</div>'+
							'<div class="order-type">'+res[i].stat+'</div></div><div class="item-bd"><img class="shopImg" src="graduateDesign/img/img2.jpg" />'+
							'<div class="item-bd-right"><div class="priceItem"><span class="glyphicon glyphicon-usd priceItem-img" aria-hidden="true"></span>'+				
							'<div class="priceItem-bd"><span>服务价格：</span><div class="price">'+res[i].price+'</div></div></div><div class="hairTypeItem">'+
							'<span class="glyphicon glyphicon-tag hairTypeItem-img" aria-hidden="true"></span><div class="hairTypeItem-bd">'+
							'<span>理发类型：</span><div class="hairType">'+res[i].service+'</div></div></div><div class="timeItem">'+
	                        '<span class="glyphicon glyphicon-time timeItem-img" aria-hidden="true"></span><div class="timeItem-bd">'+
							'<span>时间:'+time+'</span></div></div><div class="addressItem"><span class="glyphicon glyphicon-map-marker addressItem-img" aria-hidden="true"></span>'+
							'<div class="addressItem-bd"><span>发型师：'+res[i].stylist+'</span>	</div></div></div></div><div class="item-ft">'+
							'<div class="orderNum">订单号：<span class="number">'+res[i].id+'</span><span>前面等待人数：'+ res[i].waitNum+'</span></div></div></section>	';					
						  
					    }
					}
					$("#main").append(html);
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("没有订单数据");
				}
				
			}
				
		});
	}
	else{
		$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
	        $('#dialog2').off('click').hide();
	    });
		$("#dialog2 .weui_dialog_bd").text("请先登录");
	}
	
    $("#homePage").find('img').attr('src', 'graduateDesign/img/homePage.png');
    $("#homePage").find('img').siblings().css("color","#848080");
    $("#order").find('img').siblings().css("color","#5dc45d");
	$('#order').find('img').attr('src', 'graduateDesign/img/ordered.png');
	//$("#search").find('img').siblings().css("color","#848080");
	//$('#search').find('img').attr('src', 'graduateDesign/img/search.png');
	shopIndex.bindEvent();
};
shopIndex.bindEvent = function(){
	$("#main").on("click",".ensureBtn",function(){
		var obj = $(this);
		var id = parseInt(obj.parents('section').find(".number").text());
		obj.hide();		
		//确认订单数据
		var ajaxObj =  $.ajax({
			url: "ordersController/ensureOrders.action",
			type: "post",
			dataType:'json',
			data: {"id":id},
			success: function(res){
				if(res.msg == "ok"){
					obj.parents('section').find(".order-type").text("已确认");
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("订单确认成功");
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("订单确认失败");
				}
				
			}
				
		});
	});
	
};
$(function(){
	shopIndex.init();
});