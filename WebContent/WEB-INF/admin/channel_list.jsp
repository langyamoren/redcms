<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>栏目管理</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="redtable" width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6">
    <form name="form1" method="post" action="channel">
    <input type="hidden" name="action" value="add"/>
    <input type="hidden" name="parentId" value="0"/>
         选择模型：<red:modelList/>
	  <input type="submit" name="Submit" value="增加顶级类别">
    </form>    </td>
  </tr>
  <tr>
    <th width="44" align="center">序号</th>
    <th width="43" align="center">排序</th>
    <th width="348" align="center">栏目名称</th>
    <th width="68" align="center">所属模型</th>
    <th width="169" align="center">增加子栏目 </th>
    <th width="88" align="center">管理</th>
  </tr>
  <red:channellist/>
</table>
<red:msgdig/>
</body>
</html>