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
<meta name="Keywords" content="精品课程,Java,网络安全,红萌网" />
<meta name="Description" content="精品课程_Java_网络安全_红萌网" />
<title>精彩文章_红萌网</title>
<style type="text/css">
/* 文章频道 */
#artlist_box{width:710px; border:1px solid #CCCCCC; margin-bottom:10px;background: url(res/img/web/redbak.png) repeat-x 0px -460px;}
#artlist_box #artlist_title{ height:30px; line-height:30px; border-bottom:1px #CCCCCC solid;}
#artlist_box #artlist_title h2{ width:600px; float:left; font-size:16px; margin:0px; margin-left:5px; font-weight:bold;}
#artlist_box #artlist_title p{ width:80px; float:right; margin:0px;}
#artlist_box #artlist_title p a{ text-decoration:none; color:#CC0000; font-size:14px;}
#artlist_box #artlist_title p a:hover{ text-decoration:underline;}

#artlist_box ul{ list-style:none; padding:3px;}
#artlist_box ul li{ line-height:24px; clear:both;}
#artlist_box ul li a{font-size:14px; color:#333333; text-decoration:none; float:left;}
#artlist_box ul li a:hover{ text-decoration:underline;}
#artlist_box ul li span.dot{ float:left;}
#artlist_box ul li span.time{ float:right; width:150px;margin-right:10px; color:#CC0000; font-size:12px;}
</style>
</head>
<body style="margin:0;">
<div id="pointer">
<p>
<a href='<cms:webroot/>'>红萌网首页</a>&gt;精彩文章
</p>
</div>
<div class="sub_container" style="border:0; margin-top:5px;">
	<div id="artlist_box">
	     <div id="artlist_title">
		   <h2>网络安全</h2><p><a href="./html/<cms:channel id="11" property="path"/>/list_1.html">更多&gt;&gt;</a></p> 
		 </div>
                <div style="clear:both"></div>	
                <ul>
                  <cms:artList model="articles" channelId="11" top="8">
                	<li><span class="dot">·</span><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" target="_blank">
                       <cms:property name="title" maxSize="48"/>
                     </a><span class="time"><cms:property name="createDate" format="yyyy-MM-dd"/></span><div style="clear:both;"></div>
                    </li>
			      </cms:artList>
				 </ul>
      </div>
   
    
    	<div id="artlist_box">
	     <div id="artlist_title">
		   <h2>软件开发</h2><p><a href="./html/<cms:channel id="9" property="path"/>/list_1.html">更多&gt;&gt;</a></p> 
		 </div>
                <div style="clear:both"></div>	
                <ul>
                  <cms:artList model="articles" channelId="9" top="8">
                	<li><span class="dot">·</span><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" target="_blank">
                       <cms:property name="title" maxSize="48"/>
                     </a><span class="time"><cms:property name="createDate" format="yyyy-MM-dd"/></span><div style="clear:both;"></div>
                    </li>
			      </cms:artList>
				 </ul>
        </div>

    
    	<div id="artlist_box">
	     <div id="artlist_title">
		   <h2>数据库</h2><p><a href="./html/<cms:channel id="8" property="path"/>/list_1.html">更多&gt;&gt;</a></p> 
		 </div>
                <div style="clear:both"></div>	
                <ul>
                  <cms:artList model="articles" channelId="8" top="8">
                	<li><span class="dot">·</span><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" target="_blank">
                       <cms:property name="title" maxSize="48"/>
                     </a><span class="time"><cms:property name="createDate" format="yyyy-MM-dd"/></span><div style="clear:both;"></div>
                    </li>
			      </cms:artList>
				 </ul>
         </div>
    
    
    	<div id="artlist_box">
	     <div id="artlist_title">
		   <h2>操作系统</h2><p><a href="./html/<cms:channel id="10" property="path"/>/list_1.html">更多&gt;&gt;</a></p> 
		 </div>
                <div style="clear:both"></div>	
                <ul>
                  <cms:artList model="articles" channelId="10" top="8">
                	<li><span class="dot">·</span><a href="html/<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html" target="_blank">
                       <cms:property name="title" maxSize="48"/>
                     </a><span class="time"><cms:property name="createDate" format="yyyy-MM-dd"/></span><div style="clear:both;"></div>
                    </li>
			      </cms:artList>
				 </ul>
         </div>
      </div>
</body>
</html>