<%@ page language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" type="text/css" href="css/table.css" />

<html>
  <body>
  <div align="center">
   <p>&nbsp;&nbsp;&nbsp;
   <p>
   <U><a href=lookadd2.jsp style="color:#0000FF">添加&nbsp;&nbsp;</a></U>
   <U><a href=addUser.jsp style="color:#0000FF">数据导入&nbsp;&nbsp;</a></U>
   <U><a href=addUser.jsp style="color:#0000FF">数据导出&nbsp;&nbsp;</a></U>
   <p>&nbsp;
   <p>
     <%! 
	 int pageSize=10; //每页显示的记录数。
   int pageCount=0; //分页后的总页数。
	 int showPage=1;
     %> 
     <%  //获取数据库mysql的驱动类
         try{
           Class.forName("com.mysql.jdbc.Driver");
         }catch(ClassNotFoundException e){
           System.out.println("Class Not Found");
         }
         //与指定数据库实例test连接，进行查询操作
         try{
            Connection con;
            Statement stmt;
            con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/materialmanagement","root","123");
            stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String sql="SELECT No,Name,Type,Specifications,Place,Supplier FROM consumableassets";
            ResultSet rs=stmt.executeQuery(sql);
	    //将游标移动到最后一行：
            rs.last();
            //获取最后一行的行号：
            int lastRow=rs.getRow();
            //计算分页后的总页数：
            pageCount=(lastRow%pageSize==0)?(lastRow/pageSize):(lastRow/pageSize+1);
            //当前显示的初始页数：
           
            //告知客户总页数：
            String integer=request.getParameter("showPage1");
            if(integer==null)//对于初次运行userList1.jsp时的处理
            { integer="1";
            }
            try {
              showPage=Integer.parseInt(integer);  
               }
            catch(NumberFormatException e){
               showPage=1;
               }
            if(showPage<=1){ 
               showPage=1;
            }
            if(showPage>=pageCount){
              showPage=pageCount;
            }
	    int posion=(showPage-1)*pageSize+1;
            rs.absolute(posion); // 设置游标的位置
%>
            <table class ="table">
            <tr>
            <th class="td">资产编号
            <th class="td">名称
            <th class="td">型号
            <th class="td">规格
            <th class="td">存放地
            <th class="td">供应商
            </tr>

<%          for (int i=1;i<=pageSize;i++){
%>  
            <tr>
<%             String No=rs.getString(1);
%> 
             <td class="td"><%=rs.getString(1)%></td> 
             <td class="td"><%=rs.getString(2)%></td> 
             <td class="td"><%=rs.getString(3)%></td> 
             <td class="td"><%=rs.getString(4)%></td> 
             <td class="td"><%=rs.getString(5)%></td> 
             <td class="td"><%=rs.getString(6)%></td> 
             <td class="td" >
             <u><a href=lookmodify2.jsp?No=<%=(No)%> style="color:#0000FF">修改</a></u>
             &nbsp;&nbsp;
             <u><a href=delect2.jsp?No=<%=(No)%> style="color:#0000FF">删除</a></u>
             </td>
             </tr>
<%              rs.next();
           }
           con.close();
           out.print("</table>");
       }catch(Exception e){
           System.out.println("与数据库连接异常");
       }
%>
      <table class ="table" cellpadding="0" cellspacing="0">
      <p>&nbsp;&nbsp; 
      <tr>
       <td width = td.width><U><a href=lookconsumableassets.jsp?showPage1=1 style="color:#0000FF" >首页 &nbsp;&nbsp;</a></U></td>
       <td width = td.width><U><a href=lookconsumableassets.jsp?showPage1=<%=(showPage-1)%> style="color:#0000FF" >前一页&nbsp;&nbsp;</a></U></td> 
       <td width = td.width><U><a href=lookconsumableassets.jsp?showPage1=<%=(showPage+1)%> style="color:#0000FF" >后一页&nbsp;&nbsp;</a></U></td>
       <td width = td.width><U><a href=lookconsumableassets.jsp?showPage1=<%=(pageCount)%> style="color:#0000FF" >末页&nbsp;&nbsp;</a></U></td>
       <td width = td.width >每页<%=pageSize%>行&nbsp;&nbsp;</td>
       <td width = td.width >现在是第<%=showPage%>页/共<%=pageCount%>页 &nbsp;</td>
       <form name="form1" method="post" action="lookconsumableassets.jsp">
          <td width = td.width style="color:#0000FF">转到
            <input type="text" width = td.width name="showPage1" size=4vw>
            <input type="submit" width = td.width style="color:#0000FF" name="Submit" value="  go ">      
          </td>
       </form>
     </tr> 
   </table>
 
  </body>
</html>
