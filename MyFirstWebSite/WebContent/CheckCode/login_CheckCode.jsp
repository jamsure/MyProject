<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function reloadeCode() {
		var date=new Date().getTime();
		document.getElementById("imagecode").src = "<%= request.getContextPath() %>/servlet/ImageServlet?id="+date;
	}
</script>
</head>
<body>
验证码：<input type="text" name="checkcode">
<img id="imagecode" alt="验证码" src="<%=request.getContextPath() %>/servlet/ImageServlet">
<a href="javascript:reloadCode();">看不清楚</a>

</body>
</html>