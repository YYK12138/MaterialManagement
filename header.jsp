<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" type="text/css" href="css/header.css" />
<%
	request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
	String img=request.getParameter("img");
	String text=request.getParameter("text");
 %>
<html><body>
	<div class="container" >
	<div class="title"><h3><span class="title-text"><%=title %></span></h3></div>
	<div class="container2"><a href="#"><img alt="<%=text %>" src="<%=img%>"></a></div>		
	<a href="#" class="text"><strong><%=text %></strong></a>
	<div class="bottom" style="width:16vw;height:1px;background:#cfd0d2;margin-left:2vw;margin-top:1vw;"></div>
	</div>
</body></html>