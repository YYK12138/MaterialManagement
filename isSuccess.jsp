<%@page contentType="text/html; charset=utf-8" %>
<jsp:useBean id="data" class="myBean.data.login" scope="request"></jsp:useBean>
<script type="text/javascript">  
            var url = "index.jsp";  
            var second = 5;  
            var val;  
            function changeTime(){  
                val = window.setInterval(changeSeconds, 1000);  
            }  
            function changeSeconds(){  
                second -= 1;  
                document.getElementById('time').innerHTML = second;  
                if(second == 0){  
                    window.clearInterval(val);  
                    window.location = url;  
                }  
            }  
        </script>  
<html><center><body onload="changeTime();">
	<%	
		String username=data.getUser();
		session.setAttribute("name", username);
	 %><br><br>
	 <p style="font-size:2vw;"><strong><jsp:getProperty property="isSuccess" name="data"/></strong></p>
        <h2>页面将在<span id="time">5</h1></span>秒后返回用户页面！</h2> <a href="index.jsp" style="text-decoration: none;">立即返回用户页面</a>
	
</body></center></html>