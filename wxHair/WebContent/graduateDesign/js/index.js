var index={
	init:function(){},
	bindEvent:function(){}
};
index.init = function(){
//	if(window.location.href.indexOf("?") != -1){
//		var arr = window.location.href.split("?");
//		var arrValue = arr[1].split("=");
//		$(".hd_right span").text("用户名："+arrValue[1]);
//		//$(".hd_right a").hide();
//	}	
	//用来显示用户名
	if(localStorage.getItem("name")){
		$(".hd_right span").text("用户名："+localStorage.getItem("name"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/signIn.jsp" style="color: white;">注销</a>');
	}
	//实现图片轮播动画
	var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });
    $("#homePage").find('img').attr('src', 'graduateDesign/img/homePaged.png');
    $("#homePage").find('img').siblings().css("color","#5dc45d");
    $("#order").find('img').siblings().css("color","#848080");
	$('#order').find('img').attr('src', 'graduateDesign/img/order.png');
	$("#search").find('img').siblings().css("color","#848080");
	$('#search').find('img').attr('src', 'graduateDesign/img/search.png');
	$("#loadingToast").show();
	//请求商店数据
	var ajaxObj =  $.ajax({
		url: "shopController/getShopList.action",
		type: "post",
		dataType:'json',
		data: "",
		success: function(res){
			$("#loadingToast").hide();
			if(res){
				var html ='';
				for(var i=0;i<res.length;i++){
				    html = html + '<div class="item" id="firstItem" shopId="'+res[i].id+'"><img class="item-img" src="graduateDesign/img/shop'+(i+1)+'.jpg"  />'+
					'<div class="item-content"><div class="item-content-hd">'+res[i].name+'</div>'+				
					'<div class="item-content-bd"><span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>'+
					'<span class="shopAddress">'+res[i].address+'</span></div></div></div>';
				}
				$(".main").append(html);
			}
		}
			
	});
	index.bindEvent();
};
index.bindEvent = function(){
	$(".main").on("click",".item",function(){
		window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/shop.jsp?shopId="+$(this).attr("shopId");
	});
	$("aside").on("click",".tab",function(){
		$(this).css("background-color","white");
		$(this).css("color","#4e7fbd");
		$(this).css("border-top","3px solid #4e7fbd");
		$(this).siblings().css("background-color","transparent");
		$(this).siblings().css("color","#f3f3f3");		
		$(this).siblings().css("border-top","0px");
		$(".main").html("");
		$("#loadingToast").show();
		if($(this).children().text() == "美发平台"){
			//请求商店数据
			var ajaxObj =  $.ajax({
				url: "shopController/getShopList.action",
				type: "post",
				dataType:'json',
				data: "",
				success: function(res){
					$("#loadingToast").hide();
					if(res){
						var html ='';
						for(var i=0;i<res.length;i++){
						    html = html + '<div class="item" id="firstItem" shopId="'+res[i].id+'"><img class="item-img" src="graduateDesign/img/shop'+(i+1)+'.jpg"  />'+
							'<div class="item-content"><div class="item-content-hd">'+res[i].name+'</div>'+				
							'<div class="item-content-bd"><span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>'+
							'<span class="shopAddress">'+res[i].address+'</span></div></div></div>';
						}
						$(".main").append(html);
					}
				}
					
			});
		}
		else{
			//请求商店排行数据
			var ajaxObj =  $.ajax({
				url: "shopController/getShopOrderList.action",
				type: "post",
				dataType:'json',
				data: "",
				success: function(res){
					$("#loadingToast").hide();
					if(res){
						var html ='';
						for(var i=0;i<res.length;i++){
						   html = html + '<div class="item" id="firstItem" shopId="'+res[i].id+'"><img class="item-img" src="graduateDesign/img/shop'+(i+1)+'.jpg"  />'+
							'<div class="item-content"><div class="item-content-hd">'+(i+1)+'、'+res[i].name+'</div>'+				
							'<div class="item-content-bd"><span class="glyphicon glyphicon-map-marker imgIcon" aria-hidden="true"></span>'+
							'<span class="shopAddress">'+res[i].address+'</span><br/><span class="orderNum">订单数：'+res[i].orderNum+'</span></div></div></div>';
						}
						$(".main").append(html);
					}
				}
					
			});
		}
	});
};
$(function(){
	index.init();
});
