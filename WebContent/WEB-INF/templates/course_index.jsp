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
<title>��Ʒ�γ�_������</title>
<meta name="Keywords" content="��Ʒ�γ�,Java,���簲ȫ,������" />
<meta name="Description" content="��Ʒ�γ�_Java_���簲ȫ_������" />
<link href="res/css/redwww.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   #course_list{ margin-left:10px; width:705px;}
   #course_list li{ position:relative; height:100px; border-bottom:1px #CCCCCC solid;}
   #course_list li img{ position:absolute; left:5px; top:7px; padding:2px; border:1px #CCCCCC solid;}
   #course_list li h2{ width:535px; height:24px; line-height:24px; border-bottom:1px #CCCCCC dashed; position:absolute; left:156px; top:6px;}
   #course_list li h2 a{ color:#000000; text-decoration:none; font-size:16px; font-weight:bold;}
   #course_list li h2 a:hover{ text-decoration:underline;}
   #course_list li span{position:absolute;	left:573px;top: 11px;}
   #course_list li p{position:absolute;left:156px;top:29px;width: 535px;height: 58px;line-height:22px;}
   #course_list li p a{ text-decoration:none; color:#EC0000;}
   #course_list li p a:hover{ text-decoration:underline;}
</style>
</head>
<body>
<div id="pointer">
<p>
<a href='<cms:webroot/>'>��������ҳ</a>&gt;��Ʒ�γ�
</p>
</div>
<div class="sub_container">
	  <ul id="course_list">
	   <cms:channelList parentId="16">
        <li>
		   <a href="html/<cms:property name="path"/>/list_1.html"><img  src="<cms:property name="pic"/>" width="140" border="0" height="80"/></a>
		   <h2><a target="_blank" href="html/<cms:property name="path"/>/list_1.html"><cms:property name="name"/></a></h2>
		   <span><cms:property name="createtime" format="yyyy-MM-dd HH:mm:ss"/></span>
		   <p>
		    <cms:property name="content" maxSize="130"/><a href="html/<cms:property name="path"/>/list_1.html">��ϸ����&gt;&gt;</a>			</p>
	    </li>
	    </cms:channelList>
	  </ul>
	 <!--  <div class="page_div"><a href="#">��һҳ</a> ��һҳ 1 2 3 4 ��һҳ ���һҳ</div> -->
	</div>
	<div class="clear"></div>
</body>
</html>