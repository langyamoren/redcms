<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="com.redwww.beans.Member"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><decorator:title/>_������</title>
<link href="res/css/redwww.css" rel="stylesheet" type="text/css" />
<script src="res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script language="javascript">
   $(function(){
     var h1 = $("#left").height(); //��ȡ����1�ĸ߶�
	 var h2 = $("#right").height();  //��ȡ����2�߶�
	 var mh = Math.max( h1, h2); //�Ƚ�һ��
     $("#left").height(mh); //����߶ȣ�������div �߶ȱ���һ��
     $("#right").height(mh);
         
   });
</script>
<style type="text/css">
#top,#pointer,#main,#links,#footer{ width:1005px; margin:0 auto;}
#top{height:70px; position:relative;}
#top #redwwwlogo{ position:absolute; left:8px; top:19px;}
#top p{ position:absolute; left:217px; top:10px;}
#top #toplink{position:absolute;left:720px;top:11px;width: 264px;}
#top #toplink li{ float:left;}
#top #toplink li a{ color:#000000; text-decoration:none; margin:0 5px;}
#top #toplink li a:hover{ text-decoration:underline;}
#top #nav { width:800px; height:32px;position:absolute; left:207px; top:37px; background:url(res/img/web/redbak.png) repeat-x 0 0;}
#top #nav ul{ width:700px; height:28px;position:absolute; left:3px; top:6px;}
#top #nav ul li{ float:left;}
#top #nav ul li a{ display:block; padding:5px 5px; margin:0px 10px; text-decoration:none; font-size:14px; font-weight:bold; color:#FFFFFF;}
#top #nav ul li a:hover{ background:#FFFFFF; color:#EC0000;}

/*ָ��*/
#pointer{width:740px; height:30px; line-height:30px; background:#F6F6F6 url(res/img/web/redbak.png) no-repeat -360px -392px;}
#pointer p{ height:30px; line-height:30px; float:left; width:700px; margin-left:25px; font-size:14px;color:#EC0000;}
#pointer p a{ text-decoration:none; font-size:14px; color:#EC0000; font-weight:bold; margin-right: 5px;}
#pointer p a:hover{ text-decoration:underline;}
#pointer form{ width:260px; float:left; width:260px;}

#pointer_right{ height:30px; line-height:30px;background:#F6F6F6;}
/*�м�*/
#main{height:auto;}
#main #left{ width:740px; float:left;}
#main #right{ width:260px; float:left;}
	
/*�м������Ҳ�*/
/*    #main #right{ float:right; width:250px; height:1280px; margin-right:2px;}*/
	#main #right #notice{ width:250px; border:1px #CCCCCC solid; height:110px; background:url(res/img/web/redbak.png) no-repeat -100px -460px; margin-bottom:5px;}
	#main #right #notice h5{ width:120px; height:20px; float:left; background:url(res/img/web/redbak.png) no-repeat -20px -110px; margin:5px 0px 7px 5px;}
	#main #right #notice ul{ clear:both; list-style:none;}
	#main #right #notice ul li{ line-height:24px; font-size:12px;background:url(res/img/web/redbak.png) no-repeat -371px -350px;}
	#main #right #notice ul li a{ margin-left:10px; color:#000000; text-decoration:none;}
	#main #right #notice ul li a:hover{ text-decoration:underline;}
	/*�ͷ�*/
	#main #right #callcenter ul { clear:both; list-style:none;}
	#main #right #callcenter ul li{ float:left; margin-left:2px; margin-right:6px; margin-bottom:3px;}
	/*���¿γ�*/
	#main #right #lastcourse{ border:1px #CCCCCC solid; width:255px; background:url(res/img/web/redbak.png) no-repeat -100px -460px; margin-bottom:5px;}
	#main #right #lastcourse h5{width:160px; height:30px; background:url(res/img/web/redbak.png) no-repeat -0px -255px; float:left;}
	#main #right #lastcourse ul{ clear:both; list-style:none; background:url(res/img/web/redbak.png) no-repeat -363px -36px; height:300px;}
	#main #right #lastcourse ul li{ }
	#main #right #lastcourse ul li a{ display:block;text-decoration:none; color:#000000; margin-left:23px;font-size:12px; line-height:28px;}
	#main #right #lastcourse ul li a.firstchapter{ line-height:40px; margin-bottom:8px; color:#EC0000; margin-left:37px; font-size:14px; font-weight:bold;}
	#main #right #lastcourse ul li a:hover{ text-decoration:underline;}
	/*���¿�ͨVIP�Ļ�Ա*/
	#main #right #lastvip{ height:260px; border:1px #CCCCCC solid; background:url(img/bak.png) no-repeat -150px -145px; margin-bottom:5px;}
	#main #right #lastvip h5{ font-size:14px; font-weight:bold; background:url(img/bak.png) no-repeat  -380px -104px; padding-left:10px; margin:3px 0px 5px 0px; }
	#main #right #lastvip ul{ list-style:none;}
	#main #right #lastvip ul li{ line-height:22px; margin-left:5px;}
	/*QQȺ����*/
	#main #right #qqgroup ul{ list-style:none;}
	#main #right #qqgroup ul li{ float:left; margin:0 10px 10px 5px;}	
	
	
	/*��������*/
	#links{}
	#links h6{ margin-left:20px; font-weight:bold; }
	#links ul{ margin:10px;}
	#links ul li{ float:left; margin-right:10px;}
	#links ul li img{ border:0px;}
	/*ҳ��*/
	#footer{ text-align:center; line-height:30px;}
	#footer a{ text-decoration:none; color:#000000;}
	#footer a:hover{ text-decoration:underline;}
	
</style>

<decorator:head/>
</head>
<body>
<!--����-->
<div id="top">
   <a href="http://www.redwww.com"><img src="res/img/web/logo.png" border="0" id="redwwwlogo"/></a>
   <%
   Member member=(Member)session.getAttribute("memberinfo");
   
   %>
   <p>
   <%
     if(null!=member)
     {
     %>
         ��ӭ����<%=member.getName()%>!
     <%
     }else
     {
   %>
        ��������ӭ����
   <%
     }
  %>
   </p>
   <ul id="toplink">
   <%
      if(null!=member)
      {
      %>
      <li><a href="space/member">��Ա����</a></li>
      <%
      }else
      {
   %>
		<li><a href="space/login">��½</a></li>
		<li><a href="space/regist">ע��</a></li>
	 <%
      }
	 %>
		<li><a href="http://list.qq.com/cgi-bin/qf_invite?id=adb294d0e34239e12e4380e7df147feb693c3ae3cf51804b">�����ʼ�</a></li>
		<li><a href="http://http://yy.com/#54553966">YY ����</a></li>
  </ul>
   <div id="nav">
      <ul>
     
		<li><a href="<cms:webroot/>/html">��ҳ</a></li>
		
		<li><a href="./html/<cms:channel id="16" property="path"/>/index.html">��Ʒ�γ�</a></li>
		<li><a href="./html/<cms:channel id="7" property="path"/>/index.html">��������</a></li>
		<li><a href="./html/<cms:channel id="12" property="path"/>/index.html">��Ʒ����</a></li>
		<li><a href="./html/spage/3_52.html">�����Ա</a></li>
		<li><a href="./html/spage/3_53.html">��ϵ����</a></li>
		<li><a href="./html/spage/3_54.html">����</a></li>
   </ul>
  </div>
</div>
<!--ָ��-->
<!-- <div id="pointer">
<p><a href="#">��������ҳ</a></p>
<form action="#" method="post">
<input type="text" name="desc" value="����Ҫ�����Ĺؼ���" />
<select name="tt">
	<option>�γ�</option>
	<option>����</option>
	<option>����</option>
</select>
<input type="submit" value="����"/>
</form>
</div> -->
<div class="clear"></div>
<div id="main">
  <div id="left">
       <decorator:body></decorator:body>
  </div><!--end left-->
  
  <!--��վ���沿��-->
  <div id="right">
   <jsp:include page="/html/right.html" flush="true"></jsp:include>
  </div><!--end right-->
  <div style="clear:both;"></div>
</div><!--end main-->
<hr/>
<div style="clear:both;"></div>
<!-- 
<div id="links">
  
  <ul>
    <li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
	<li><a href="#"><img src="res/img/web/shenda.jpg" border="0"/></a></li>
  </ul>
</div>
 -->
<div style="clear:both;"></div>
<div id="footer">
<a href="html/spage/3_52.html" target="_blank">�����Ա</a> |  
<a href="html/spage/3_53.html" target="_blank">��������</a> |  
<a href="html/spage/3_53.html" target="_blank">��ϵ��ʽ</a> |  
<a href="html/spage/3_54.html"  target="_blank">����</a>
<br />
Powered by <strong><a href="http://www.redwww.com" target="_blank">������</a></strong>&copy; 2011 <img src="res/img/web/copyright.gif"/>��ICP��09017466��&nbsp;&nbsp;<script src="http://s17.cnzz.com/stat.php?id=2698974&web_id=2698974&show=pic" language="JavaScript"></script>
</div>
 <div id="float_history" style="position:absolute;z-index:1000; top:30px; right:2px;">  
<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1613839994&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1613839994:53" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a>
��</div>
<script type="text/javascript">
lastScrollY = 0;
//�������ɾ���󣬶�������������Ļ���ƶ���
window.setInterval("heartBeat()",1);
function heartBeat(){
var diffY;
if (document.documentElement && document.documentElement.scrollTop)
  diffY = document.documentElement.scrollTop;
else if (document.body)
  diffY = document.body.scrollTop
percent=.1*(diffY-lastScrollY);
if(percent>0){
  percent=Math.ceil(percent);
}
else{
  percent=Math.floor(percent);
}
document.getElementById("float_history").style.top = parseInt(document.getElementById("float_history").style.top)+percent+"px";
lastScrollY=lastScrollY+percent;
}
</script> 
</body>
</html>
