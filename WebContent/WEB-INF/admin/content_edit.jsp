<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>修改文章</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script charset="utf-8" src="../res/kindeditor_4_1_6/kindeditor.js"></script>
<script charset="utf-8" src="../res/kindeditor_4_1_6/lang/zh_CN.js"></script>
<%
List<ModelItem> itemlists=(List<ModelItem>)request.getAttribute("itemlist");
Content content=(Content)request.getAttribute("content");
ContentTxt contentTxt=(ContentTxt)request.getAttribute("contentTxt");
%>
<%!
  public ModelItem getModelItemByName(List<ModelItem> itemlists,String name)
  {
	ModelItem item=null;
	 for(ModelItem ttemp:itemlists)
	 {
		if(ttemp.getName().equals(name))
			
			{item=ttemp;break;}
	 }
	return item;
  }
%>

<script language="javascript">
        var editor;
        KindEditor.ready(function(K) {
                    editor =  K.create('#content', {
                    uploadJson : '../admin/upload_pic',
                    allowFileManager : false,
                    afterUpload : function( url, data, name) {
                        var reId=data.filesId;
                    	var ins=K.query('#filesId');
                    	if(ins.value=="")
                    		{
                    		ins.value=reId+',';
                    		}else
                    		{
                    		 ins.value=ins.value+reId+",";
                    		}
                        
                    }
                    });//end create
                    <%
                       ModelItem mi1=getModelItemByName(itemlists, "title_pic");
                      if(null!=mi1)//title_ipc
                      {
                    %>
                    K('#titleImage').click(function() {
    					editor.loadPlugin('image', function() {
    						editor.plugin.imageDialog({
    							imageUrl : K('#titlePic').val(),
    							clickFn : function(url, title, width, height, border, align) {
    								K('#titlePic').val(url);
    								editor.hideDialog();
    								document.getElementById("titleImage").src=url;
    							}
    						});//end imageDialog
    					});//end loadPlugin
    				});//end click
    		        <%
                      }
    		        %>
    		        <%
    		          ModelItem mi2=getModelItemByName(itemlists, "content_pic");
    		          if(null!=mi2)
    		          {
    		        %>
    				/*内容图*/  
    				K('#contentImage').click(function() {
       					editor.loadPlugin('image', function() {
       						editor.plugin.imageDialog({
       							imageUrl : K('#contentPic').val(),
       							clickFn : function(url, title, width, height, border, align) {
       								K('#contentPic').val(url);
       								editor.hideDialog();
       								document.getElementById("contentImage").src=url;
       							}
       						});//end imageDialog
       					});//end loadPlugin
       				});//end click
       				<%
    		          }
       				%>
       				<%
       			  ModelItem mi3=getModelItemByName(itemlists, "type_pic");
       				if(null!=mi3)
       				{
       				%>
       				/*类别图*/  
    				K('#typeImage').click(function() {
       					editor.loadPlugin('image', function() {
       						editor.plugin.imageDialog({
       							imageUrl : K('#typePic').val(),
       							clickFn : function(url, title, width, height, border, align) {
       								K('#typePic').val(url);
       								editor.hideDialog();
       								document.getElementById("typeImage").src=url;
       							}
       						});//end imageDialog
       					});//end loadPlugin
       				});//end click
                    <%
       				}
                    %>
                    
                    
              });//end redady
</script>
<%
ModelItem mi4=getModelItemByName(itemlists, "title_color");
if(null!=mi4)
{
%>
	<script>
			KindEditor.ready(function(K) {
				var colorpicker;
				K('#titleColor').bind('click', function(e) {
					e.stopPropagation();
					if (colorpicker) {
						colorpicker.remove();
						colorpicker = null;
						return;
					}
					var colorpickerPos = K('#titleColor').pos();
					colorpicker = K.colorpicker({
						x : colorpickerPos.x,
						y : colorpickerPos.y + K('#titleColor').height(),
						z : 19811214,
						selectedColor : 'default',
						noColor : '无颜色',
						click : function(color) {
							K('#titleColor').val(color);
							colorpicker.remove();
							colorpicker = null;
						}
					});
				});
				
				
				K(document).click(function() {
					if (colorpicker) {
						colorpicker.remove();
						colorpicker = null;
					}
				});
			});
		</script>
<%
}
%>
		<script>
		var mime;
		var oldname;
			KindEditor.ready(function(K) {
				var editorfile = K.editor({
					allowFileManager : false,
					uploadJson : '../admin/upload_files',
					afterUpload : function( url, data, name) {
                    mime=data.mime;
                    oldname=data.oldname;
					var reId=data.filesId;
                    var ins=K.query('#filesId');
                    	if(ins.value=="")
                    		{
                    		ins.value=reId+',';
                    		}else
                    		{
                    		 ins.value=ins.value+reId+",";
                    		}
                        
                    }
				});
				K('#insertfile').click(function() {
					editorfile.loadPlugin('insertfile', function() {
						editorfile.plugin.fileDialog({
							fileUrl : K('#files').val(),
							clickFn : function(url, title) {
								K('#files').val(url);
								editorfile.hideDialog();
								K('#oldname').val(oldname);
								K('#mime').val(mime);
							}
						});
					});
				});
			});
		</script>
		

</head>
<body>

<form action="content" method="post">
<input type="hidden" name="action" value="saveEdit"/>
<input type="hidden" name="modelId" value="<%=request.getParameter("modelId")%>"/>
<input type="hidden" name="cid" value="<%=content.getId()%>"/>
<input type="hidden" name="channelId" value="<%=request.getParameter("channelId")%>"/>
<input type="hidden" name="managerId" value="${sessionScope.manager.id}"/>
<input type="hidden" name="filesId" id="filesId" value=""/>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="redtable">
  <tr class="redtable">
    <td width="50" align="right">标题:</td>
    <td width="535">
      <input type="text" name="title" style="width:400px;" value="<%=null!=content.getTitle()?content.getTitle():""%>"/>
      &nbsp;&nbsp; 
      <%
      ModelItem mi5=getModelItemByName(itemlists, "is_bold");
      Channel channel=(Channel)request.getAttribute("channel");
      if(null!=mi5)
      {
      %>
      <%=mi5.getLabel() %>:
      <%
	      if(content.getIsBold()==1) 
	      {
	    	%>
	    	<input name="isBold" type="checkbox" id="isBold" value="1" checked="checked">
	    	<%
	      }else
	      {
	    		%>
		    	<input name="isBold" type="checkbox" id="isBold" value="1">
		    	<%  
	      }
	      
     
      }
      %>
     &nbsp;&nbsp; 
     <%
     if(null!=mi4)
     {
     %>
       <%=mi4.getLabel() %>: <input name="titleColor" type="text" id="titleColor" style="width:50px;" size="3" value="<%=null==content.getTitleColor()?"":content.getTitleColor()%>"/>
    <%
     }
    %>
    <%
    ModelItem mi6=getModelItemByName(itemlists, "is_recommend");
    if(null!=mi6)
    {
    %>
     &nbsp;&nbsp; <%=mi6.getLabel() %>:
      <input name="isRecommend" type="checkbox" id="isRecommend" value="1"
      <%if(content.getIsRecommend()==1){out.println("checked='checked'");} %>
      ></td>
     <%
     }
     %>
  </tr>
  <tr class="redtable">
    <td align="right">标签:</td>
    <td><input type="text" name="tags" size="30"  value="<%=null==content.getTags()?"":content.getTags()%>"/>
      多外标签用逗号(,)分隔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
  <%
  ModelItem mi7=getModelItemByName(itemlists, "author");
  if(null!=mi7)
  {
  %>
    <%=mi7.getLabel()%>:<input name="author" type="text" id="author" style="width:60px;" size="10" value="<%=null!=content.getAuthor()?content.getAuthor():""%>"/>
      <%
  }
      %>
      &nbsp;&nbsp;&nbsp;
  <%
  ModelItem mi8=getModelItemByName(itemlists, "orderlist");
  if(null!=mi8)
  {
  %>
    排序:
      <select name="orderlist" id="orderlist">
       <%
       for(int zz=10;zz>0;zz--)
       {
    	 if(content.getOrderlist()==zz)
    	 {
            out.println("<option value='"+zz+"' selected='selected'>"+zz+"</option>");
    	 }else
    	 {
    		 out.println("<option value='"+zz+"'>"+zz+"</option>"); 
    	 }
       }
       %>
      </select>
      <%
  }
      %>
      </td>
  </tr>
  <%
  ModelItem mi9=getModelItemByName(itemlists, "description");
  ModelItem mi10=getModelItemByName(itemlists, "origin");
  ModelItem mi11=getModelItemByName(itemlists, "origin_url");
  if(null!=mi9||null!=mi10||null!=mi11)
  {
  %>
  
  <tr class="redtable">
    <td align="right"><%if(null!=mi9){ %><%=mi9.getLabel()%>:<%} %></td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:0;">
      <tr>
        <td width="59%" style="border:0;">
        <%if(null!=mi9){ %>
 <textarea name="description" cols="60" rows="3" id="description" style="width:400px; height:60px; float:left;"><%=content.getDescription()%></textarea>
         <%} %>
       </td>
        <td width="41%"  style="border:0;">
      <%
      if(null!=mi10)
    	  {%>     
                  <%=mi10.getLabel()%>：<input name="origin" type="text" id="origin" size="10" value="<%=null!=content.getOrigin()?content.getOrigin():""%>">
          <%
    	  }
          %>
          <br>
           <%
      if(null!=mi11)
    	  {%>   
              <%=mi11.getLabel() %>：<input name="originUrl" type="text" id="originUrl" value="<%=null!=content.getOriginUrl()?content.getOriginUrl():""%>">
                                  
            <%
    	  }
            %>                      
                                  </td>
      
      </tr>
    </table></td>
  </tr>
  <%
  }
  %>
  <%
  ModelItem mi12=getModelItemByName(itemlists, "link");
  ModelItem mi13=getModelItemByName(itemlists, "temp");
  if(null!=mi12||null!=mi13)
  {
  %>
  <tr class="redtable">
    <td align="right"><%if(null!=mi12){ %><%=mi12.getLabel()%>:<%} %></td>
    <td><%if(null!=mi12){ %><input name="link" type="text" id="link" size="60" value="<%=null!=content.getLink()?content.getLink():""%>"><%} %>
      &nbsp;&nbsp;&nbsp;
      
     <%
    
       if(null!=mi13)
       {
    	 
     %>   
       模版：<red:temFile temName="content" name="temp" id="temp" selected="<%=channel.getContentTemp()%>"/>
      <%
       }
      %>
      
      </td>
  </tr>
  
  <%
  }
  %>
  <tr>
    <td align="right" valign="middle">内容:</td>
    <td align="left" valign="middle"><textarea style="width:730px; height:360px;" id="content" name="content"><%=contentTxt.getTxt()%></textarea></td>
  </tr>
    <tr>
    <td align="center" valign="middle" colspan="2">

<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="180"  style="border:0;">
	<%
	  if(null!=mi1)
	  {
	%>
	<img id="titleImage" width="60" height="60"  src="../res/img/admin/upload-pic.png" style="cursor:pointer; margin:10px; " align="left"/>
	<input type="hidden" name="titlePic" id="titlePic"  value="<%=null!=content.getTitlePic()?content.getTitlePic():""%>"/>
	标题图：<br/>
	宽： 
	<input name="titleWidth" type="text" id="titleWidth" value="320" size="10" style="width:30px;"/>
	<br>
	高：
	<input name="titleHeight" type="text" id="titleHeight" value="120" size="10"  style="width:30px;" />	</td>
    <%
	  }
    %>
    <td width="180"  style="border:0;">
	<%
	if(null!=mi2)
		{
		 if(null!=content.getContentPic()&&!"".equals(content.getContentPic()))
		 {
		%>
	<img id="contentImage" width="60" height="60"  src="<%=content.getContentPic()%>" style="cursor:pointer; margin:10px; " align="left"/>
	<%
		 }else{
	%>	
	<img id="contentImage" width="60" height="60"  src="../res/img/admin/upload-pic.png" style="cursor:pointer; margin:10px; " align="left"/>
	<%} %>
	内容图：<br/>
	<input type="hidden" name="contentPic" id="contentPic"  value="<%=null!=content.getContentPic()?content.getContentPic():""%>"/>
	宽： 
	<input name="contentWidth" type="text" id="contentWidth" value="<%=channel.getPicWidth()%>" size="10" style="width:30px;" />
	<br>
	高：
	<input name="contentHeight" type="text" id="contentHeight" value="<%=channel.getPicHeight()%>" size="10"  style="width:30px;" />	
	<%
		}
	%>
	</td>
    <td width="180"  style="border:0;">
	<%
	  if(null!=mi3)
	  {
	   
	%>
	
	<img id="typeImage" width="60" height="60"  src="../res/img/admin/upload-pic.png" style="cursor:pointer; margin:10px; " align="left"/>
	<input type="hidden" name="typePic" id="typePic" value="<%=null!=content.getTypePic()?content.getTypePic():""%>"/>
	类型图:
	
	<br/>
	宽： 
	<input name="typeWidth" type="text" id="typeWidth" value="320" size="10" style="width:30px;" />
	<br>
	高：
	<input name="typeHeight" type="text" id="typeHeight" value="120" size="10"  style="width:30px;" />	</td>
    <%
	  }
    %>
    <td  style="border:0;" width="200"  align="left">附件：
    <input type="text" id="files" name="path" value="" /> 
    <input type="hidden" id="mime" name="mime"/>
    <input type="hidden" id="oldname" name="filename"/>
    <input type="hidden" id="fiel_desc" name="name"/>
    <input type="button" id="insertfile" value="选择" />
   
    </td>
  </tr>
</table>


	</td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle"><input type="submit" name="Submit" value="修改文章"></td>
  </tr>
</table>

</form>

<red:msgdig/>
</body>
</html>