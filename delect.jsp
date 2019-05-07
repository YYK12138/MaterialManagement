<%@ page language="java" pageEncoding="utf-8" import="java.sql.*" errorPage="" %>
<html>
删除用户信息处理
<body>
<div align="center">
<p>&nbsp; 
   <%
      String No=new String(request.getParameter("No"));
      byte[] b=No.getBytes("ISO-8859-1");
      No=new String(b,"utf-8");
     try{
           Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException e){
           System.out.println("Class Not Found");
        }
     try{
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/materialmanagement","root","123");
        Statement stmt=con.createStatement();
        String sql="delete from fixedassets where No='"+No+"'";
        System.out.println("sql="+sql);
        stmt.executeUpdate(sql);//m值的是受影响的记录行
        con.close();
       }catch(Exception e){
	    System.out.print("数据库操作异常");
       }
     response.sendRedirect("lookfixedassets.jsp");
   %>
</body>
</html>

 


