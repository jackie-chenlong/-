var signUp={
	init:function(){},
	bindEvent:function(){}
};
signUp.init = function(){
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
          sex: {
              validators: {
                  notEmpty: {
                      message: '不能为空'
                  }
               
              }
          },
          phone: {
              validators: {
                  notEmpty: {
                      message: '手机号不能为空'
                  }
               
              }
          }
       
      }
  });
	signUp.bindEvent();
};
signUp.bindEvent = function(){

	$("button[name=signUp]").on("click",function(e){
		e.preventDefault();
		var name = $("input[name=name]").val();
		var password = $("input[name=password]").val();
		var phone = $("input[name=phone]").val();
		var sex;
		if($("input[name=sex]:checked").val() == "0"){
			sex = "男";
		}
		else{
			sex = "女";
		}
		var ajaxObj  = $.ajax({
			url: "userController/signUp.action",
			type: "post",
			dataType:'json',
			data: {"name":name,"password":password,"sex":sex,"phone":phone},
			success: function(res){
				if(res.msg == "ok"){
					localStorage.removeItem("name");
					localStorage.setItem("name",name);
					window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/index.jsp";
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

