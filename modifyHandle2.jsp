<%@ page  language="java" pageEncoding="utf-8" import="java.sql.*" errorPage="" %>
<html>
处理修改信息
<body>
<div align="center">
<p>&nbsp; 
<%   String No=new String(request.getParameter("No"));
      byte[] b=No.getBytes("ISO-8859-1");
      No=new String(b,"utf-8");
      String Name=new String(request.getParameter("Name"));
      byte[] c=Name.getBytes("ISO-8859-1");
      Name=new String(c,"utf-8");
      String Type=new String(request.getParameter("Type"));
      byte[] d=Type.getBytes("ISO-8859-1");
      Type=new String(d,"utf-8");
      String Specifications=request.getParameter("Specifications");
      byte[] f=Specifications.getBytes("ISO-8859-1");
      Specifications=new String(f,"utf-8");
      String Place=request.getParameter("Place");
      byte[] g=Place.getBytes("ISO-8859-1");
      Place=new String(g,"utf-8");
      String Supplier=request.getParameter("Supplier");
      byte[] h=Supplier.getBytes("ISO-8859-1");
      Supplier=new String(h,"utf-8");
     
     try{
         Class.forName("com.mysql.jdbc.Driver");
     }catch(ClassNotFoundException e){
         System.out.println("Class Not Found");
        }
     try{
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/materialmanagement","root","123");
        Statement stmt=con.createStatement();
        String sql="update consumableassets set Name='"+Name+"', Type='"+Type+"',Specifications='"+Specifications+"' ,Place='"+Place+"',Supplier='"+Supplier+"' where No='"+No+"'";
        System.out.println("sql="+sql);
        stmt.executeUpdate(sql);
	con.close();
     }catch(Exception e){
	    System.out.print("数据库操作异常");
     }
   response.sendRedirect("lookconsumableassets.jsp");	
%>
</body>
</html>
