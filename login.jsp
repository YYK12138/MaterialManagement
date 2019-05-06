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
  <script type="text/javascript">
  	function reset(){
  		alert("请联系管理员重置密码，管理员电话：13995904637！")
  	}
  	function userSubmit(){
		var s1= document.getElementById("username").value
		var s2= document.getElementById("password").value
		if(s1==""||s2==""){
			alert("账号密码不能为空!")
			return false
		}
		return true  
		}
  </script>
  <body>
  <!-- 导航栏 -->
  <img alt="" src="images/list-bg.jpg" style="width:100vw;height:30vh;">
  	<div class="container">
  		<div class="container2">
  			<p>欢迎使用武科大信息中心设备管理系统</p><p>管理员初始密码为123456</p><p>Design by Wust信管1601</p>
  		</div>
  		<div class="container2" style="padding-left:10vw;padding-top:12vh">
  			<form action="loginServlet" method="get" onsubmit="return userSubmit()">
  			<table class="table1">
  				<tr><td><input id="username" placeholder="用户名:" name="username"></td></tr>
  				<tr><td style="height:3vh"><input id="password" placeholder="密码:" name="password"></td></tr>
  			</table>
  			<a href="#" style="font-size:1vw;color:#00caca;width:15vw;padding-left:14vw;text-decoration: none;" onclick="reset()">忘记密码?</a>
  			<div class="container3">
  			<button class="button1"  type="submit" value="submit">登录</button>
  			<button class="button1" style="margin-left:2vw"><a href="registered.jsp" style="font-size:1vw;color:#ffffff;text-decoration: none;">注册</a></button>
  			</div>	
  			</form>
  		</div>
  	</div>
  	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
