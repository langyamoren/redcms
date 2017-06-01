<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>增加管理员</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<link type="text/css" rel="stylesheet" href="../res/formvalidator/style/validator.css"></link>
<script src="../res/formvalidator/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="../res/formvalidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"form1",debug:false,submitOnce:true,
		submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
	});
	
	$("#email").formValidator({onShow:"请输入邮箱",onFocus:"邮箱6-100个字符,输入正确了才能离开焦点",onCorrect:"恭喜你,你输对了",defaultValue:"info@redwww.com"}).inputValidator({min:6,max:100,onError:"你输入的邮箱长度非法,请确认"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"你输入的邮箱格式不正确"});
	$("#pwd").formValidator({onShow:"请输入密码",onFocus:"至少1个长度",onCorrect:"密码合法"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"});
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
    <th colspan="3" align="left">&nbsp;增加管理员</th>
  </tr>
  <tr>
    <td width="200" align="right" valign="middle">Email：</td>
    <td width="200"><input type="text" name="email" id="email"></td>
    <td><div id="emailTip"></div></td>
  </tr>
  <tr>
    <td align="right" valign="middle">密码：</td>
    <td><input type="text" name="passwd" id="pwd"></td>
    <td><div id="pwdTip"></div></td>
  </tr>
  <tr>
    <td align="right" valign="middle">级别：</td>
    <td>
    <select name="purview">
         <option value="10000000000000000000000000000">系统管理员</option>
         <option value="01000000000000000000000000000">普通管理员</option>
    </select>
    </td>
  </tr>
  <!--
  <tr>
    <td  align="right" valign="middle">权限：</td>
    <td align="left" valign="top">
	<div class="pudiv"><input type="checkbox" name="prim1" id="prim1" value="1"/>1、全权</div>
	<div class="pudiv"><input type="checkbox" name="prim2" id="prim2" value="1"/>2、系统用户管理</div>
	<div class="pudiv"><input type="checkbox" name="prim3" id="prim3" value="1"/>3、模型管理</div>
	<div class="pudiv"><input type="checkbox" name="prim4" id="prim4" value="1"/>4、栏目管理</div>
	<div class="pudiv"><input type="checkbox" name="prim5" id="prim5" value="1"/>5、文章管理</div>
	<div class="pudiv"><input type="checkbox" name="prim6" id="prim6" value="1"/>6、资源管理</div>
	<div class="pudiv"><input type="checkbox" name="prim7" id="prim7" value="1"/>7、模板管理</div>
	<div class="pudiv"><input type="checkbox" name="prim8" id="prim8" value="1"/>8、会员管理</div>
	<div class="pudiv"><input type="checkbox" name="prim9" id="prim9" value="1"/>9、财务管理</div>
	<div class="pudiv"><input type="checkbox" name="prim10" id="prim10" value="1"/>10、兑现管理</div>	</td>
  </tr>
  -->
  <tr>
    <td colspan="3" align="center" valign="middle"><input type="submit" name="Submit" value="增加管理员"></td>
    </tr>
</table>
</form>
<div style="clear:both;"></div>

<table width="660" border="0" align="center" cellpadding="0" cellspacing="0"   class="redtable">
  <tr>
    <th width="50" align="center">序号</th>
    <th width="180" align="center">管理员名</th>
    <th width="100" align="center">级别</th>
    <th width="100" align="center">密码</th>
    <th align="center">操作</th>
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
             <option value="10000000000000000000000000000" selected="selected">系统管理员</option>
             <option value="01000000000000000000000000000">普通管理员</option>
           </select>
           <% 	
            }else
            {
            	  %>
                  <select  name="purview">
                    <option value="10000000000000000000000000000">系统管理员</option>
                    <option value="01000000000000000000000000000"  selected="selected">普通管理员</option>
                  </select>
        <% 	
            }
        %>        </td>
		<td align="center" valign="middle">
		<input type="hidden" value="update" name="action"/>
		<input type="hidden" name="mid" value="<%=ma.getId()%>"/>
		<input type="password" name="passwd"></td>
	    <td align="center" valign="middle">
	    <input name="submit" type="submit" value="修改"/> 
	    <input type="button" value="删除" onclick="window.location='manager?action=delete&mid=<%=ma.getId()%>'"/></td>
	  </tr>
  </form>
  <%  
	  }
  }
  %>
</table>

</body>
</html>