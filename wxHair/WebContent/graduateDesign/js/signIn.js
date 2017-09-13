var signIn={
	init:function(){},
	bindEvent:function(){}
};
signIn.init = function(){
	 $("#signInForm").bootstrapValidator({
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
                  different: {
                      field: 'name',
                      message: '密码不能与用户名相同'
                  }
              }
          }
       
      }
    });

	signIn.bindEvent();
};
signIn.bindEvent = function(){
	$("#pic").on("click",function(){
		$(this).attr("src","userController/loadPic.action?timestamp=" + (new Date()).valueOf());
	});

	$("button[name=signIn]").on("click",function(e){
		e.preventDefault();
		var name = $("input[name=name]").val();
		var password = $("input[name=password]").val();
		var code = $("input[name=pic]").val();
		var ajaxObj  = $.ajax({
			url: "userController/signIn.action",
			type: "post",
			dataType:'json',
			data: {"name":name,"password":password,"code":code},
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
//		$.post("userController/signIn.action",{"name":name,"password":password},function(res){
//			if(res.msg == "ok"){
//				window.location.href = "http://192.168.191.1:8080/wxHair/graduateDesign/index.jsp?name="+name;
//			}
//			else{
//				$("#dialog2").show().on('click', '.weui_btn_dialog', function () {
//			        $('#dialog2').off('click').hide();
//			    });
//				$("#dialog2 .weui_dialog_bd").text(res.msg);
//			}
//		});
	});
	
};
$(function(){
	signIn.init();
});

$(function(){
	
});
