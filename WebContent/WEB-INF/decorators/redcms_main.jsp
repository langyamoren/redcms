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
<title><decorator:title/>_红萌网</title>
<link href="res/css/redwww.css" rel="stylesheet" type="text/css" />
<script src="res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script language="javascript">
   $(function(){
     var h1 = $("#left").height(); //获取对象1的高度
	 var h2 = $("#right").height();  //获取对象2高度
	 var mh = Math.max( h1, h2); //比较一下
     $("#left").height(mh); //重设高度，让两边div 高度保持一至
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

/*指向*/
#pointer{width:740px; height:30px; line-height:30px; background:#F6F6F6 url(res/img/web/redbak.png) no-repeat -360px -392px;}
#pointer p{ height:30px; line-height:30px; float:left; width:700px; margin-left:25px; font-size:14px;color:#EC0000;}
#pointer p a{ text-decoration:none; font-size:14px; color:#EC0000; font-weight:bold; margin-right: 5px;}
#pointer p a:hover{ text-decoration:underline;}
#pointer form{ width:260px; float:left; width:260px;}

#pointer_right{ height:30px; line-height:30px;background:#F6F6F6;}
/*中间*/
#main{height:auto;}
#main #left{ width:740px; float:left;}
#main #right{ width:260px; float:left;}
	
/*中间主体右部*/
/*    #main #right{ float:right; width:250px; height:1280px; margin-right:2px;}*/
	#main #right #notice{ width:250px; border:1px #CCCCCC solid; height:110px; background:url(res/img/web/redbak.png) no-repeat -100px -460px; margin-bottom:5px;}
	#main #right #notice h5{ width:120px; height:20px; float:left; background:url(res/img/web/redbak.png) no-repeat -20px -110px; margin:5px 0px 7px 5px;}
	#main #right #notice ul{ clear:both; list-style:none;}
	#main #right #notice ul li{ line-height:24px; font-size:12px;background:url(res/img/web/redbak.png) no-repeat -371px -350px;}
	#main #right #notice ul li a{ margin-left:10px; color:#000000; text-decoration:none;}
	#main #right #notice ul li a:hover{ text-decoration:underline;}
	/*客服*/
	#main #right #callcenter ul { clear:both; list-style:none;}
	#main #right #callcenter ul li{ float:left; margin-left:2px; margin-right:6px; margin-bottom:3px;}
	/*最新课程*/
	#main #right #lastcourse{ border:1px #CCCCCC solid; width:255px; background:url(res/img/web/redbak.png) no-repeat -100px -460px; margin-bottom:5px;}
	#main #right #lastcourse h5{width:160px; height:30px; background:url(res/img/web/redbak.png) no-repeat -0px -255px; float:left;}
	#main #right #lastcourse ul{ clear:both; list-style:none; background:url(res/img/web/redbak.png) no-repeat -363px -36px; height:300px;}
	#main #right #lastcourse ul li{ }
	#main #right #lastcourse ul li a{ display:block;text-decoration:none; color:#000000; margin-left:23px;font-size:12px; line-height:28px;}
	#main #right #lastcourse ul li a.firstchapter{ line-height:40px; margin-bottom:8px; color:#EC0000; margin-left:37px; font-size:14px; font-weight:bold;}
	#main #right #lastcourse ul li a:hover{ text-decoration:underline;}
	/*最新开通VIP的会员*/
	#main #right #lastvip{ height:260px; border:1px #CCCCCC solid; background:url(img/bak.png) no-repeat -150px -145px; margin-bottom:5px;}
	#main #right #lastvip h5{ font-size:14px; font-weight:bold; background:url(img/bak.png) no-repeat  -380px -104px; padding-left:10px; margin:3px 0px 5px 0px; }
	#main #right #lastvip ul{ list-style:none;}
	#main #right #lastvip ul li{ line-height:22px; margin-left:5px;}
	/*QQ群助手*/
	#main #right #qqgroup ul{ list-style:none;}
	#main #right #qqgroup ul li{ float:left; margin:0 10px 10px 5px;}	
	
	
	/*友情链接*/
	#links{}
	#links h6{ margin-left:20px; font-weight:bold; }
	#links ul{ margin:10px;}
	#links ul li{ float:left; margin-right:10px;}
	#links ul li img{ border:0px;}
	/*页脚*/
	#footer{ text-align:center; line-height:30px;}
	#footer a{ text-decoration:none; color:#000000;}
	#footer a:hover{ text-decoration:underline;}
	
</style>

<decorator:head/>
</head>
<body>
<!--顶部-->
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
         欢迎您，<%=member.getName()%>!
     <%
     }else
     {
   %>
        红萌网欢迎您！
   <%
     }
  %>
   </p>
   <ul id="toplink">
   <%
      if(null!=member)
      {
      %>
      <li><a href="space/member">会员中心</a></li>
      <%
      }else
      {
   %>
		<li><a href="space/login">登陆</a></li>
		<li><a href="space/regist">注册</a></li>
	 <%
      }
	 %>
		<li><a href="http://list.qq.com/cgi-bin/qf_invite?id=adb294d0e34239e12e4380e7df147feb693c3ae3cf51804b">订阅邮件</a></li>
		<li><a href="http://http://yy.com/#54553966">YY 课堂</a></li>
  </ul>
   <div id="nav">
      <ul>
     
		<li><a href="<cms:webroot/>/html">首页</a></li>
		
		<li><a href="./html/<cms:channel id="16" property="path"/>/index.html">精品课程</a></li>
		<li><a href="./html/<cms:channel id="7" property="path"/>/index.html">精彩文章</a></li>
		<li><a href="./html/<cms:channel id="12" property="path"/>/index.html">精品下载</a></li>
		<li><a href="./html/spage/3_52.html">加入会员</a></li>
		<li><a href="./html/spage/3_53.html">联系我们</a></li>
		<li><a href="./html/spage/3_54.html">帮助</a></li>
   </ul>
  </div>
</div>
<!--指向-->
<!-- <div id="pointer">
<p><a href="#">红萌网首页</a></p>
<form action="#" method="post">
<input type="text" name="desc" value="请输要搜索的关键词" />
<select name="tt">
	<option>课程</option>
	<option>文章</option>
	<option>下载</option>
</select>
<input type="submit" value="搜索"/>
</form>
</div> -->
<div class="clear"></div>
<div id="main">
  <div id="left">
       <decorator:body></decorator:body>
  </div><!--end left-->
  
  <!--网站右面部分-->
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
<a href="html/spage/3_52.html" target="_blank">加入会员</a> |  
<a href="html/spage/3_53.html" target="_blank">关于我们</a> |  
<a href="html/spage/3_53.html" target="_blank">联系方式</a> |  
<a href="html/spage/3_54.html"  target="_blank">帮助</a>
<br />
Powered by <strong><a href="http://www.redwww.com" target="_blank">红萌网</a></strong>&copy; 2011 <img src="res/img/web/copyright.gif"/>陕ICP备09017466号&nbsp;&nbsp;<script src="http://s17.cnzz.com/stat.php?id=2698974&web_id=2698974&show=pic" language="JavaScript"></script>
</div>
 <div id="float_history" style="position:absolute;z-index:1000; top:30px; right:2px;">  
<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1613839994&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1613839994:53" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
　</div>
<script type="text/javascript">
lastScrollY = 0;
//下面这段删除后，对联将不跟随屏幕而移动。
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
