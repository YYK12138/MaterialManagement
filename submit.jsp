<%@page contentType="text/html;charset=gb2312" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="submit" class="mybean.data.submit" scope="request"></jsp:useBean>
<jsp:useBean id="userBean" class="mybean.data.submit" scope="request"></jsp:useBean>
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
  <body bgcolor="FFFFFF">
    <jsp:include page="navbar.jsp"><jsp:param value="#e95404" name="color"/></jsp:include>
    <jsp:include page="lunbo.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="css/submit.css" />
    
	<center>
    
    <legend>ά�޼�¼��д</legend>
	<form action ="submitservlet" method="post" name=form >
    
    <table width="600" border="0" >
	
    <tr  height="45">
    <td width="200" align="center">�ʲ����</td>
    <td width="400"><input type="text" name="ANo"/> *</td>
    </tr>
	
    <tr  height="45">
    <td align="center"/>ά����Ա���</td>
    <td><input type="text" name="RepairUser" /> *</td>
    </tr>

    <tr   height="45">
    <td align="center">ά��ʱ��</td>
    <td><input type="text" name="RepairTime" /> *(��ʽ ������ ��20160901)</td>
    </tr>

    <tr   height="45">
    <td align="center">�黹ʱ��</td>
    <td><input type="text" name="ReturnTime" /> &nbsp(δ���ά��������д)</td>
    </tr>
    </table>
    
    <tr><td align="center">
	  <input class="button" type="submit" name="g" value="�ύ"/>
      <input class="button" type="reset" name="Submit2" value="����" />
	  <input class="button" type="button" value="����" onclick="javascript:history.go(-1);"/>
    </td></tr>	
 </form>
 <div align="center">
 <br><jsp:getProperty name="userBean" property="backNews"/></br>
 </div>
<jsp:include page="footer.jsp"></jsp:include>
</center>
</body>
</html>