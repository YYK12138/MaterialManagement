<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="userBean" class="mybean.data.submit" scope="request"></jsp:useBean>
<html>
<%@page import="mybean.data.submit"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<body><center>
    <div>
    <br>hello world!</br>       
	<br><jsp:getProperty name="userBean" property="backNews"/></br>

	<a href=submit.jsp?>返回</a	>
<div></center></body>