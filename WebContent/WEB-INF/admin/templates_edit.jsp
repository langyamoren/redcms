<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>修改模板文件</title>
<script charset="utf-8" src="../res/kindeditor_4_1_6/kindeditor.js"></script>
<script charset="utf-8" src="../res/kindeditor_4_1_6/lang/zh_CN.js"></script>
<script type="text/javascript">
/* KindEditor.ready(function(K) {
	K.create('textarea[name="content"]', {
		filterMode : false
	});
});
 */

</script>
</head>
<body>
<center>
  <form action="template" method="post">
   <input type="hidden" value="saveEdit" name="action"/>
   <input type="hidden" value="${fname}" name="fname"/>
   <textarea style="width:730px; height:360px;" id="content" name="content">${filecontents}</textarea><br/>
   <input type="submit" value="修改"/>
  </form>

</center>
</body>
</html>