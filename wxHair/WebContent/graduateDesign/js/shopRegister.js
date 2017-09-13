var signUp={
	init:function(){},
	bindEvent:function(){}
};
signUp.init = function(){
	signUp.htmlSection = $(".serviceSection").html();
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
                      message: '商店名不能为空'
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
	signUp.bindEvent();
};
signUp.bindEvent = function(){
	$("form").on("click",".addService",function(){	
		$(".serviceSection").append(signUp.htmlSection);
	});
	
	$("button[name=signUp]").on("click",function(e){
		e.preventDefault();
		var name = $("input[name=name]").val();
		var password = $("input[name=password]").val();
		var address = $("input[name=address]").val();
		var stylist = $("input[name=stylist]").val();
		var length = $(".serviceSection").children().length;
		var arr = [];
		for(var i = 0;i < length;i++){
			var obj = {};
			obj.service = $("section").eq(i).find("input[name=service]").val();
			obj.price = $("section").eq(i).find("input[name=price]").val();
			obj.needTime = $("section").eq(i).find("input[name=needTime]").val();
			arr.push(obj);
		}
		var ajaxObj  = $.ajax({
			url: "shopController/addShop.action",
			type: "post",
			dataType:'json',
			data: {"name":name,"password":password,"address":address,"stylist":stylist,"serviceArr":JSON.stringify(arr)},
			success: function(res){
				if(res.msg == "ok"){
					localStorage.removeItem("shopName");
					localStorage.setItem("shopName",name);
					$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
				        $('#dialog2').off('click').hide();
				        window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/shopIndex.jsp";
				    });
					$("#dialog2 .weui_dialog_bd").text("注册成功");				
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
	signUp.init();
});

