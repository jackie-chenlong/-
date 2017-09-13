var signInfo={
	init:function(){},
	bindEvent:function(){}
};
signInfo.init = function(){
	$("#registerForm").bootstrapValidator({
//      live: 'disabled',
      message: 'This value is not valid',
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
          name: {
              validators: {
                  notEmpty: {
                      message: '用户名不能为空'
                  }
              }
          },        
          password: {
              validators: {
                  notEmpty: {
                      message: '密码不能为空'
                  },
                  identical: {
                      field: 'confirmPass',
                      message: '密码与确认密码不相同'
                  },
                  different: {
                      field: 'name',
                      message: '密码不能与用户名相同'
                  }
              }
          },
          confirmPass: {
              validators: {
                  notEmpty: {
                      message: '确认密码不能为空'
                  },
                  identical: {
                      field: 'password',
                      message: '确认密码与密码不相同'
                  },
                  different: {
                      field: 'name',
                      message: '确认密码不能与用户名相同'
                  }
              }
          },
          address: {
              validators: {
                  notEmpty: {
                      message: '地址不能为空'
                  }
              }
          },
          stylist: {
              validators: {
                  notEmpty: {
                      message: '发型师不能为空'
                  }
              }
          }
       
      }
    });
	if(localStorage.getItem("shopName")){
		$("#loadingToast").show();
		$(".hd_right span").text("商家名："+localStorage.getItem("shopName"));
		$(".hd_right a").hide();
		$(".hd_right").append('<a href="graduateDesign/shopSignIn.jsp" style="color: white;">注销</a>');
     	var ajaxObj  = $.ajax({
			url: "shopController/getShopByName.action",
			type: "post",
			dataType:'json',
			data: {"name":localStorage.getItem("shopName")},
			success: function(res){
				if(res){
					$("#registerForm").attr("data-id",res.id);
					$("input[name=name]").val(res.name);
					$("input[name=password]").val(res.password);
					$("input[name=address]").val(res.address);
					$.post("shopController/getStylist.action",{"shopId":res.id},function(res){
						 $("input[name=stylist]").val(res.join());
					});
					//请求服务数据
					$.post("shopController/getService.action",{"shopId":res.id},function(res){
						if(res){
						   var html = '';
						   for(var i = 0;i < res.length;i++){
						    html = html + '<section><div class="form-group"><div class="col-xs-12"><label class="col-xs-4 control-label">服务类型：</label>'+
							'<div class="col-xs-6"><input type="text" class="form-control" name="service" placeholder="服务类型" value="'+res[i].service+'"/>'+
			                '</div></div></div><div class="form-group"><div class="col-xs-12"><label class="col-xs-4 control-label">价格：</label>'+
							'<div class="col-xs-6"><input type="text" class="form-control" name="price" placeholder="价格" value="'+res[i].price+'"/></div></div>'+
					        '</div><div class="form-group"><div class="col-xs-12"><label class="col-xs-4 control-label">需要时间：</label>'+
							'<div class="col-xs-6"><input type="text" class="form-control" name="needTime" placeholder="需要时间" value="'+res[i].needTime+'"/> </div></div></div></section>';
						   }
						   $(".serviceSection").append(html);
						  }
					});
					//var stylist = $("input[name=stylist]").val();
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text(res.msg);
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
	$("#homePage").find('img').attr('src', 'graduateDesign/img/homePaged.png');
    $("#homePage").find('img').siblings().css("color","#5dc45d");
    $("#order").find('img').siblings().css("color","#848080");
	$('#order').find('img').attr('src', 'graduateDesign/img/order.png');
	signInfo.bindEvent();
};
signInfo.bindEvent = function(){

	$("button[name=update]").on("click",function(e){
		e.preventDefault();
		var id = $("#registerForm").attr("data-id");
		var name = $("input[name=name]").val();
		var password = $("input[name=password]").val();
		var address = $("input[name=address]").val();
		var stylist = $("input[name=stylist]").val();
		var ajaxObj  = $.ajax({
			url: "shopController/updateShop.action",
			type: "post",
			dataType:'json',
			data: {"id":id,"name":name,"password":password,"address":address,"stylist":stylist},
			success: function(res){
				if(res.msg == "ok"){
					localStorage.removeItem("shopName");
					localStorage.setItem("shopName",name);
					$(".hd_right span").text("商家名："+localStorage.getItem("shopName"));
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text("修改成功");
				}
				else{
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				    });
					$("#dialog2 .weui_dialog_bd").text(res.msg);
				}
			}
		});
	});
};
$(function(){
	signInfo.init();
});

