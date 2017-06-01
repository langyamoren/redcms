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
<meta name="Keywords" content="<cms:channel id="${channelId}" property="metaKey"/>" />
<meta name="Description" content="<cms:channel id="${channelId}" property="metaDes"/>" />
<title>${channel.name}_精彩文章_红萌网</title>
<style type="text/css">
.sub_container ul{ margin:10px;}
.sub_container ul li{ line-height:24px; clear:both; height:24px; background:url(res/img/web/redbak.png) no-repeat -372px -350px; padding-left:8px;}
.sub_container ul li .left_span{ float:left; display:block; width:570px;}
.sub_container ul li .right_span{ display:block;float:right; width:120px; color:#CC0000; font-size:12px;}
</style>

</head>
<body>
<body style="margin:0;">
<div id="pointer">
<p>
<a href='<cms:webroot/>'>红萌网首页</a>&gt;<a href="html/<cms:channel id="7" property="path"/>/index.html">精彩文章</a>&gt;${channel.name}
</p>
</div>
    <div class="sub_container">
      <ul id="course_list">
      <%
      int index=1;
      %>
      <cms:artList model="${tableName}" channelId="${cid}" page="true" orderby="id asc" >
       <%
          if(index++%6==0)
          {
      %>
      <li style="border-bottom:1px #CCCCCC dashed; margin-bottom:10px;">
      <%
          }else
          {
        	    %>
        	     <li>
        	    <% 	  
          }
       %>
	  <span class="left_span"><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" target="_blank">
	  <cms:property name="title" maxSize="48"/></a></span><span  class="right_span"><cms:property name="createDate" format="yyyy-MM-dd HH:mm:ss"/></span></li>
	  </cms:artList>
	  
	 </ul>
	 <div class="clear"></div>
<div class="page_div"><cms:pager params="modelId=${modelId}&channelId=${channelId}"></cms:pager></div>
	</div>
	<div class="clear"></div>
</body>
</html>