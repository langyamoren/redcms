<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�����ֶι���</title>
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
		   if(val=="ȡ��")
			   {
			   $("#invalidform :checkbox").removeAttr("checked");
			   $(this).val("ȫѡ");
			   }else
				{
				   $("#invalidform :checkbox").attr("checked","checked");
				   $(this).val("ȡ��");
				}
	   });
 
   });
</script>
</head>
<body>

<%
	  //�����ֶ�
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
	    <th width="100" align="center">�ֶ�</th>
	    <th width="197" align="center">��ʾ</th>
	    <th width="254" align="center">Ĭ��ֵ</th>
	    <th width="254" align="center">����</th>
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
		    <td align="center"><a href="model?action=deleteField&modelId=${modelId}&ids=<%=mi.getId()%>">ɾ��</a></td>
		  </tr>
		<%  } 
		%>
		<tr>
	    <td colspan="5" align="left">
	    <input type="button" id="deletebatch"  value="ɾ��ѡ���ֶ�">&nbsp;<input type="submit" value="�����ֶ�ֵ"/>
	    </td>
	  </tr>
	</table>
</form>	
<%} %>
<!-- �����õ��ֶ� -->
 <form action="model" method="post" id="invalidform">
<input type="hidden" name="action" value="validfield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">�ֶ�</th>
    <th width="197" align="center">��ʾ</th>
    <th width="254" align="center">Ĭ��ֵ</th>
    <th width="254" align="center">����</th>
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
		    <td align="center"><a href="model?action=validfield&&modelId=${modelId}&ids=<%=mi.getId()%>">��ԭ</a></td>
		  </tr>
		<%  } 
		   
 	 }
		%>
	<tr>
    <td colspan="5" align="left">
    <input type="button" value="ȫѡ" id="selectall"/>
    <input type="submit" value="��ԭΪϵͳ�ֶ�">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form> 
<red:msgdig/>
</body>
</html>