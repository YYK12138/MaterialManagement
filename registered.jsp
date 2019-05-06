<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>武科大信息中心设备管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="css/login.css" />  
  </head>  
  <script>
		function userSubmit(){
		var s1= document.getElementById("psd").value
		var s2= document.getElementById("psd2").value
		var s3= document.getElementById("uid").value
		var s4= document.getElementById("phone").value
		var s5= document.getElementById("uname").value
		//var conn = new ActiveXObject("ADODB.Connection")
		//var rs = new ActiveXObject("ADODB.Recordset")
		if(s1==""||s2==""||s3==""||s4==""||s5==""){
			alert("以上内容不能为空!")
			return false
		}
		if(s1!=s2){
			alert("两次密码输入不一样");
			return false  
		}
		return true  
		}
	</script>
  <body>
  <!-- 导航栏 -->
  <img alt="" src="images/list-bg.jpg" style="width:100vw;height:30vh;">
  	<form action="addUserServlet" method="get" onsubmit="return userSubmit()">
  		<table class="table2" >
  		<tr><td style="text-align:right">用户名</td><td><input id="uname" placeholder="请输入用户名" name="username"></td></tr>
  		<tr><td style="text-align:right">手机号</td><td><input id="phone" placeholder="请输入手机号" name="phone"></td></tr>
  		<tr><td style="text-align:right">工号</td><td><input id="uid" placeholder="请输入工号" name="userid"></td></tr>
  		<tr><td style="text-align:right">密码</td><td><input id="psd" type="password" placeholder="请输入密码" name="password"></td></tr>
  		<tr><td style="text-align:right">确认密码</td><td><input id="psd2" type="password" placeholder="请确认密码" name="password2"></td></tr>
  		</table>
  		<button class="button2" type="submit" name="submit">同意用户协议并注册</button>
  	</form>
  	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
