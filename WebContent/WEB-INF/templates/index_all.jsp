<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������ҳ</title>
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

/*ָ��*/
#pointer{ height:30px; line-height:30px; background:#F6F6F6 url(res/img/web/redbak.png) no-repeat -360px -392px;}
#pointer p{ height:30px; line-height:30px; float:left; width:700px; margin-left:25px;}
#pointer p a{ text-decoration:none; font-size:14px; color:#EC0000; font-weight:bold;}
#pointer p a:hover{ text-decoration:underline;}
#pointer form{ width:260px; float:left; width:260px;}

/*�м�*/
#main{ margin-top:5px;}
#main #left{ width:740px; height:1260px; float:left;}
#main #right{ width:260px; height:1260px; float:left;}

/*��벿��*/
#left #left_top{ margin-left:10px; width:720px; height:635px;}
#left #left_top #left_top_left{ width:346px;  height:635px; float:left;}
#left #left_top #left_top_right{ width:370px;  height:635px; float:right;}
/*������*/
#left #left_top #left_top_left #focus_ad{ width:346px; height:227px;}

/*hot�γ�*/
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

/*ÿ�� ����*/
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
	
	/*վ����־*/
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

/*����°벿��*/
#left #left_bottom{margin-left:10px; width:720px; margin-top:5px;}
#left #left_bottom #left_bottom_left{ width:330px; height:528px; float:left; border:1px #CCCCCC solid;}
#left #left_bottom #left_bottom_right{ width:380px; height:528px; float:left; margin-left:6px;}

/*����ģ��*/
	/*���±���div*/
	.arttitle{width:330px; height:30px; line-height:30px; background: url(res/img/web/redbak.png) no-repeat -60px -460px; border-bottom:1px #CCCCCC solid; border-top:1px #CCCCCC solid;}
	.arttitle h5{width:100px; height:30px; line-height:30px; float:left; background:url(res/img/web/redbak.png) no-repeat  -369px -366px; }
	.arttitle h5 a{color:#000000; text-decoration:none; margin-left:12px;}
	.arttitle h5 a:hover{ text-decoration:underline;}
	/*�����ӱ���ul*/
	.subtitle{list-style:none; width:230px; height:30px; float:right;}
	.subtitle li{ float:right;}
	.subtitle li a{display:block; font-size:12px; text-decoration:none; color:#000000; line-height:30px; margin:0 10px;}
	.subtitle li a:hover{ text-decoration:underline;}
	/*�����б�*/
	.artlist{ clear:both; list-style:none; padding:5px 0px;}
	.artlist li{line-height:22px; font-size:12px; padding-left:10px; background:url(res/img/web/redbak.png) no-repeat -370px -350px;}
	.artlist li a{ color:#000000; text-decoration:none;}
	.artlist li a:hover{ text-decoration:underline;}
	 .arttype{ color:#CC0000;font-weight:bold;} 
	.artdate{ color:#CC0000; margin-left:5px;}
	
	/*��Ա����*/
	#left #left_bottom #left_bottom_right #member_title{ height:30px; line-height:30px; border-bottom:1px #CCCCCC solid;}
	#left #left_bottom #left_bottom_right #member_title h5{ width:200px; height:30px; float:left;background:url(res/img/web/redbak.png) no-repeat -0px -184px;}
	#left #left_bottom #left_bottom_right #member_title a{ display:block; float:right; margin-right:10px; color:#000000; text-decoration:none;}
	#left #left_bottom #left_bottom_right #member_title a:hover{ text-decoration:underline;}
	#left #left_bottom #left_bottom_right #member_list{ margin-top:5px;}
	#left #left_bottom #left_bottom_right #member_list li{ float:left;}
	#left #left_bottom #left_bottom_right #member_list li a img{ padding:2px; border:1px #CCCCCC solid;}
	
	/*��������*/
	#left #left_bottom #left_bottom_right #down_title{ margin-top:5px; height:30px; border-bottom:1px #CCCCCC solid;}
	#left #left_bottom #left_bottom_right #down_title h5{ width:160px; height:30px; float:left;background:url(res/img/web/redbak.png) no-repeat -0px -220px;}
	#left #left_bottom #left_bottom_right #down_title ul{ float:right; width:200px;line-height:30px;}
	#left #left_bottom #left_bottom_right #down_title ul li{ float:left;}
	#left #left_bottom #left_bottom_right #down_title ul li a{ color:#000000; text-decoration:none; margin:0 5px;}
	#left #left_bottom #left_bottom_right #down_title ul li a:hover{ text-decoration:underline;}
	
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
<!--����-->
<div id="top">
   <a href="http://www.redwww.com"><img src="res/img/web/logo.png" border="0" id="redwwwlogo"/></a>
   <p>��������ӭ����</p>
   <ul id="toplink">
		<li><a href="#">��½</a></li>
		<li><a href="#">ע��</a></li>
		<li><a href="#">��ϵ�ͷ�</a></li>
		<li><a href="#">YY ����</a></li>
  </ul>
   <div id="nav">
      <ul>
     
		<li><a href=" <cms:webroot/>">��ҳ</a></li>
		
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
<div id="pointer">
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
	            <a href="./html/<cms:channel id="16" property="path"/>/index.html" class="more">����&gt;&gt;</a>
				<ul>
				<cms:channelList parentId="16" top="3">
				 <li>
					 <h6><a href="html/<cms:property name="path"/>/list_1.html"><b><cms:property name="name"/></b></a></h6>
					  <a href="html/<cms:property name="path"/>/list_1.html"><img src="<cms:property name="pic"/>" border="0" width="140" height="80"/></a>
					  <p>
					  <cms:property name="content" maxSize="56"/><a href="html/<cms:property name="path"/>/list_1.html">��ϸ����&gt;&gt;</a>
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
				  <a href="./html/<cms:channel id="5" property="path"/>/list_1.html" class="more">����&gt;&gt;</a>
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
<!--վ����־--> 
			 <div id="blogs">
			    <h5></h5>
				<a href="./html/<cms:channel id="6" property="path"/>/list_1.html" class="more">����&gt;&gt;</a>	
				<div id="discrib">
				   <img src="res/img/web/me.jpg" width="90" height="70" border="0"/>
				   <div id="discrib_right">
				     <cms:artList model="articles" channelId="6" top="1">
					  <h6><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="28"/></a></h6>
					  <p><cms:property name="description"/>...<a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">����&gt;&gt;</a></p>
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
	  <!--google �������-->
	 <div  style="margin-left:10px; width:720px; height:90px; overflow:hidden;">
<script type="text/javascript">
google_ad_client = "ca-pub-2147148573164130";
/* �����м� */
google_ad_slot = "3286583940";
google_ad_width = 720;
google_ad_height = 90;

</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
     </div>
	 
	 <!--����°벿��--> 
	 <div id="left_bottom">
	     <div id="left_bottom_left">
		     <div class="arttitle" style="border-top:0;">
				 <h5><a href="./html/<cms:channel id="11" property="path"/>/list_1.html">���簲ȫ</a></h5>
				  <a href="./html/<cms:channel id="11" property="path"/>/list_1.html" class="more">����&gt;&gt;</a>
				 <!-- <ul class="subtitle">
					<li><a href="#">��ȫ</a></li>
					<li><a href="#">����</a></li>
				 </ul> -->
			 </div>
			 <ul class="artlist">
			 <cms:artList model="articles" channelId="11" top="4">
				<li><!-- <span class="arttype">��</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
				<!-- <li><span class="arttype">[��ȫ]</span><a href="#">���������⻯��������</a><span class="artdate">11/2</span></li>
				<li><span class="arttype">[��ȫ]</span><a href="#">���������⻯��������</a><span class="artdate">11/2</span></li>
				<li><span class="arttype">[��ȫ]</span><a href="#">���������⻯��������</a><span class="artdate">11/2</span></li> -->
			 </ul>
			 
			 <div class="arttitle">
				 <h5><a href="./html/<cms:channel id="9" property="path"/>/list_1.html">�������</a></h5>
			     <a href="./html/<cms:channel id="9" property="path"/>/list_1.html" class="more">����&gt;&gt;</a>
			 </div>
			 <ul class="artlist">
				 <cms:artList model="articles" channelId="9" top="4">
				<li><!-- <span class="arttype">��</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
			 </ul>
			 
			 <div class="arttitle">
				 <h5><a href="./html/<cms:channel id="8" property="path"/>/list_1.html">���ݿ�</a></h5>
				 <a href="./html/<cms:channel id="8" property="path"/>/list_1.html" class="more">����&gt;&gt;</a>
			 </div>
			 <ul class="artlist">
				 <cms:artList model="articles" channelId="8" top="4">
				<li><!-- <span class="arttype">��</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
			 </ul>
			 
			 
			 <div class="arttitle">
				 <h5><a href="./html/<cms:channel id="10" property="path"/>/list_1.html">����ϵͳ</a></h5>
				 <a href="./html/<cms:channel id="10" property="path"/>/list_1.html" class="more">����&gt;&gt;</a>
			 </div>
			 <ul class="artlist">
				 <cms:artList model="articles" channelId="10" top="4">
				<li><!-- <span class="arttype">��</span> --><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html">
                <cms:property name="title" maxSize="18"/></a><span class="artdate"><cms:property name="createDate" format="yyyy-MM-dd"/></span></li>
			 </cms:artList>
			 </ul>
		 <div style="clear:both;"></div>
		 </div><!--end left_bottom_left-->
		
		 <!--���°벿���ұ����򣨻�Ա������-->
		 <div id="left_bottom_right">
		
			  <div id="member_title">
				 <h5></h5><a href="./html/<cms:channel id="22" property="path"/>/list_1.html">����&gt;&gt;</a>
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
			  
			  <!--�������Ŀ���-->
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
  
  <!--��վ���沿��-->
  <div id="right">
  <!--��վ����-->
    <div id="notice">
	   <h5></h5>
	  <!--   <a href="#" class="more">����&gt;&gt;</a>-->
	   <ul>
	        <cms:artList model="articles" channelId="4" top="3">
	        	<li><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="16"/></a></li>
	        </cms:artList>
	   </ul>
	</div>
	<!--���߿ͷ�ͼƬ-->
	<img src="res/img/web/callcenter.jpg" style=" margin-bottom:5px;"/>
	<!--���߿ͷ�-->
<div id="callcenter">
	  <ul>
	    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a></li>
		 <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=9703239&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:9703239:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"/></a></li>
	  </ul>
	
	</div>
		<div class="clear"></div>
	
    <!-- ���¿γ� --> 
	<div id="lastcourse">
	  <h5></h5>
	  <a href="./html/<cms:channel id="16" property="path"/>/index.html" class="more">����&gt;&gt;</a>
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
		<!--΢��-->
	<div style="width:255px; height:400px; margin-bottom: 5px;">
	<iframe frameborder="0" scrolling="no" src="http://show.v.t.qq.com/index.php?c=show&a=index&n=redwww&w=255&h=402&fl=2&l=6&o=15&co=0" width="255" height="402"></iframe>
     </div>
   <!--google���-->
   <div style=" margin-bottom:5px;">
       <script type="text/javascript"><!--
google_ad_client = "ca-pub-2147148573164130";
/* �������� */
google_ad_slot = "2873697423";
google_ad_width = 250;
google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
   </div>
   <!--���¿�ͨ�Ļ�Ա-->
   <!--<div id="lastvip">
     <h5>���¿�ͨVIP�Ļ�Ա</h5>
	 <ul>
	   <li>lans*******163.com��ͨ��Ա</li>
	   <li>asun*******163.com��ͨ��Ա</li>
	   <li>zhan*******163.com��ͨ��Ա</li>
	   <li>bang*******163.com��ͨ��Ա</li>
	   <li>taol*******163.com��ͨ��Ա</li>
	   <li>canl*******163.com��ͨ��Ա</li>
	   <li>bang*******163.com��ͨ��Ա</li>
	   <li>taol*******163.com��ͨ��Ա</li>
	   <li>canl*******163.com��ͨ��Ա</li>
	   <li>canl*******163.com��ͨ��Ա</li>
	 </ul>
   </div>-->
  
<!-- <div id="qqgroup"> 
    <ul>
	 	   <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/145201594"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=145201594" alt="�����������Ⱥ" title="�����������Ⱥ"></a></li>
	   <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/179419617"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=179419617" alt="�����������Ⱥ" title="�����������Ⱥ"></a></li>
	    <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/145201594"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=145201594" alt="�����������Ⱥ" title="�����������Ⱥ"></a></li>
	   <li><a target="_blank" href="http://qun.qq.com/#jointhegroup/gid/179419617"><img border="0" src="http://cgi.qun.qq.com/gscgi/s1/gp.do?gid=179419617" alt="�����������Ⱥ" title="�����������Ⱥ"></a></li>


	 </ul>-->

  </div><!--end right-->
  <div style="clear:both;"></div>
</div><!--end main-->
<div style="clear:both;"></div>
<div id="links">
  <!--<h6>��������</h6>-->
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
<a href="http://www.redwww.com/html/about/joinus/" target="_blank">�����Ա</a> |  
<a href="http://www.redwww.com/html/about/aboutus/" target="_blank">��������</a> |  
<a href="http://www.redwww.com/html/about/contactus/" target="_blank">��ϵ��ʽ</a> |  
<a href="http://www.redwww.com/html/about/help/"  target="_blank">����</a>
<br />
Powered by <strong><a href="http://www.redwww.com" target="_blank">������</a></strong>&copy; 2011 <img src="res/img/web/copyright.gif"/>��ICP��09017466��&nbsp;&nbsp;<script src="http://s17.cnzz.com/stat.php?id=2698974&web_id=2698974&show=pic" language="JavaScript"></script>
</div>
</body>
</html>
