<%@page import="com.redcms.page.PageDiv"%>
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
<title><cms:channel id="${channelId}" property="name"/>_精品课程_红萌网</title>
<link href="res/css/redwww.css" rel="stylesheet" type="text/css" />
<style type="text/css">

#course_header{ margin-left:10px; width:705px; position:relative; height:120px; border-bottom:1px #CCCCCC solid;}

#course_header img{ position:absolute; left:5px; top:7px; padding:2px; border:1px #CCCCCC solid;}
#course_header h1{ position:absolute; left:9px; top:100px; font-size:16px; color:#EC0000; font-weight:bold;}
#course_header h2{ width:535px; height:24px; line-height:24px; border-bottom:1px #CCCCCC dashed; position:absolute; left:156px; top:6px;color:#000000; text-decoration:none; font-size:16px; font-weight:bold;}
#course_header span{
position:absolute;
left:573px;
top20px;	top: 11px;
}
#course_header p{position:absolute;left:156px;top:29px;width: 535px;height: 58px;line-height:22px;}
#course_header p a{ text-decoration:none; color:#EC0000;}
#course_header p a:hover{ text-decoration:underline;}
/*课程列表*/
#cur_list{margin-left:10px; width:705px;}
#cur_list ul{}
#cur_list ul li{ position:relative; height:115px;}
#cur_list ul li .red_title{ display:block; width:47px; height:33px; background:url(res/img/web/redbak.png) no-repeat 0px -293px; position:absolute; left:12px; top:6px; color:#FFFFFF; font-size:16px; text-align:center; line-height:33px; font-weight:bold;}
#cur_list ul li .cour_date{ position:absolute; left:559px; top:20px;}
#cur_list ul li h1{	position:absolute;width:625px;height:30px;line-height:30px;border-bottom:1px #CCCCCC dashed;left: 67px;top: 6px;}
#cur_list ul li h1{ color:#000000; text-decoration:none;font-size:16px;	font-weight:bold; }
#cur_list ul li h1 a:hover{ text-decoration:underline;}
#cur_list ul li p{position:absolute;width:626px;height:68px;line-height:22px;top: 42px;left: 67px;}
</style>

</head>
<body style="margin:0;">
<div id="pointer">
<p>
<a href='<cms:webroot/>'>红萌网首页</a>&gt;<a href="html/<cms:channel id="16" property="path"/>/index.html">精品课程</a>&gt;${channel.name}
</p>
</div>
<div class="sub_container">
      <div id="course_header">
  
	 <img  src="${channel.pic}" width="140" border="0" height="80"/>
		   <h2>${channel.name}</h2>
		   <span><cms:channel id="${channelId}" property="createtime"/></span>
		   <p><cms:channel id="${channelId}" property="content"/><!-- <a href="#">详细内容&gt;&gt;</a> -->			          </p>
	    <h1>课程内容列表:</h1>
			
     </div>
	 
      <div id="cur_list">
      
	    <ul>
	    <%
	    int index=1;  
	    @SuppressWarnings("rawtypes")
	    PageDiv pd=(PageDiv)request.getAttribute("pd");
	    if(null!=pd&&null!=pd.getList()&&pd.getList().size()>0)index=pd.getTotalCount()-((pd.getPageNo()-1)*pd.getPageSize());
	    %>
	    <cms:artList model="${tableName}" channelId="${cid}" page="true">
		   <li>
		     <h1><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title"/></a></h1>
			 <span class="red_title"><%=index-- %></span>
			 <span class="cour_date"><cms:property name="createDate" format="yyyy-MM-dd HH:mm:ss"/></span>
			 <p><cms:property name="description" maxSize="140"/><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><font color="#CC0000">详细内容&gt;&gt;</font></a>			         </p>
		  </li>
		  </cms:artList>
		</ul>
	  </div>
	  <div class="page_div"><cms:pager params="modelId=${modelId}&channelId=${channelId}" url="${channel.path}"></cms:pager></div>
	  <div style="clear:both;"></div>
	</div>
	 <div style="clear:both;"></div>
</body>
</html>