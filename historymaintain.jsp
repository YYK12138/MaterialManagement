<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>��ƴ���Ϣ�����豸����ϵͳ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />  
  </head>  
  <body bgcolor=#FFFFFF>
  <!-- ������ -->
  <link rel="stylesheet" type="text/css" href="css/submit.css" />
  <center>
    <jsp:include page="navbar.jsp">
  	<jsp:param value="#e95404" name="color"/></jsp:include>
 
		<img src="images/wust1.jpg" width=100% height=60%>
		<hr/>
        <blockquote><table><tr>
		<a href="submit.jsp" class="button3">����ά��</a>
        <a href="historymaintain.jsp" class="button2">��ʷά�޼�¼</a>
		<a href="***" class="button3">���(���ӿ�����)</a>
		</tr></table></blockquote>
		<%//��ȡ���ݿ�mysql��������
         try{
           Class.forName("com.mysql.jdbc.Driver");
         }catch(ClassNotFoundException e){
           System.out.println("Class Not Found");
         }
         //��ָ�����ݿ�ʵ��materialmanagement���ӣ����в�ѯ����%>
	    <hr/ color=#EFFFFF>--------------ά�޼�¼��ѯ---------------
<form action="look.jsp" method=post name=form>
  <table border="0"> 
  
   <tr  height="45">
   
    <td width="80" align="center">��������</td>
	<td width="100" align="center">
	<select name = condition>
	    <option value = "ANo">�ʲ����
		<option value = "RepairUser">ά���˱��
		<option value = "RepairTime">ά��ʱ��
		<option value = "ReturnTime">�黹ʱ��
	</select></td>
    <td width="200" align="center"><input type="text" name="content"/></td>
	<td width="200" ><input type="submit" class="button" value="�ύ">
    </tr>
	</table>
	</form> 
	    <hr/ color=#FFFFFF>--------------ά���豸�б�---------------<p>
     <%! 
	     int pageSize=9;//ÿҳ��ʾ�ļ�¼����
         int pageCount=0; //��ҳ�����ҳ����
	     int showPage=1;
     %> 
     <%  
         try{
            Connection con;
            Statement stmt;
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/materialmanagement","root","");
            stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String sql="SELECT repairlist.*,`user`.UserName FROM repairlist,`user` WHERE  repairlist.RepairUser=`user`.ID ORDER BY RepairTime DESC;";
			//��ѯά���豸����Ϣ
            ResultSet rs=stmt.executeQuery(sql);
	        //���α��ƶ������һ�У�
            rs.last();
            //��ȡ���һ�е��кţ�
            int lastRow=rs.getRow();
            //�����ҳ�����ҳ����
            pageCount=(lastRow%pageSize==0)?(lastRow/pageSize):(lastRow/pageSize+1);
            //��ǰ��ʾ�ĳ�ʼҳ��/��֪�ͻ���ҳ��
            String integer=request.getParameter("showPage1");
            if(integer==null)//���ڳ�������userList1.jspʱ�Ĵ���
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
            rs.absolute(posion); // �����α��λ��
			%>
			<table border ="1" cellpadding="0" cellspacing="0" align="center" >
            <th class="td">�ʲ����</th>
            <th class="td">ά����Ա</th>
			<th class="td">��Ա���</th>
            <th class="td">����ʱ��</th>
			<th class="td">�黹ʱ��</th>
			<th width="170" > </th>
           <%
           for (int i=1;i<=pageSize;i++){
              out.print("<tr>");
              String No=rs.getString(1);//
              out.print("<td class='td'>"+rs.getString(2)+"</td>");
			  out.print("<td class='td'>"+rs.getString(6)+"</td>");
              out.print("<td class='td'>"+rs.getString(3)+"</td>");
              out.print("<td class='td'>"+rs.getString(4)+"</td>");
			  out.print("<td class='td'>"+rs.getString(5)+"</td>");
              out.print("<td class='td' 	>");
              out.print("<a href=*****.jsp?******="+No+ " class='button'>"+"��ϸ��Ϣ"+"</a>");
              out.print("&nbsp;");out.print("&nbsp;");
              out.print("</td>");
              out.print("</tr>");
              rs.next();
            }
           con.close();
           out.print("</table>");
           }catch(Exception e){
           System.out.println("�����ݿ������쳣");
           }
     %>
     <tr>
     <table cellpadding="0" cellspacing="0" width="730">
     <tr>
       <td width="43"><a href=historymaintain.jsp?showPage1=1 >��ҳ</a></td>
       <td width="59"><a href=historymaintain.jsp?showPage1=<%=(showPage-1)%> >ǰһҳ</a></td>
       <td width="58"><a href=historymaintain.jsp?showPage1=<%=(showPage+1)%> >��һҳ</a></td>
       <td width="51"><a href=historymaintain.jsp?showPage1=<%=(pageCount)%> >ĩҳ</a></td>
       <td width="144">ÿҳ<%=pageSize%>��</td>
       <td width="178">�����ǵ�<font color="red"><%=showPage%></font>ҳ/��<font color="red"><%=pageCount%></font>ҳ </td>
       <form name="form1" method="post" action="Maintain.jsp">
          <td width="165">
            <input type="text" name="showPage1" size=8>
            <input type="submit" name="Submit" value="  ת      ��  " class="bt">      
          </td>
       </form>
     </tr> 
   </table>
   <p>&nbsp; 			

	<jsp:include page="footer.jsp"></jsp:include>
    <br>
	</center>
  </body>
</html>

