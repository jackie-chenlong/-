var search={
	init:function(){},
	bindEvent:function(){}
};
search.init = function(){
	if(localStorage.getItem("name")){
		$(".hd_right span").text("用户名："+localStorage.getItem("name"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/signIn.jsp" style="color: white;">注销</a>');
		
	}
	
    $("#homePage").find('img').attr('src', 'graduateDesign/img/homePage.png');
    $("#homePage").find('img').siblings().css("color","#848080");
    $("#order").find('img').siblings().css("color","#848080");
	$('#order').find('img').attr('src', 'graduateDesign/img/order.png');
	$("#search").find('img').siblings().css("color","#5dc45d");
	$('#search').find('img').attr('src', 'graduateDesign/img/searched.png');
	search.bindEvent();
};
search.bindEvent = function(){
	
	$("#searchBtn").on("click",function(){
		$("#loadingToast").show();
		var ajaxObj =  $.ajax({
			url: "ordersController/getOrdersListByName.action",
			type: "post",
			dataType:'json',
			data: {"searchText":$("#searchText").val(),"time":Date.parse(new Date())},
			success: function(res){
				$("#loadingToast").hide();
				if(res){
					var html = "";
					for(var i = 0;i < res.length;i++){		
						var date = new Date(parseInt(res[i].time));
						var time = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
					    html = html +'<section class="order-item" shop_id='+res[i].shop_id+'><div class="item-hd"><div class="order-shop">'+res[i].userName+' / '+res[i].shopName+'</div>'+
						'<div class="order-type">'+res[i].stat+'</div></div><div class="item-bd"><img class="shopImg" src="graduateDesign/img/img2.jpg" />'+
						'<div class="item-bd-right"><div class="priceItem"><span class="glyphicon glyphicon-usd priceItem-img" aria-hidden="true"></span>'+				
						'<div class="priceItem-bd"><span>服务价格：</span><div class="price">'+res[i].price+'</div></div></div><div class="hairTypeItem">'+
						'<span class="glyphicon glyphicon-tag hairTypeItem-img" aria-hidden="true"></span><div class="hairTypeItem-bd">'+
						'<span>理发类型：</span><div class="hairType">'+res[i].service+'</div></div></div><div class="timeItem">'+
                        '<span class="glyphicon glyphicon-time timeItem-img" aria-hidden="true"></span><div class="timeItem-bd">'+
						'<span>时间:'+time+'</span></div></div><div class="addressItem"><span class="glyphicon glyphicon-map-marker addressItem-img" aria-hidden="true"></span>'+
						'<div class="addressItem-bd"><span>'+res[i].shopAddress+'</span>	</div></div></div></div><div class="item-ft">'+
						'<div class="orderNum">订单号：<span class="number">'+res[i].id+'</span></div></div></section>	';					
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
	});
};
$(function(){
	search.init();
});