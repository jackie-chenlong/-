var evaluate={
	init:function(){},
	bindEvent:function(){},
	shopId:""
};
evaluate.init = function(){
	if(window.location.href.indexOf("?") != -1){
		var arr = window.location.href.split("?");
		var arrValue = arr[1].split("=");
		evaluate.shopId = arrValue[1];
	}	
	//用来显示用户名
	if(localStorage.getItem("name")){
		$(".hd_right span").text("用户名："+localStorage.getItem("name"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/signIn.jsp" style="color: white;">注销</a>');
	}

	//请求商店数据
	var ajaxObj =  $.ajax({
		url: "shopController/getShop.action",
		type: "post",
		dataType:'json',
		data: {"shopId":evaluate.shopId},
		success: function(res){
			if(res){
				$(".item-content-hd").text(res.name);
				$(".shopAddress").text(res.address);
				
			}		
		}
			
	});
	this.bindEvent();
};

evaluate.bindEvent = function(){
	
	//为确定按钮绑定事件
	$("#commitBtn").on("click",function(){
       var evalData = {};
       evalData.shopId = evaluate.shopId;
       evalData.name = localStorage.getItem("name");
       evalData.text = $("#evalText").val();
       evalData.time = Date.parse(new Date());
	   var ajaxObj =  $.ajax({
			url: "evalController/submitEval.action",
			type: "post",
			dataType:'json',
			data: evalData,
			success: function(res){
				if(res.msg == "ok"){		
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				      //  window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/order.jsp";
				    });
					$("#dialog2 .weui_dialog_bd").text("提交成功");
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("提交失败");
				}
				
			}
				
		});
	});
	
};
$(function(){
	evaluate.init();
});