<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>右部分</title>
</head>
<body>
 <div id="pointer_right">
  <form action="#" method="post">
<input type="text" name="desc" value="请输要搜索的关键词" />
<select name="tt">
	<option>课程</option>
	<option>文章</option>
	<option>下载</option>
</select>
<input type="submit" value="搜索"/>
</form>
  </div>
  <!--网站公告-->
    <div id="notice">
	   <h5></h5>
	  <!--   <a href="#" class="more">更多&gt;&gt;</a>-->
	   <ul>
	        <cms:artList model="articles" channelId="4" top="3">
	        	<li><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="16"/></a></li>
	        </cms:artList>
	   </ul>
	</div>
	<!--在线客服图片-->
	<img src="res/img/web/callcenter.jpg" style=" margin-bottom:5px;"/>
	<!--在线客服-->
<div id="callcenter">
	  <ul>
	    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1613839994&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1613839994:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1987388828&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1987388828:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <!-- 
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
	     -->
	  </ul>
	  <div style="margin:5px 0px;">
	  <!--以下是QQ邮件列表订阅嵌入代码--><script >var nId = "ebc12e3eae8d1a7d02deb41c93abc9e02c63995c0bfea59c",nWidth="220px",sColor="light",sText="填写邮件地址，订阅我们的精彩内容：" ;</script><script src="http://list.qq.com/zh_CN/htmledition/js/qf/page/qfcode.js" charset="gb18030"></script>
	  </div>
	</div>
		<div class="clear"></div>
	
    <!-- 最新课程 --> 
	<div id="lastcourse">
	  <h5></h5>
	  <a href="./<cms:channel id="16" property="path"/>/index.html" class="more">更多&gt;&gt;</a>
	  <ul>
	           <%int findex=0; %>
	           <cms:artList model="course" top="10">
	            <%if(findex++==0){ %>
	             <li><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" class="firstchapter" ><cms:property name="title" maxSize="13"/></a></li>
	            <%}else{ %>
	            <li><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" ><cms:property name="title" maxSize="17"/></a></li>
				<%} %>
				</cms:artList>
	  </ul>
	</div>
		<!--微薄-->
	<div style="width:255px; height:400px; margin-bottom: 5px;">
	<iframe frameborder="0" scrolling="no" src="http://show.v.t.qq.com/index.php?c=show&a=index&n=redwww&w=255&h=402&fl=2&l=6&o=15&co=0" width="255" height="402"></iframe>
     </div>
     <div style="width:255px;">
<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 方块250*250 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:250px;height:250px"
     data-ad-client="ca-pub-2147148573164130"
     data-ad-slot="7998761188"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
     </div>
   </div>
</body>
</html>