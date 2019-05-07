<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%     
      String No=new String(request.getParameter("No"));
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
      String Borrowed=request.getParameter("Borrowed");
      byte[] i=Borrowed.getBytes("ISO-8859-1");
      Borrowed=new String(i,"utf-8");
      
	   
	   try{ Class.forName("com.mysql.jdbc.Driver");
	   }
	   catch(Exception e){
	   out.print("忘记把MySQL数据库的驱动程序复制");
	   }
	   
	   try{
	        Connection con;
			Statement stmt;
	        con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/materialmanagement","root","123");
		stmt=con.createStatement();
		String sql="insert into fixedassets(No,Name,Type,Specifications,Place,Supplier,Borrowed) values('"+No+"','"+Name+"','"+Type+"','"+Specifications+"','"+Place+"','"+Supplier+"','"+Borrowed+"')";
		System.out.println("sql="+sql);
		stmt.executeUpdate(sql);   
	   }catch(Exception e){
	   
	   }
	   response.sendRedirect("lookfixedassets.jsp");
	   
%>
</body>
</html>
