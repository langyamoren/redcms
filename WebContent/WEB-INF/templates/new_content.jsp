<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*,com.redcms.page.*"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta name="Keywords" content="<cms:content type="content" property="tags"/>,<cms:content type="channel" property="metaKey"/>" />
<meta name="Description" content="<cms:content type="content"  property="description"/>" />
<title><cms:content type="content" property="title"/>_<cms:content type="channel" property="name"/>_精彩文章_红萌网</title>
<style type="text/css">
.sub_container #article_top{ margin:10px; border-bottom:1px #CCCCCC solid;}
.sub_container #article_top h1{ font-size:20px; font-weight:bold; text-align:center; line-height:36px;}
.sub_container #article_top p{ color:#999999; text-align:center; line-height:22px;}
.sub_container #article_bot{ background-color:#F0F0F0; line-height:30px;}
</style>
</head>
<body style="margin:0;">
<div id="pointer">
<p>
<a href='<cms:webroot/>'>红萌网首页</a>&gt;
<a href="html/<cms:content type="channel" property="path"/>/list_1.html">
<cms:content type="channel" property="name"/></a>&gt;<cms:content type="content" property="title"/>
</p>
</div>

<div class="sub_container">
	  <div id="article_top">
	    <h1><cms:content type="content" property="title"/></h1>
		<p>来源：<cms:content type="content" property="originUrl"/>&nbsp;&nbsp;发布时间：<cms:content type="content" property="createDate"/>&nbsp;&nbsp;<cms:content type="content" property="author"/></p>
	  </div>
	  <div class="contents">
	  <!-- google的广告 -->
	   <div style="margin:5px;float:left; width: 250px; height:250px;">
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
	   
	   <cms:content type="contentTxt" property="txt"/>
	  </div>
	  
	  <div id="article_bot" style="height:30px; padding-top:10px;">
	  <!-- JiaThis Button BEGIN -->
<div class="jiathis_style">
	<span class="jiathis_txt">分享到：</span>
	<a class="jiathis_button_tools_1"></a>
	<a class="jiathis_button_tools_2"></a>
	<a class="jiathis_button_tools_3"></a>
	<a class="jiathis_button_tools_4"></a>
	<a href="http://www.jiathis.com/share?uid=894307" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript">
var jiathis_config = {data_track_clickback:'true'};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=894307" charset="utf-8"></script>
<!-- JiaThis Button END -->
	  </div>
	<div>
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
<!-- <img name="google_ad" src="" width="720" height="60" alt="google_ad" style="background-color: #00CCFF" />
 -->
	</div>
	</div>
	<div class="clear"></div>

</body>
</html>