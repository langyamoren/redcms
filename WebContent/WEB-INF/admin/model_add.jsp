<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>����ģ��</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<link type="text/css" rel="stylesheet" href="../res/formvalidator/style/validator.css"></link>
<script src="../res/formvalidator/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="../res/formvalidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"form1",alertMessage:true,onError:function(msg){alert(msg)}});
	$("#name").formValidator().inputValidator({min:1,onError:"ģ��������Ϊ��,��ȷ��"});
	$("#tableName").formValidator().inputValidator({min:1,onError:"��������Ϊ��,��ȷ��"});
	
});
</script>
</head>
<body>
<form action="model" method="post" id="form1">
<input type="hidden" name="action" value="saveAdd">
<table width="811" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
    <th colspan="4" align="left">����ģ��</th>
  </tr>
  <tr>
    <td width="9%" align="right">ģ������</td>
    <td width="32%"><input name="name" type="text" id="name"></td>
    <td colspan="2" align="left">������
      <input name="tableName" type="text" id="tableName" size="10">һ����Ӣ��</td>
    </tr>
  <tr>
    <td align="right">������</td>
    <td colspan="3"><textarea name="description" cols="40" rows="5" id="description"></textarea></td>
    </tr>
  <tr>
    <td align="right">ģ�棺</td>
	    <td colspan="3">
		    <p>
		      ��ҳ��<red:temFile temName="index" id="indexTemp" name="indexTemp" />
		      �б�<red:temFile temName="list" id="listTemp" name="listTemp"/>
		       ���ݣ�<red:temFile temName="content" id="contentTemp" name="contentTemp" />
		   </p> 
	   </td>
    </tr>
  <tr>
    <td align="right">����ͼ��</td>
    <td>��
      <input name="titleWidth" type="text" id="titleWidth" value="140" size="5">
      �ߣ�
      <input name="titleHeight" type="text" id="titleHeight" value="80" size="5"></td>
    <td width="28%" align="right">����ͼ��</td>
    <td width="31%">��
      <input name="contentWidth" type="text" id="contentWidth" value="310" size="5">
      �ߣ�
      <input name="contentHeight" type="text" id="contentHeight" value="120" size="5"></td>
  </tr>
  <tr>
    <td align="right">�Ƿ�Ĭ�ϣ�</td>
    <td><input type="radio" name="isDef" value="1">
      ��
      <input name="isDef" type="radio" value="0" checked>
      ��</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" align="center" valign="middle"><input type="submit" name="Submit" value="�ύ">
      &nbsp; <input type="reset" name="Submit2" value="����"></td>
    </tr>
</table>
</form>
</body>
<red:msgdig/>
</html>