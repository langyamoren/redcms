<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>红萌网首页</title>
<link href="res/css/redwww.css" rel="stylesheet" type="text/css" />
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
#pointer{ height:30px; line-height:30px; background:#F6F6F6 url(res/img/web/redbak.png) no-repeat -360px -392px;}
#pointer p{ height:30px; line-height:30px; float:left; width:700px; margin-left:25px;}
#pointer p a{ text-decoration:none; font-size:14px; color:#EC0000; font-weight:bold;}
#pointer p a:hover{ text-decoration:underline;}
#pointer form{ width:260px; float:left; width:260px;}

/*中间*/
#main{ margin-top:5px;}
#main #left{ width:740px; height:1260px; float:left;}
#main #right{ width:260px; height:1260px; float:left;}

/*左半部分*/
#left #left_top{ margin-left:10px; width:720px; height:635px;}
#left #left_top #left_top_left{ width:346px;  height:635px; float:left;}
#left #left_top #left_top_right{ width:370px;  height:635px; float:right;}
/*焦点广告*/
#left #left_top #left_top_left #focus_ad{ width:346px; height:227px;}

/*hot课程*/
#left #left_top #left_top_left #hot_course{ width:344px; height:400px; border:1px #CCCCCC solid; margin-top:5px; background:url(res/img/web/redbak.png) no-repeat 0 -459px;}
#left #left_top #left_top_left #hot_course h5{ width:106px; height:20px; background: url(res/img/web/redbak.png) no-repeat -4px -40px; float:left; margin:5px 0px 5px 5px;}
	.more{ color:#000000; text-decoration:none; display:block; font-size:12px; float:right;margin:5px 10px 0px 0px;}
	.more:hover{ text-decoration:underline;}
#left #left_top #left_top_left #hot_course ul{ padding:0; margin:0; clear:both; list-style:none; width:340px; margin-left:2px;}
#left #left_top #left_top_left #hot_course ul li{ height:110px; border-bottom:1px #CCCCCC dashed; padding-bottom:5px; margin-bottom:5px;}
#left #left_top #left_top_left #hot_course ul li h6 a{font-size:14px; color:#CE0000; display:block; line-height:30px; height:30px; text-decoration:none;}
#left #left_top #left_top_left #hot_course ul li h6 a:hover{ text-decoration:underline;}
#left #left_top #left_top_left #hot_course ul li img{ float:left; margin-right:6px;}
#left #left_top #left_top_left #hot_course ul li p{ float:left; font-size:12px; line-height:20px; width:192px; height:80px; overflow:hidden;}
#left #left_top #left_top_left #hot_course ul li p a{ text-decoration:none; color:#EC0000;}
#left #left_top #left_top_left #hot_course ul li p a:hover{ text-decoration:underline;}

/*每日 焦点*/
#left #left_top #left_top_right #todayfocus{ width:365px;margin-top:5px; float:right;}

#left #left_top #left_top_right #todayfocus h5{width:175px; height:21px; background:url(res/img/web/redbak.png) no-repeat 0px -73px; float:left; margin-bottom:5px;}
	
#left #left_top #left_top_right #todayfocus ul.topfocus{ list-style:none; clear:both; border-bottom:1px #CCCCCC solid; margin-bottom:10px; border-top:1px #CCCCCC solid; padding:5px 0 5px 0;}
#left #left_top #left_top_right #todayfocus ul.topfocus li{ height:22px; line-height:22px; background:url(res/img/web/redbak.png) no-repeat -369px -332px;}
#left #left_top #left_top_right #todayfocus ul.topfocus li a{ margin-left:12px; text-decoration:none; color:#cc0000; }
#left #left_top #left_top_right #todayfocus ul.topfocus li a:hover{ text-decoration:underline;}
	
#left #left_top #left_top_right #todayfocus ul.botfocus{ list-style:none; clear:both; }
#left #left_top #left_top_right #todayfocus ul.botfocus li{ height:22px; line-height:22px; background:url(res/img/web/redbak.png) no-repeat -369px -350px;}
#left #left_top #left_top_right #todayfocus ul.botfocus li a{ margin-left:12px; text-decoration:none; color:#000000;}
#left #left_top #left_top_right #todayfocus ul.botfocus li a:hover{ text-decoration:underline;}
	
	/*站长日志*/
#left #left_top #left_top_rightt #blogs{}
#left #left_top #left_top_right  #blogs h5{ width:140px; height:20px; background:url(res/img/web/redbak.png) no-repeat 05px -151px; float:left; margin:5px 0px 10px 5px;}
	
#left #left_top #left_top_right  #blogs #discrib{ height:80px; border-bottom:1px #CCCCCC dashed; padding:3px 0px; width:370px; margin:0 auto;clear:both; border-top:1px #CCCCCC solid;}
#left #left_top #left_top_right  #blogs #discrib img{ margin:0 5px 5px 5px; width:90px; height:70px; border:1px #CCCCCC solid; padding:2px; float:left;}
#left #left_top #left_top_right  #blogs #discrib #discrib_right{ width:260px; float:left;}
#left #left_top #left_top_right  #blogs #discrib h6 a{ display:block; line-height:22px;text-decoration:none; font-size:14px; font-weight:bold; color:#EC0000; margin-bottom:5px;}
#left #left_top #left_top_right  #blogs #discrib h6 a:hover{ text-decoration:underline;}
#left #left_top #left_top_right  #blogs #discrib p{width:260px; height:50px; font-size:12px; overflow:hidden;}
#left #left_top #left_top_right  #blogs #discrib p a{ margin-left:10px; text-decoration:none; color:#EC0000;}
#left #left_top #left_top_right  #blogs #discrib p a:hover{ text-decoration:underline;}
	
#left #left_top #left_top_right  #blogs ul{ list-style:none;}
#left #left_top #left_top_right  #blogs ul li{ margin-left:3px; line-height:22px; background:url(res/img/web/redbak.png) no-repeat -382px -86px;}
	
#left #left_top #left_top_right  #blogs ul li a{ text-decoration:none; color:#000000; margin-left:8px;}
#left #left_top #left_top_right  #blogs ul li a:hover{ text-decoration:underline;}

/*左边下半部分*/
#left #left_bottom{margin-left:10px; width:720px; margin-top:5px;}
#left #left_bottom #left_bottom_left{ width:330px; height:528px; float:left; border:1px #CCCCCC solid;}
#left #left_bottom #left_bottom_right{ width:380px; height:528px; float:left; margin-left:6px;}

/*文章模块*/
	/*文章标题div*/
	.arttitle{width:330px; height:30px; line-height:30px; background: url(res/img/web/redbak.png) no-repeat -60px -460px; border-bottom:1px #CCCCCC solid; border-top:1px #CCCCCC solid;}
	.arttitle h5{width:100px; height:30px; line-height:30px; float:left; background:url(res/img/web/redbak.png) no-repeat  -369px -366px; }
	.arttitle h5 a{color:#000000; text-decoration:none; margin-left:12px;}
	.arttitle h5 a:hover{ text-decoration:underline;}
	/*文章子标题ul*/
	.subtitle{list-style:none; width:230px; height:30px; float:right;}
	.subtitle li{ float:right;}
	.subtitle li a{display:block; font-size:12px; text-decoration:none; color:#000000; line-height:30px; margin:0 10px;}
	.subtitle li a:hover{ text-decoration:underline;}
	/*文章列表*/
	.artlist{ clear:both; list-style:none; padding:5px 0px;}
	.artlist li{line-height:22px; font-size:12px; padding-left:10px; background:url(res/img/web/redbak.png) no-repeat -370px -350px;}
	.artlist li a{ color:#000000; text-decoration:none;}
	.artlist li a:hover{ text-decoration:underline;}
	 .arttype{ color:#CC0000;font-weight:bold;} 
	.artdate{ color:#CC0000; margin-left:5px;}
	
	/*会员心声*/
	#left #left_bottom #left_bottom_right #member_title{ height:30px; line-height:30px; border-bottom:1px #CCCCCC solid;}
	#left #left_bottom #left_bottom_right #member_title h5{ width:200px; height:30px; float:left;background:url(res/img/web/redbak.png) no-repeat -0px -184px;}
	#left #left_bottom #left_bottom_right #member_title a{ display:block; float:right; margin-right:10px; color:#000000; text-decoration:none;}
	#left #left_bottom #left_bottom_right #member_title a:hover{ text-decoration:underline;}
	#left #left_bottom #left_bottom_right #member_list{ margin-top:5px;}
	#left #left_bottom #left_bottom_right #member_list li{ float:left;}
	#left #left_bottom #left_bottom_right #member_list li a img{ padding:2px; border:1px #CCCCCC solid;}
	
	/*下载中心*/
	#left #left_bottom #left_bottom_right #down_title{ margin-top:5px; height:30px; border-bottom:1px #CCCCCC solid;}
	#left #left_bottom #left_bottom_right #down_title h5{ width:160px; height:30px; float:left;background:url(res/img/web/redbak.png) no-repeat -0px -220px;}
	#left #left_bottom #left_bottom_right #down_title ul{ float:right; width:200px;line-height:30px;}
	#left #left_bottom #left_bottom_right #down_title ul li{ float:left;}
	#left #left_bottom #left_bottom_right #down_title ul li a{ color:#000000; text-decoration:none; margin:0 5px;}
	#left #left_bottom #left_bottom_right #down_title ul li a:hover{ text-decoration:underline;}
	
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
<script src="res/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="res/kinslider/jquery.KinSlideshow-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("#KinSlideshow").KinSlideshow({
			moveStyle:"down",
			intervalTime:8,
			mouseEvent:"mouseover",
			titleFont:{TitleFont_size:14,TitleFont_color:"#FF0000"},
	titleBar:{titleBar_height:26,titleBar_bgColor:"#08355c",titleBar_alpha:0.5},
	titleFont:{TitleFont_size:12,TitleFont_color:"#FFF",TitleFont_weight:"normal"}
	});
})
</script>
</head>
<body>
<!--顶部-->
<div id="top">
   <a href="http://www.redwww.com"><img src="res/img/web/logo.png" border="0" id="redwwwlogo"/></a>
   <p>红萌网欢迎您！</p>
   <ul id="toplink">
		<li><a href="#">登陆</a></li>
		<li><a href="#">注册</a></li>
		<li><a href="#">联系客服</a></li>
		<li><a href="#">YY 课堂</a></li>
  </ul>
   <div id="nav">
      <ul>
     
		<li><a href=" <cms:webroot/>">首页</a></li>
		
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
<div id="pointer">
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
</div>
<div class="clear"></div>
<div id="main">
  <div id="left">
     <div id="left_top">
	    <div id="left_top_left">
		  <div id="focus_ad">
    <div id="KinSlideshow" style="width:346px;height:227px;visibility:hidden;">
       <cms:artList model="articles" channelId="2" top="6">
        <a href="<cms:property name="link"/>" target="_blank"><img src="../<cms:property name="contentPic"/>" alt="<cms:property name="title"/>" width="345" height="227" /></a>
       </cms:artList>
    </div>
		  </div>
		  <div id="hot_course">
               <h5></h5>
	            <a href="./html/<cms:channel id="16" property="path"/>/index.html" class="more">更多&gt;&gt;</a>
				<ul>
				<cms:channelList parentId="16" top="3">
				 <li>
					 <h6><a href="html/<cms:property name="path"/>/list_1.html"><b><cms:property name="name"/></b></a></h6>
					  <a href="html/<cms:property name="path"/>/list_1.html"><img src="<cms:property name="pic"/>" border="0" width="140" height="80"/></a>
					  <p>
					  <cms:property name="content" maxSize="56"/><a href="html/<cms:property name="path"/>/list_1.html">详细内容&gt;&gt;</a>
					  </p>
					  <div class="cleaer"></div>
				   </li>
				</cms:channelList>
				</ul>
		  </div>
		</div>
		 <div id="left_top_right">
			  <div id="todayfocus">
				  <h5></h5>
				  <a href="./html/<cms:channel id="5" property="path"/>/list_1.html" class="more">更多&gt;&gt;</a>
				  <ul class="topfocus">
				  <% int index=1; %>
				  <cms:artList model="articles" channelId="5" top="13">

				     <li><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="24"/>&nbsp;<font color="#cc0000"><cms:property name="createDate" format="yyyy-MM-dd"/></font></a></li>
				   <%
				     if(index++==4)
				     {
				    	 out.println("</ul><ul class=\"botfocus\">");
				     }
				   %>
				  </cms:artList>
				  </ul>
				  
			 </div><!--end todayfocus-->
<!--站长日志--> 
			 <div id="blogs">
			    <h5></h5>
				<a href="./html/<cms:channel id="6" property="path"/>/list_1.html" class="more">更多&gt;&gt;</a>	
				<div id="discrib">
				   <img src="res/img/web/me.jpg" width="90" height="70" border="0"/>
				   <div id="discrib_right">
				     <cms:artList model="articles" channelId="6" top="1">
					  <h6><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="28"/></a></h6>
					  <p><cms:property name="description"/>...<a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">更多&gt;&gt;</a></p>
				     </cms:artList>
				  </div>
				  <div class="cleaer"></div>
				</div>
				<ul>
				<cms:artList model="articles" channelId="6" top="8" from="1">
					<li><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="26"/>&nbsp;<font color="#cc0000"><cms:property name="createDate" format="yyyy-MM-dd"/></font></a></li>
		      </cms:artList>
				</ul>
			 </div><!--end blogs-->
                <div style="clear:both;"></div>
		 </div><!--end left_top_right-->
		 <div class="clear"></div>
	 </div><!--end left_top-->
	  <!--google 长条广告-->
	 <div  style="margin-left:10px; width:720px; height:90px; overflow:hidden;">
<script type="text/javascript">
google_ad_client = "ca-pub-2147148573164130";
/* 红萌中间 */
google_ad_slot = "3286583940";
google_ad_width = 720;
google_ad_height = 90;

</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
     </div>
	 
	 <!--左边下半部分--> 
	 <div id="left_bottom">
	     <div id="left_bottom_left">
		     <div class="arttitle" style="border-top:0;">
				 <h5><a href="./html/<cms:channel id="11" property="path"/>/list_1.html">网络安全</a></h5>
				  <a href="./html/<cms:channel id="11" property="path"/>/list_1.html" class="more">更多&gt;&gt;</a>
				 <!-- <ul class="subtitle">
					<li><a href="#">安全</a></li>
					<li><a href="#">组网</a></li>
				 </ul> -->
			 </div>
			 <ul class="artlist">
			 <cms:artList model="articles" channelId="11" top="4">
				<li><!-- <span class="arttype">○</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
				<!-- <li><span class="arttype">[安全]</span><a href="#">服务器虚拟化的五大军规</a><span class="artdate">11/2</span></li>
				<li><span class="arttype">[安全]</span><a href="#">服务器虚拟化的五大军规</a><span class="artdate">11/2</span></li>
				<li><span class="arttype">[安全]</span><a href="#">服务器虚拟化的五大军规</a><span class="artdate">11/2</span></li> -->
			 </ul>
			 
			 <div class="arttitle">
				 <h5><a href="./html/<cms:channel id="9" property="path"/>/list_1.html">软件开发</a></h5>
			     <a href="./html/<cms:channel id="9" property="path"/>/list_1.html" class="more">更多&gt;&gt;</a>
			 </div>
			 <ul class="artlist">
				 <cms:artList model="articles" channelId="9" top="4">
				<li><!-- <span class="arttype">○</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
			 </ul>
			 
			 <div class="arttitle">
				 <h5><a href="./html/<cms:channel id="8" property="path"/>/list_1.html">数据库</a></h5>
				 <a href="./html/<cms:channel id="8" property="path"/>/list_1.html" class="more">更多&gt;&gt;</a>
			 </div>
			 <ul class="artlist">
				 <cms:artList model="articles" channelId="8" top="4">
				<li><!-- <span class="arttype">○</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
			 </ul>
			 
			 
			 <div class="arttitle">
				 <h5><a href="./html/<cms:channel id="10" property="path"/>/list_1.html">操作系统</a></h5>
				 <a href="./html/<cms:channel id="10" property="path"/>/list_1.html" class="more">更多&gt;&gt;</a>
			 </div>
			 <ul class="artlist">
				 <cms:artList model="articles" channelId="10" top="4">
				<li><!-- <span class="arttype">○</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
			 </ul>
		 <div style="clear:both;"></div>
		 </div><!--end left_bottom_left-->
		
		 <!--左下半部分右边区域（会员心声）-->
		 <div id="left_bottom_right">
		
			  <div id="member_title">
				 <h5></h5><a href="./html/<cms:channel id="22" property="path"/>/list_1.html">更多&gt;&gt;</a>
			  </div>
			  <ul id="member_list">
			        <cms:artList model="articles" channelId="22" top="6">
					  <li>
					  <a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
					  <img src="../<cms:property name="contentPic"/>" title="<cms:property name="title"/>" width="120" height="80" />
					  </a></li>
					</cms:artList>
						 
			  </ul>
	          <div style="clear:both;"></div>
			  
			  <!--下载中心开发-->
			  <div id="down_title">
			    <h5></h5>
				<ul>
				  <cms:channelList parentId="12" top="3">
				   <li><a href="html/<cms:property name="path"/>/list_1.html"><cms:property name="name"/></a></li>
				   </cms:channelList>
				</ul>
			  </div>
			  <div style="clear:both;"></div>
			<ul class="artlist" style="margin-top:5px;">
			   <cms:artList model="down" top="12">
				<li><span class="arttype">[<cms:property name="channelName"/>]</span>&nbsp;
				<a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
				<cms:property name="title" maxSize="20"/>&nbsp;</a>
				<span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span>
				</li>
				</cms:artList>
			</ul>
		   <div style="clear:both;"></div>
		 </div><!--end left_bottom_right-->
		 <div style="clear:both;"></div>
	 </div><!--end left_bottom-->
	  <div style="clear:both;"></div>
  </div><!--end left-->
  
  <!--网站右面部分-->
  <div id="right">
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
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
	  </ul>
	
	</div>
		<div class="clear"></div>
	
    <!-- 最新课程 --> 
	<div id="lastcourse">
	  <h5></h5>
	  <a href="./html/<cms:channel id="16" property="path"/>/index.html" class="more">更多&gt;&gt;</a>
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
   <!--google广告-->
   <div style=" margin-bottom:5px;">
       <script type="text/javascript"><!--
google_ad_client = "ca-pub-2147148573164130";
/* 红萌右下 */
google_ad_slot = "2873697423";
google_ad_width = 250;
google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
   </div>
   <!--最新开通的会员-->
   <!--<div id="lastvip">
     <h5>最新开通VIP的会员</h5>
	 <ul>
	   <li>lans*******163.com开通会员</li>
	   <li>asun*******163.com开通会员</li>
	   <li>zhan*******163.com开通会员</li>
	   <li>bang*******163.com开通会员</li>
	   <li>taol*******163.com开通会员</li>
	   <li>canl*******163.com开通会员</li>
	   <li>bang*******163.com开通会员</li>
	   <li>taol*******163.com开通会员</li>
	   <li>canl*******163.com开通会员</li>
	   <li>canl*******163.com开通会员</li>
	 </ul>
   </div>-->
  
<!-- <div id="qqgroup"> 
    <ul>
	 	   <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/145201594"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=145201594" alt="点击这里加入此群" title="点击这里加入此群"></a></li>
	   <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/179419617"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=179419617" alt="点击这里加入此群" title="点击这里加入此群"></a></li>
	    <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/145201594"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=145201594" alt="点击这里加入此群" title="点击这里加入此群"></a></li>
	   <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/179419617"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=179419617" alt="点击这里加入此群" title="点击这里加入此群"></a></li>


	 </ul>-->

  </div><!--end right-->
  <div style="clear:both;"></div>
</div><!--end main-->
<div style="clear:both;"></div>
<div id="links">
  <!--<h6>友情链接</h6>-->
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
<div style="clear:both;"></div>
<div id="footer">
<a href="http://www.redwww.com/html/about/joinus/" target="_blank">加入会员</a> |  
<a href="http://www.redwww.com/html/about/aboutus/" target="_blank">关于我们</a> |  
<a href="http://www.redwww.com/html/about/contactus/" target="_blank">联系方式</a> |  
<a href="http://www.redwww.com/html/about/help/"  target="_blank">帮助</a>
<br />
Powered by <strong><a href="http://www.redwww.com" target="_blank">红萌网</a></strong>&copy; 2011 <img src="res/img/web/copyright.gif"/>陕ICP备09017466号&nbsp;&nbsp;<script src="http://s17.cnzz.com/stat.php?id=2698974&web_id=2698974&show=pic" language="JavaScript"></script>
</div>
</body>
</html>
