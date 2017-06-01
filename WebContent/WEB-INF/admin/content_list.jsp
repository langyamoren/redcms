<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*,com.redcms.page.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>文章列表</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script type="text/javascript">
  $(function(){
	  /*全中全部*/
	   $("#selectall").click(function(){
		   
		   if($(this).attr("checked"))
			  {
			   $("table :checkbox").attr("checked","checked");   
			  }else
			  {
				  $("table :checkbox").removeAttr("checked");
			  }
	   });
	 /*批量发布*/
	 $("#pubbatch").click(function(){
		 var ids=$(".cids:checked");
		 var url="content?action=pub&channelId=${channelId}&modelId=${modelId}";
		 var cid="";
		 var chs="";
		 ids.each(function(i){
			cid=cid+"&cid="+ids[i].value;
			
			chs=chs+"&chs="+$(this).next(".ch_ids")[0].value;
		 });
		 
		 window.location=url+cid+chs;
	 });
	 /*批量删除*/
	 $("#delbatch").click(function(){
		 var ids=$(".cids:checked");
		 var url="content?action=delete&channelId=${channelId}&modelId=${modelId}";
		 var cid="";
		 ids.each(function(i){
			cid=cid+"&cid="+ids[i].value;
		 });
		 window.location=url+cid;
	 });
  });
</script>
</head>
<body>

<!--文章列表-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
	<th width="20"><input type="checkbox" name="checkbox2" id="selectall" /></th>
	<th width="40">序号</th>
	<th width="80">栏目</th>
	<th>标题</th>
	<th width="120">标签</th>
	<th width="130">时间</th>
	<th width="60">排序</th>
	<th width="130">
<form name="form1" method="post" action="content">
	<input type="hidden" name="action" value="add"/>
	<input type="hidden" name="modelId" value="${modelId}"/>
	<input type="hidden" name="channelId" value="${channelId}"/>
	<input type="submit" name="Submit" value="添加新文章">
      </form>
    </th>
  </tr>
  <%
  @SuppressWarnings("unchecked")
    PageDiv<Content> pd=(PageDiv<Content>)request.getAttribute("pd");
    if(null!=pd)
    {
    	List<Content> list=pd.getList();
    	if(null!=list&&list.size()>0)
    	{
    		int ch=1;
    		ch=pd.getTotalCount()-((pd.getPageNo()-1)*pd.getPageSize());
    		int index=1;
    		int temch=1;
    		for(Content content:list)
    		{
    			temch=ch--;
    			%>

  <tr <%if(index%2==0){out.println("bgcolor=#EEE");} %>>
    <td align="center" valign="middle">
    <input type="checkbox" name="checkbox" value="<%=content.getId()%>" class="cids">
    <input type="hidden" name="chs" value="<%=temch%>" class="ch_ids"/>
    </td>
    <td align="center" valign="middle"><%=index++%></td>
    <td align="center" valign="middle"><%=content.getChannelName() %></td>
    <td align="left" valign="middle"><a href="content?action=browse&cid=<%=content.getId()%>&channelId=${channelId}&modelId=${modelId}&temch=<%=temch%>" class="l2" target="_blank"><%=content.getTitle() %></a></td>
    <td align="center" valign="middle"><%=content.getTags()%></td>
    <td align="center" valign="middle"><%=content.getCreateDate()%></td>
    <td align="center" valign="middle"><%=content.getOrderlist()%></td>
    <td align="center" valign="middle">
    <a href="content?action=pub&cid=<%=content.getId()%>&channelId=${channelId}&modelId=${modelId}&chs=<%=temch%>">发布</a>&nbsp; 
    <a href="content?action=edit&cid=<%=content.getId()%>&channelId=${channelId}&modelId=${modelId}">修改</a>&nbsp;
    <a href="content?action=delete&cid=<%=content.getId()%>&channelId=${channelId}&modelId=${modelId}">删除</a> </td>
  </tr>
      			<%
    		}
    	}
    	
    }
  %>
  <tr>
   <td  align="center" valign="middle" colspan="3">
   <input type="button" value="批量删除" id="delbatch"/>&nbsp;<input type="button" value="批量发布" id="pubbatch"/>
   </td>
  <td  align="center" valign="middle" colspan="5">
  <div class="showPage">
 <red:pager 
      indexCount="10" 
      pageSize="22" 
      pageNo="<%=pd.getPageNo() %>" 
      totalCount="<%=pd.getTotalCount() %>" 
      url="content"
      params="action=list&channelId=${channelId}&modelId=${modelId}"/>
      </div>
  </td>
  </tr>
</table>


<red:msgdig/>
</body>
</html>