<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ģ�����</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
   <form action="template" method="post" style="margin-tep:80px;">
        <input type="hidden" name="action" value="add"/>
     �ļ���:<input type="text" name="fname" />ע���ļ���ֻ��Ϊ*_index.jsp,*_list.jsp,*_content.jsp<br/>
        <input type="submit" value="����"/>
   </form>
</center>
   
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
    <th width="58" align="center">���</th>
    <th width="425" align="center">ģ���ļ���</th>
    <th width="117" align="center">����</th>
  </tr>
  <%
     String fils[]=(String[])request.getAttribute("temps");
  if(null!=fils&&fils.length>0)
  {
	    for(int i=0;i<fils.length;i++)
	    {
	    	String f=fils[i];
  %>
  <tr>
    <td align="center"><%=i+1%></td>
    <td align="center"><%=f%></td>
    <td align="center"><a href="template?action=edit&fname=<%=f%>">�޸�</a>&nbsp;<a href="template?action=delete&fname=<%=f%>">ɾ��</a></td>
  </tr>
  <%
	    }
  }
  %>

</table>
</body>
</html>