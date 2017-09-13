var evaluateList={
	init:function(){},
	bindEvent:function(){},
	shopId:""
};
evaluateList.init = function(){
	if(window.location.href.indexOf("?") != -1){
		var arr = window.location.href.split("?");
		var arrValue = arr[1].split("=");
		evaluateList.shopId = arrValue[1];
	}	
	//用来显示用户名
	if(localStorage.getItem("name")){
		$(".hd_right span").text("用户名："+localStorage.getItem("name"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/signIn.jsp" style="color: white;">注销</a>');
	}
	$("#loadingToast").show();
	//请求评价数据
	var ajaxObj =  $.ajax({
		url: "evalController/getEvalList.action",
		type: "post",
		dataType:'json',
		data: {"shopId":evaluateList.shopId},
		success: function(res){
			$("#loadingToast").hide();
			if(res){
				var html = '';
				for(var i = 0;i < res.length;i++){
					var date = new Date(parseInt(res[i].time));
					var time = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
				    html = html + '<section><div class="section_hd">'+res[i].userName+'</div><div class="section_bd">'+res[i].text+'</div>'+
				   		'<div class="section_ft">'+time+'</div></section>';			
				}
				$("#main").append(html);
			}
			
		}
			
	});

	this.bindEvent();
};

evaluateList.bindEvent = function(){
	$("#backBtn").on("click",function(){
		window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/shop.jsp?shopId="+evaluateList.shopId;
	});
	
};
$(function(){
	evaluateList.init();
});