<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>内容字段管理</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script type="text/javascript">
   $(function(){
	  
	   $("#deletebatch").click(function(){
		   var deleteurl="model?action=deleteField&modelId=${modelId}";
		   $("#validform input:checked").each(function(){
			  deleteurl=deleteurl.concat("&ids=",$(this).val());
		   });
		   window.location=deleteurl;
		  
	   });
	   
	   
	   $("#selectall").click(function(){
		   var val=$(this).val();
		   if(val=="取消")
			   {
			   $("#invalidform :checkbox").removeAttr("checked");
			   $(this).val("全选");
			   }else
				{
				   $("#invalidform :checkbox").attr("checked","checked");
				   $(this).val("取消");
				}
	   });
 
   });
</script>
</head>
<body>

<%
	  //可用字段
	 List<ModelItem> valids=(List<ModelItem>)request.getAttribute("valids");
	 if(null!=valids&&valids.size()>0)
	 {
 %>
 <form action="model" method="post" id="validform">
 <input type="hidden" name="action" value="updateField"/>
 <input type="hidden" name="modelId" value="${modelId}"/>
	<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <th width="49" align="center">&nbsp;</th>
	    <th width="100" align="center">字段</th>
	    <th width="197" align="center">显示</th>
	    <th width="254" align="center">默认值</th>
	    <th width="254" align="center">操作</th>
	  </tr>
		   <%
		   for(ModelItem mi:valids)
		   {
		   %>
		   <tr>
		    <td align="center">
		    <input name="ids" type="checkbox" id="txtfield" value="<%=mi.getId()%>"/></td>
		    <td><p><%=mi.getName()%></p></td>
		    <td><input name="label<%=mi.getId()%>" type="text" id="disp" value="<%=mi.getLabel()%>"/></td>
		    <td align="center"><input name="defvalue<%=mi.getId()%>" type="text" id="defvalue" value="<%=mi.getDefValue()%>"/></td>
		    <td align="center"><a href="model?action=deleteField&modelId=${modelId}&ids=<%=mi.getId()%>">删除</a></td>
		  </tr>
		<%  } 
		%>
		<tr>
	    <td colspan="5" align="left">
	    <input type="button" id="deletebatch"  value="删除选中字段">&nbsp;<input type="submit" value="更新字段值"/>
	    </td>
	  </tr>
	</table>
</form>	
<%} %>
<!-- 不可用的字段 -->
 <form action="model" method="post" id="invalidform">
<input type="hidden" name="action" value="validfield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">字段</th>
    <th width="197" align="center">显示</th>
    <th width="254" align="center">默认值</th>
    <th width="254" align="center">操作</th>
  </tr>

      <%
      List<ModelItem> invalids=(List<ModelItem>)request.getAttribute("invalids");
 	 if(null!=invalids&&invalids.size()>0)
 	 {
		   for(ModelItem mi:invalids)
		   {
		   %>
		   <tr>
		    <td align="center">
		    <input name="ids" type="checkbox" id="txtfield" value="<%=mi.getId()%>"/></td>
		    <td><p><%=mi.getName()%></p></td>
		    <td><input name="label" type="text" id="disp" value="<%=mi.getLabel()%>"/></td>
		    <td align="center"><input name="defvalue<%=mi.getId()%>" type="text" id="defvalue" value="<%=mi.getDefValue()%>"/></td>
		    <td align="center"><a href="model?action=validfield&&modelId=${modelId}&ids=<%=mi.getId()%>">还原</a></td>
		  </tr>
		<%  } 
		   
 	 }
		%>
	<tr>
    <td colspan="5" align="left">
    <input type="button" value="全选" id="selectall"/>
    <input type="submit" value="还原为系统字段">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form> 
<red:msgdig/>
</body>
</html>