<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring4 MVC -HelloWorld</title>
</head>
<body>
    <h1>${greeting},,,${name}</h1>
    <span></span>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script>
    	$("span").text("cl");
    	var jsonStr = JSON.stringify({id:123,data:[{id:1232,name:"ss",password:"ssd"},{id:123,name:"aass",password:"aassd"}]});
    	 $.post("userController/next.action",{"jsonStr":jsonStr},function(data,stat){
    		$("span").text(stat);//看来第二个参数默认为"success"
    	}); 
    	 /*  $.ajax({
              
              type: 'post',
              url:'next.action',
              cache:false,
              data:JSON.stringify({id:123,data:[123,1]}),
              contentType: 'application/json',
              dataType: 'json',
              success:function(result){
                  //result = $.parseJSON(result);
            	  $("span").text(result.id);
              }
              
          }); */
    </script>
</body>
</html>
