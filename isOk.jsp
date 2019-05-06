<%@page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="data" class="myBean.data.addUser" scope="request"></jsp:useBean>
<script type="text/javascript">  
            var url = "index.jsp";  
            var second = 5;  
            var val;  
            function changeTime(){  
                val = window.setInterval(changeSeconds, 1000);  
            }  
            function changeSeconds(){  
                second -= 1;  
                document.getElementById('time1').innerHTML = second;  
                if(second == 0){  
                    window.clearInterval(val);  
                    window.location = url;  
                }  
            }  
        </script>  
<html><center><body onload="changeTime();"><br><br>
	<table style="margin-top:60px">
		<%
			String s=data.getIsOk();
			if(s.equals("注册成功")){
		 %>
		<tr><td><p style="font-size:2vw;"><strong><jsp:getProperty property="isOk" name="data"/></strong></p>
		<tr><td>你注册的用户名是:<jsp:getProperty property="user" name="data"/>
		<tr><td>你的密码是:<jsp:getProperty property="passWord" name="data"/>
		<%}else {%>
		<tr><td><p style="font-size:2vw;"><strong><jsp:getProperty property="isOk" name="data"/></strong></p>
		<%} %>
	</table>
	<br><br><br>
        <h2>页面将在<span id="time1">3</span>秒后返回用户页面！</h2> <a href="index.jsp" style="text-decoration: none;">立即返回用户页面</a>
</body></center></html>