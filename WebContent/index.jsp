<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="cms" uri="/web/redcms-tags" %>
<%--
   request.getRequestDispatcher("web/index").forward(request,response);
--%>
<%
response.sendRedirect("index.html");
%>
<%-- 				 
				   <ul>
	        <cms:artList model="articles" channelId="4" top="3">
	        	<li><a href="<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title" maxSize="16"/></a></li>
	        </cms:artList>
	   </ul>
	    <hr/>
	    <ul class="topfocus">
				  <% int index=1; %>
				  <cms:artList model="articles" channelId="5" top="13">
				     <li><a href="<cms:property name="path"/>/<cms:property name="channelId"/>_<cms:property name="id"/>.html"><cms:property name="title"/></a></li>
				   <%
				     if(index++==4)
				     {
				    	 out.println("</ul><ul class=\"botfocus\">");
				     }
				   %>
				  </cms:artList>
				  </ul> --%>