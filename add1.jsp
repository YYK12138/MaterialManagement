<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" type="text/css" href="css/table.css" />


<body>
<p>&nbsp; 
<div align="center">
<form id="form1" name="form1" method="post" action="addHandle.jsp">
<table class ="table" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td">资产编号 </td>
    <td class="td">
      <input type="text" class="td" name="No" />
    </td>
  </tr>
  <tr>
    <td class="td">名称</td>
    <td class="td"><input type="text" class="td" name="Name" /></td>
  </tr>
  <tr>
    <td class="td">型号</td>
    <td class="td"><input type="text" class="td" name="Type" /></td>
  </tr>
    <tr>
    <td class="td">规格</td>
    <td class="td"><input type="text" class="td" name="Specifications" /></td>
  </tr>
    <tr>
    <td class="td">存放地</td>
    <td class="td"><input type="text" class="td" name="Place" /></td>
  </tr>
    <tr>
    <td class="td">供应商</td>
    <td class="td"><input type="text" class="td" name="Supplier" /></td>
  </tr>
    <tr>
    <td class="td">出库去向</td>
    <td class="td"><input type="text" class="td" name="Borrowed" /></td>
  </tr>
  <tr>
    <td class="td">&nbsp;</td>
    <td class="td"><input type="submit" name="Submit" value="提交" />&nbsp;
      <input type="reset" name="Submit2" value="重置" /></td>
  </tr>
</table>
<p>&nbsp; 
<p>&nbsp;
<u><a href="lookfixedassets.jsp" style="color:#0000FF">返回列表</a></u>
 </form>
</body>

