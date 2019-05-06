<%@page contentType="text/html; charset=utf-8" %>
<html><body>
	<% session.setAttribute("name", null);
		response.sendRedirect("index.jsp");
	 %>
</body></html>