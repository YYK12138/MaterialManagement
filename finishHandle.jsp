<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
处理修改信息页面 
<body>
<%   String No=request.getParameter("No");
     
     String ANo=request.getParameter("ANo");
     byte[]  b=ANo.getBytes("ISO-8859-1");
     ANo=new String(b,"utf-8");

     String RepairUser=request.getParameter("RepairUser");
	  b=RepairUser.getBytes("ISO-8859-1");
     RepairUser=new String(b,"utf-8");
	 
     String RepairTime=request.getParameter("RepairTime");
	  b=RepairTime.getBytes("ISO-8859-1");
     RepairTime=new String(b,"utf-8");
	 
     String ReturnTime=request.getParameter("ReturnTime");
	  b=ReturnTime.getBytes("ISO-8859-1");
     ReturnTime=new String(b,"utf-8");
	 
     try{
         Class.forName("com.mysql.jdbc.Driver");
     }catch(ClassNotFoundException e){
         System.out.println("Class Not Found");
        }
     try{
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/materialmanagement","root","");
        Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="update repairlist set ANo='"+ANo+"', RepairUser='"+RepairUser+"', RepairTime='"+RepairTime+"', ReturnTime='"+ReturnTime+"'where No='"+No+"'";
        System.out.println("sql="+sql);
        stmt.executeUpdate(sql);
	con.close();
     }catch(Exception e){
	    System.out.print("数据库操作异常");
     }
   response.sendRedirect("Maintain.jsp");	
%>
</body>
</html>
