<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title><cms:content type="content" property="title"/></title>
</head>
<body>
<div id="pointer">
<p>
<a href='<cms:webroot/>'>红萌网首页</a>&gt;<cms:content type="content" property="title"/>
</p>
</div>
<div class="sub_container">
<div class="contents">
<cms:content type="contentTxt" property="txt"/>
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
</script></div>
<!-- <img name="google_ad" src="" width="720" height="60" alt="google_ad" style="background-color: #00CCFF" />
 -->
</div>
</body>
</html>