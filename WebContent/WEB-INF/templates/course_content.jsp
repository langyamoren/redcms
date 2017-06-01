<%@ page language="java" import="com.redcms.beans.*,java.util.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
 
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Content content=(Content)request.getAttribute("content");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta name="Keywords" content="<cms:content type="content" property="tags"/>,<cms:content type="channel" property="metaKey"/>" />
<meta name="Description" content="<cms:content type="content"  property="description"/>" />
<title>第${ch}课：<cms:content type="content" property="title"/>_<cms:content type="channel" property="name"/>_精品课程_红萌网</title>
<style type="text/css">
.sub_container h1{ font-size:16px; font-weight:bold; line-height:34px; border-bottom:1px #CCCCCC solid; margin:0 10px;}
.sub_container table{ border-collapse:collapse; margin:10px;}
.sub_container table td{ border:1px #CCCCCC solid; line-height:40px; padding:3px;}
.sub_container h3{ line-height:30px; color:#FFFFFF; font-weight:bold; font-size:14px; background:#C00; margin:10px 0; padding-left:10px;}
</style>
</head>
<body>
<div id="pointer">
<p>
<a href='<cms:webroot/>'>红萌网首页</a>&gt;
<a href="html/<cms:content type="channel" property="path"/>/list_1.html"><cms:content type="channel" property="name"/></a>&gt;
第${ch}课：<cms:content type="content" property="title"/>
</p>
</div>
 <div class="sub_container">
       <h1>第${ch}课：<cms:content type="content" property="title"/></h1>
	   <table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="120" align="right"><strong>课程类别：</strong></td>
    <td width="260" align="left" valign="middle"><cms:content type="channel" property="name"/></td>
    <td  rowspan="5" align="center" valign="middle">
  <script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 下载页显示 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-2147148573164130"
     data-ad-slot="9475494385"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
    <!--    <img src="" alt="goole_ad" name="google_ad" width="216" height="216" id="google_ad" style="background-color: #00CCFF" /> -->
    </td>
  </tr>
  <tr>
    <td align="right"><strong>关键词：</strong></td>
    <td align="left" valign="middle"><cms:content type="content" property="tags"/></td>
    </tr>
  <tr>
    <td align="right"><strong>更新时间：</strong></td>
    <td align="left" valign="middle"><cms:content type="content" property="createDate"/></td>
    </tr>
  <tr>
    <td align="right"><strong>发布者： </strong></td>
    <td align="left" valign="middle"><cms:content type="content" property="author"/></td>
    </tr>
  <tr>
    <td align="right"><strong>授权方式：</strong></td>
    <td align="left" valign="middle">${content.isRecommend=="0"?"Free":"VIP"}</td>
    </tr>
</table>
<h3>内容简介:</h3>
<div class="contents">
<cms:content type="contentTxt" property="txt"/>
</div>
<h3>课程下载:</h3>
<p style="line-height: 36px; font-size: 16px;font-weight: bold;">
<%
List<ContentAttachment> list=(List<ContentAttachment>)request.getAttribute("attachs");
if(null!=list&&list.size()>0)
{
  for(ContentAttachment tem:list)
  {
	  %>
	   &nbsp;<a href="<%=tem.getPath()%>" target="_blank">本地下载</a>&nbsp;
	  <%
  }
}
%>
  <%
   if(null!=content&&null!=content.getLink()&&!"".equals(content.getLink()))
   {
  %>
   &nbsp;<a href="<%=content.getLink()%>" target="_blank">外链下载</a>
   <%
   }
   %>
</p>
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
</script></div>
<!-- <img name="google_ad" src="" width="720" height="60" alt="google_ad" style="background-color: #00CCFF" />
 -->
	</div>
	<div class="clear"></div>
</body>
</html>