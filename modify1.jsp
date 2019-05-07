<%@ page  language="java" pageEncoding="utf-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" type="text/css" href="css/table.css" />
<html>
<body>
<div align="center">
<p>&nbsp; 
<%! String Name =null,Type=null,Specifications=null,Place = null,Supplier=null,Borrowed = null;
    Connection con;
	Statement stmt;
	String sql;
%>
<%  
    String No=request.getParameter("No");
    byte b[]=No.getBytes("ISO-8859-1");
    No=new String(b,"utf-8");
    
    try{
       Class.forName("com.mysql.jdbc.Driver");
      }catch(ClassNotFoundException e){
         System.out.println("Class Not Found");
      }
     try{
        con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/materialmanagement","root","123");
        stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        sql="select * from fixedassets where No='"+No+"'";
        System.out.println("sql="+sql);
        ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
		  No=rs.getString(1);
		  Name=rs.getString(2);
		  System.out.println("Name"+Name);
		  Type=rs.getString(3);
		  System.out.println("Type"+Type);
		  Specifications=rs.getString(4);
		  System.out.println("Specifications"+Specifications);
		  Place=rs.getString(5);
		  System.out.println("Place"+Place);
		  Supplier=rs.getString(6);
		  System.out.println("Supplier"+Supplier);
		  Borrowed=rs.getString(7);
		  System.out.println("Borrowed"+Borrowed);
		}
		con.close();
	 }catch(Exception e){
	    System.out.print("数据库操作异常");
	 }
%>
<form name="form4" method="post" action="modifyHandle.jsp">
<table class ="table" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td">资产编号：</td>
    <td class="td">
      <%=No%><input type="hidden" class="td" name="No" value=<%=No%>> 
    </td>
  </tr>
  <tr>
    <td class="td">名称：</td>
    <td class="td">
      <input type="text" class="td" name="Name" value=<%=Name%> >
    </td>
  </tr>
  <tr>
    <td class="td">型号：</td>
    <td class="td">
      <input type="text"  class="td" name="Type" value=<%=Type%> >
   </td>
  </tr>
   <tr>
    <td class="td">规格：</td>
    <td class="td">
      <input type="text" class="td" name="Specifications" value=<%=Specifications%> >
    </td>
  </tr>
  <tr>
    <td class="td">存放地：</td>
    <td class="td">
      <input type="text" class="td" name="Place" value=<%=Place%> >
    </td>
  </tr>
  <tr>
    <td class="td">供应商：</td>
    <td class="td">
      <input type="text" class="td" name="Supplier" value=<%=Supplier%> >
    </td>
  </tr>
  <tr>
    <td class="td">出库去向：</td>
    <td class="td">
      <input type="text" class="td" name="Borrowed" value=<%=Borrowed%> >
    </td>
  </tr>
  
  <tr>
    <td class="td">&nbsp;</td>
    <td class="td">
      &nbsp;<input type="submit" name="Submit" value="提交">&nbsp;&nbsp;&nbsp;
      <input type="reset" name="Submit" value="清空">
   </td>
  </tr>
</table>
 </form>
 <p> &nbsp; 
  <p> &nbsp; 
<u><a href="lookfixedassets.jsp" style="color:#0000FF">返回列表</a></u>
</body>
</html>
