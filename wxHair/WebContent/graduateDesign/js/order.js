var order={
	init:function(){},
	bindEvent:function(){}
};
order.init = function(){
	$("#loadingToast").show();
	if(localStorage.getItem("name")){
		$(".hd_right span").text("用户名："+localStorage.getItem("name"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/signIn.jsp" style="color: white;">注销</a>');
		//请求订单数据
		var ajaxObj =  $.ajax({
			url: "ordersController/getOrdersList.action",
			type: "post",
			dataType:'json',
			data: {"name":localStorage.getItem("name")},
			success: function(res){
				$("#loadingToast").hide();
				if(res){
					var html = "";
					for(var i = 0;i < res.length;i++){		
						var date = new Date(parseInt(res[i].time));
						var time = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
					    html = html +'<section class="order-item" shop_id='+res[i].shop_id+'><div class="item-hd"><div class="order-shop">'+res[i].shopName+'</div>'+
						'<div class="order-type">'+res[i].stat+'</div></div><div class="item-bd"><img class="shopImg" src="graduateDesign/img/img2.jpg" />'+
						'<div class="item-bd-right"><div class="priceItem"><span class="glyphicon glyphicon-usd priceItem-img" aria-hidden="true"></span>'+				
						'<div class="priceItem-bd"><span>服务价格：</span><div class="price">'+res[i].price+'</div></div></div><div class="hairTypeItem">'+
						'<span class="glyphicon glyphicon-tag hairTypeItem-img" aria-hidden="true"></span><div class="hairTypeItem-bd">'+
						'<span>理发类型：</span><div class="hairType">'+res[i].service+'</div></div></div><div class="timeItem">'+
                        '<span class="glyphicon glyphicon-time timeItem-img" aria-hidden="true"></span><div class="timeItem-bd">'+
						'<span>时间:'+time+'</span></div></div><div class="addressItem"><span class="glyphicon glyphicon-map-marker addressItem-img" aria-hidden="true"></span>'+
						'<div class="addressItem-bd"><span>发型师：'+res[i].stylist+'</span>	</div></div></div></div><div class="item-ft">'+
						'<div class="orderNum">订单号：<span class="number">'+res[i].id+'</span></div><button class="btn btn-default cancelBtn" type="submit">取消订单</button></div></section>	';					
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
		$("#dialog2 .weui_dialog_bd").text("没有订单数据");
	}
	
    $("#homePage").find('img').attr('src', 'graduateDesign/img/homePage.png');
    $("#homePage").find('img').siblings().css("color","#848080");
    $("#order").find('img').siblings().css("color","#5dc45d");
	$('#order').find('img').attr('src', 'graduateDesign/img/ordered.png');
	$("#search").find('img').siblings().css("color","#848080");
	$('#search').find('img').attr('src', 'graduateDesign/img/search.png');
	order.bindEvent();
};
order.bindEvent = function(){
	$("#main").on("click",".cancelBtn",function(){
		var id = parseInt($(this).parents('section').find(".number").text());
		//删除订单数据
		var ajaxObj =  $.ajax({
			url: "ordersController/deleteOrders.action",
			type: "post",
			dataType:'json',
			data: {"id":id},
			success: function(res){
				if(res.msg == "ok"){
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("订单删除成功");
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("订单删除失败");
				}
				
			}
				
		});
		$(this).parents('section').hide();
	});
	$("#main").on("click",".evaluateBtn",function(){
		window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/evaluate.jsp?shop_id="+$(this).parents("section").attr("shop_id");
	});
	$("aside").on("click",".tab",function(){
		 var obj = $(this);
		 obj.css("background-color","white");
		 obj.css("color","#4e7fbd");
		 obj.css("border-top","3px solid #4e7fbd");
		 obj.siblings().css("background-color","transparent");
		 obj.siblings().css("color","#f3f3f3");		
		 obj.siblings().css("border-top","0px");
		 $("#main").html("");
		 $("#loadingToast").show();
		 if( obj.children().text() == "已提交"){
			//请求订单数据
			var ajaxObj =  $.ajax({
				url: "ordersController/getOrdersList.action",
				type: "post",
				dataType:'json',
				data: {"name":localStorage.getItem("name")},
				success: function(res){
					$("#loadingToast").hide();
					if(res){
						var html = "";
						for(var i = 0;i < res.length;i++){		
							var date = new Date(parseInt(res[i].time));
							var time = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
						    html = html +'<section class="order-item" shop_id='+res[i].shop_id+'><div class="item-hd"><div class="order-shop">'+res[i].shopName+'</div>'+
							'<div class="order-type">'+res[i].stat+'</div></div><div class="item-bd"><img class="shopImg" src="graduateDesign/img/img2.jpg" />'+
							'<div class="item-bd-right"><div class="priceItem"><span class="glyphicon glyphicon-usd priceItem-img" aria-hidden="true"></span>'+				
							'<div class="priceItem-bd"><span>服务价格：</span><div class="price">'+res[i].price+'</div></div></div><div class="hairTypeItem">'+
							'<span class="glyphicon glyphicon-tag hairTypeItem-img" aria-hidden="true"></span><div class="hairTypeItem-bd">'+
							'<span>理发类型：</span><div class="hairType">'+res[i].service+'</div></div></div><div class="timeItem">'+
	                        '<span class="glyphicon glyphicon-time timeItem-img" aria-hidden="true"></span><div class="timeItem-bd">'+
							'<span>时间:'+time+'</span></div></div><div class="addressItem"><span class="glyphicon glyphicon-map-marker addressItem-img" aria-hidden="true"></span>'+
							'<div class="addressItem-bd"><span>发型师：'+res[i].stylist+'</span>	</div></div></div></div><div class="item-ft">'+
							'<div class="orderNum">订单号：<span class="number">'+res[i].id+'</span></div><button class="btn btn-default cancelBtn" type="submit">取消订单</button></div></section>	';					
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
			//请求确认订单数据
			var ajaxObj =  $.ajax({
				url: "ordersController/getSureOrdersList.action",
				type: "post",
				dataType:'json',
				data: {"name":localStorage.getItem("name"),"stat":"已确认","nowTime":Date.parse(new Date())},
				success: function(res){
					$("#loadingToast").hide();
					if(res){
						var html = "";
						for(var i = 0;i < res.length;i++){	
							if(res[i].waitNum > 0){
								res[i].waitNum = res[i].waitNum - 1;
							}
							var date = new Date(parseInt(res[i].time));
							var time = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
						    html = html +'<section class="order-item" shop_id='+res[i].shop_id+'><div class="item-hd"><div class="order-shop">'+res[i].shopName+'</div>'+
							'<div class="order-type">'+res[i].stat+'</div></div><div class="item-bd"><img class="shopImg" src="graduateDesign/img/img2.jpg" />'+
							'<div class="item-bd-right"><div class="priceItem"><span class="glyphicon glyphicon-usd priceItem-img" aria-hidden="true"></span>'+				
							'<div class="priceItem-bd"><span>服务价格：</span><div class="price">'+res[i].price+'</div></div></div><div class="hairTypeItem">'+
							'<span class="glyphicon glyphicon-tag hairTypeItem-img" aria-hidden="true"></span><div class="hairTypeItem-bd">'+
							'<span>理发类型：</span><div class="hairType">'+res[i].service+'</div></div></div><div class="timeItem">'+
	                        '<span class="glyphicon glyphicon-time timeItem-img" aria-hidden="true"></span><div class="timeItem-bd">'+
							'<span>时间:'+time+'</span></div></div><div class="addressItem"><span class="glyphicon glyphicon-map-marker addressItem-img" aria-hidden="true"></span>'+
							'<div class="addressItem-bd"><span>发型师：'+res[i].stylist+'</span>	</div></div></div></div><div class="item-ft">'+
							'<div class="orderNum">订单号：<span class="number">'+res[i].id+'</span><span>前面等待人数：'+ res[i].waitNum+'</span></div><div class="footerBtn"><button class="btn btn-default evaluateBtn" type="submit">评价</button><button class="btn btn-default cancelBtn" type="submit">取消订单</button></div></div></section>	';					
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
	});
};
$(function(){
	order.init();
});