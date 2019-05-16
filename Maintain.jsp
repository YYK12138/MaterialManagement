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
        <blockquote><table><tr>
		<a href="submit.jsp" class="button3">申请维修</a>
        <a href="historymaintain.jsp" class="button2">历史维修记录</a>
		<a href="***" class="button3">库存(连接库存界面)</a>
		</tr></table></blockquote>
		<%//获取数据库mysql的驱动类
         try{
           Class.forName("com.mysql.jdbc.Driver");
         }catch(ClassNotFoundException e){
           System.out.println("Class Not Found");
         }
         //与指定数据库实例materialmanagement连接，进行查询操作%>
	    <hr/ color=#FFFFFF>--------------维修记录查询---------------
         <form action="look.jsp" method=post name=form>
    <table border="0"> 
    <tr  height="45">   
    <td width="80" align="center">查找条件</td>
	<td width="100" align="center">
	<select name = condition>
	    <option value = "ANo">资产编号
		<option value = "RepairUser">维修人编号
		<option value = "RepairTime">维修时间
		<option value = "ReturnTime">归还时间
	</select></td>
    <td width="200" align="center"><input type="text" name="content"/></td>
	<td width="200" ><input type="submit" class="button" value="提交">
    </tr>
	</table>
	</form>
		<hr/ color=#FFFFFF>--------------维修设备列表---------------<p>
     <%! 
	     int pageSize=9;//每页显示的记录数。
         int pageCount=0; //分页后的总页数。
	     int showPage=1;
	 %>
     <%  
         try{
            Connection con;
            Statement stmt;
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/materialmanagement","root","");
            stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String sql="SELECT repairlist.*,`user`.UserName FROM repairlist,`user` WHERE ReturnTime IS NULL AND repairlist.RepairUser=`user`.ID ORDER BY RepairTime DESC;";
			//查询维修设备的信息及维修人员
            ResultSet rs=stmt.executeQuery(sql);
	        //将游标移动到最后一行：
            rs.last();
            //获取最后一行的行号：
            int lastRow=rs.getRow();
            //计算分页后的总页数：
            pageCount=(lastRow%pageSize==0)?(lastRow/pageSize):(lastRow/pageSize+1);
            //当前显示的初始页数/告知客户总页数
            String integer=request.getParameter("showPage1");
            if(integer==null)//对于初次运行时的处理
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
			<table border ="1" cellpadding="0" cellspacing="0" align="center" >
            <th class="td">资产编号</th>
            <th class="td">维修人员</th>
            <th class="td">外送时间</th>
			<th class="td">状态 </th>
			<th width="120" > </th>
           <%
           for (int i=1;i<=pageSize;i++){
              out.print("<tr>");
              String No=rs.getString(1);                                      //获得每一条记录的主键NO值
              out.print("<td class='td'>"+rs.getString(2)+"</td>");
              out.print("<td class='td'>"+rs.getString(6)+"</td>");
              out.print("<td class='td'>"+rs.getString(4)+"</td>");
			  out.print("<td class='td'>维修中</td>");
              out.print("<td class='td'>");
              out.print("<a href=finish.jsp?No="+No+" class='button' color='#3e5706' >"+"完成"+"</a>");
              out.print("</td>");
              out.print("</tr>");
              rs.next();
            }
           con.close();
           out.print("</table>");
           }catch(Exception e){
           System.out.println("与数据库连接异常");
           }
     %>
     <tr><center>
     <table cellpadding="0" cellspacing="0" width="730" border="0">
     <tr>
       <td width="43"><a href=Maintain.jsp?showPage1=1 >首页</a></td>
       <td width="59"><a href=Maintain.jsp?showPage1=<%=(showPage-1)%> >前一页</a></td>
       <td width="58"><a href=Maintain.jsp?showPage1=<%=(showPage+1)%> >下一页</a></td>
       <td width="51"><a href=Maintain.jsp?showPage1=<%=(pageCount)%> >末页</a></td>
       <td width="144">每页<%=pageSize%>行</td>
       <td width="178">现在是第<font color="red"><%=showPage%></font>页/共<font color="red"><%=pageCount%></font>页 </td>
       <form name="form1" method="post" action="Maintain.jsp">
          <td width="165">
            <input type="text" name="showPage1" size=8>
            <input type="submit" name="Submit" value="  转      到  " class="bt">      
          </td>
       </form>
     </tr></center> 
   </table>
   <p>&nbsp; 

	<jsp:include page="footer.jsp"></jsp:include>
    <br>
	</center>
  </body>
</html>

