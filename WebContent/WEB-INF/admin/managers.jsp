<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>���ӹ���Ա</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<link type="text/css" rel="stylesheet" href="../res/formvalidator/style/validator.css"></link>
<script src="../res/formvalidator/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="../res/formvalidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"form1",debug:false,submitOnce:true,
		submitAfterAjaxPrompt : '�����������첽��֤�����Ե�...'
	});
	
	$("#email").formValidator({onShow:"����������",onFocus:"����6-100���ַ�,������ȷ�˲����뿪����",onCorrect:"��ϲ��,�������",defaultValue:"info@redwww.com"}).inputValidator({min:6,max:100,onError:"����������䳤�ȷǷ�,��ȷ��"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"������������ʽ����ȷ"});
	$("#pwd").formValidator({onShow:"����������",onFocus:"����1������",onCorrect:"����Ϸ�"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"�������߲����пշ���"},onError:"���벻��Ϊ��,��ȷ��"});
});
</script>
<style type="text/css">
.pudiv{ width:120px; height:24px; line-height:24px; float:left;}
</style>
</head>
<body>
<form action="manager" method="post" id="form1">
<input type="hidden" value="add" name="action"/>
<table width="660" border="0" align="center" cellpadding="0" cellspacing="0"  class="redtable">
  <tr>
    <th colspan="3" align="left">&nbsp;���ӹ���Ա</th>
  </tr>
  <tr>
    <td width="200" align="right" valign="middle">Email��</td>
    <td width="200"><input type="text" name="email" id="email"></td>
    <td><div id="emailTip"></div></td>
  </tr>
  <tr>
    <td align="right" valign="middle">���룺</td>
    <td><input type="text" name="passwd" id="pwd"></td>
    <td><div id="pwdTip"></div></td>
  </tr>
  <tr>
    <td align="right" valign="middle">����</td>
    <td>
    <select name="purview">
         <option value="10000000000000000000000000000">ϵͳ����Ա</option>
         <option value="01000000000000000000000000000">��ͨ����Ա</option>
    </select>
    </td>
  </tr>
  <!--
  <tr>
    <td  align="right" valign="middle">Ȩ�ޣ�</td>
    <td align="left" valign="top">
	<div class="pudiv"><input type="checkbox" name="prim1" id="prim1" value="1"/>1��ȫȨ</div>
	<div class="pudiv"><input type="checkbox" name="prim2" id="prim2" value="1"/>2��ϵͳ�û�����</div>
	<div class="pudiv"><input type="checkbox" name="prim3" id="prim3" value="1"/>3��ģ�͹���</div>
	<div class="pudiv"><input type="checkbox" name="prim4" id="prim4" value="1"/>4����Ŀ����</div>
	<div class="pudiv"><input type="checkbox" name="prim5" id="prim5" value="1"/>5�����¹���</div>
	<div class="pudiv"><input type="checkbox" name="prim6" id="prim6" value="1"/>6����Դ����</div>
	<div class="pudiv"><input type="checkbox" name="prim7" id="prim7" value="1"/>7��ģ�����</div>
	<div class="pudiv"><input type="checkbox" name="prim8" id="prim8" value="1"/>8����Ա����</div>
	<div class="pudiv"><input type="checkbox" name="prim9" id="prim9" value="1"/>9���������</div>
	<div class="pudiv"><input type="checkbox" name="prim10" id="prim10" value="1"/>10�����ֹ���</div>	</td>
  </tr>
  -->
  <tr>
    <td colspan="3" align="center" valign="middle"><input type="submit" name="Submit" value="���ӹ���Ա"></td>
    </tr>
</table>
</form>
<div style="clear:both;"></div>

<table width="660" border="0" align="center" cellpadding="0" cellspacing="0"   class="redtable">
  <tr>
    <th width="50" align="center">���</th>
    <th width="180" align="center">����Ա��</th>
    <th width="100" align="center">����</th>
    <th width="100" align="center">����</th>
    <th align="center">����</th>
  </tr>
  <%
  List<Manager> list=(List<Manager>)request.getAttribute("managers");
  if(null!=list&&list.size()>0)
  {
	  int index=1;
	  for(Manager ma:list)
	  {
  %>
  <form action="manager" method="post">
     
	  <tr>
		<td align="center" valign="middle"><%=index++ %></td>
		<td align="center" valign="middle"><%=ma.getEmail()%></td>
		<td align="center" valign="middle">
        <%
            if(ma.getPurview().startsWith("100"))
            {
            	%>
           <select name="purview">
             <option value="10000000000000000000000000000" selected="selected">ϵͳ����Ա</option>
             <option value="01000000000000000000000000000">��ͨ����Ա</option>
           </select>
           <% 	
            }else
            {
            	  %>
                  <select  name="purview">
                    <option value="10000000000000000000000000000">ϵͳ����Ա</option>
                    <option value="01000000000000000000000000000"  selected="selected">��ͨ����Ա</option>
                  </select>
        <% 	
            }
        %>        </td>
		<td align="center" valign="middle">
		<input type="hidden" value="update" name="action"/>
		<input type="hidden" name="mid" value="<%=ma.getId()%>"/>
		<input type="password" name="passwd"></td>
	    <td align="center" valign="middle">
	    <input name="submit" type="submit" value="�޸�"/> 
	    <input type="button" value="ɾ��" onclick="window.location='manager?action=delete&mid=<%=ma.getId()%>'"/></td>
	  </tr>
  </form>
  <%  
	  }
  }
  %>
</table>

</body>
</html>