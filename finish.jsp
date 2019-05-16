<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
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
	<link rel="stylesheet" type="text/css" href="css/style.css" />  
  </head>  
  <body bgcolor=#FFFFFF>
  <!-- 导航栏 -->
  <link rel="stylesheet" type="text/css" href="css/submit.css" />
  <center>
    <jsp:include page="navbar.jsp"> 
  	<jsp:param value="#e95404" name="color"/></jsp:include>
 
		<img src="images/nav6.jpg" width=100% height=60%>
		<hr/>
    <% 
	  String ANo=null,RepairUser=null,RepairTime=null;
      Connection con;
	  Statement stmt;
	  String sql;                                              
	%>
    <%
      String No=request.getParameter("No");
      byte[] b=No.getBytes("ISO-8859-1");
      No=new String(b,"utf-8");
      System.out.println("No"+No);
      try{
           Class.forName("com.mysql.jdbc.Driver");
         }catch(ClassNotFoundException e){
           System.out.println("Class Not Found");
         }//与指定数据库实例materialmanagement连接，进行查询操作
    %>
    <%
	  try{
	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/materialmanagement","root","");
      stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	  sql="SELECT ANo,RepairUser,RepairTime FROM repairlist WHERE `No`='"+No+"' ;";
	  System.out.println("sql"+sql);
	  ResultSet rs=stmt.executeQuery(sql);
	  System.out.println("123"+rs);
	  boolean m=rs.next();
	  System.out.println("123"+m);
	  if(m){
		  ANo=rs.getString(1);
		   System.out.println("ANo"+ANo);
		  RepairUser=rs.getString(2);
		  RepairTime=rs.getString(3);
	  }
	  con.close();
	  }catch(Exception e){
		  System.out.println("数据库操作异常");
	  }
	%>
 <form name="form4" method="post" action="finishHandle.jsp">
 <table border ="0" align="center" >
    <tr  height="45">
    <td width="200" align="center"></td>
    <td width="400"><input type="text" name="No" value=<%=No%> /> </td>
    </tr>

    <tr  height="45">
    <td align="center">资产编号</td>
    <td><input type="text" name="ANo" value=<%=ANo%> readonly="true" /> </td>
    </tr>
	
    <tr  height="45">
    <td align="center"/>维修人员编号</td>
    <td><input type="text" name="RepairUser" value=<%=RepairUser%> readonly="true" /> </td>
    </tr>

    <tr   height="45">
    <td align="center">维修时间</td>
    <td><input type="text" name="RepairTime" value=<%=RepairTime%> readonly="true" /> </td>
    </tr>

    <tr   height="45">
    <td align="center">归还时间</td>
    <td><input type="text" name="ReturnTime" /> *(格式 年月日 如20160901)</td>
    </tr>
 </table>
    <tr><td align="center">
	  <input class="button" type="submit" name="g" value="提交"/>
	  <input class="button" type="button" value="返回" onclick="javascript:history.go(-1);"/>
    </td></tr>
 </form>	
    <p>&nbsp; 			
	<jsp:include page="footer.jsp"></jsp:include>
    <br/>
</center>
</body>
</html>