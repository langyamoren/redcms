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
</body>
</html>
