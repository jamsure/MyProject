<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册/登录</title>
<script type="text/javascript">
	var xmlHttp;
	var flag;
	function createXMLHttp(){
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function checkUserid(username){
		createXMLHttp();
		xmlHttp.open("POST","/MyFirstWebSite/servlet/CheckServlet?username="+username);
		xmlHttp.onreadystatechange=checkUseridCallback;
		xmlHttp.send(null);
		document.getElementById("user_name_span").innerHTML="正在验证...";
	}
	
	function checkUseridCallback(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				var text=xmlHttp.responseText;
				if(text=="true"){
					flag==false;
					document.getElementById("user_name_span").innerHTML="用户ID重复，无法使用！";
				}else{
					flag=true;
					document.getElementById("user_name_span").innerHTML="此用户ID可以使用！";
				}
			}
		}
	}
	
	function checkForm(){
		return flag;
	}
	
</script>
<style type="text/css">

*{
	margin: 0;
	padding: 0;

}	
.contain{
margin:0 auto 20px;;
	width: 960px;
}
.contain td{
	height: 38px;
	line-height: 38px;
	
}
.login_reg{
border: 1px solid;
margin-top: 10px;
}

.login{
	padding:5px;
	display: inline-block;
	width: 468px;
}

.reg{
	padding:5px;
	display: inline-block;
	width: 460px;
	margin: 0px;
	border-left:1px solid; 

}
.user_reg{
	padding-left:20px;
	height: 35px;
	line-height: 35px;
	width: 440px;
	background-color: #ECECEC;
}
form{
	margin-left:100px;
}
.left{
	text-align: right;
}
.right{
	width: 250px;
}
.find_pwd{
	color:red;
	font-size: 10px;
	text-align: right;
}
.submit{
 		text-align: right;
}
.center{
	text-align: center;
}
.login_form{
width: 360px;
}
</style>
</head>
<body>
<%-- <%@ include file="NaviGation.jsp" %> --%>
<jsp:include page="NaviGation.jsp" />
<div class="contain" >
	<p>当前位置:首页>注册/登录</p>
	<hr/>
		<div class="login_reg">
	<table>
		<tr>
		<td><div class="login">
		<p class="user_reg">用户登录：</p>
		<form action="/MyFirstWebSite/servlet/loginConfirm2" method="post" name="login_form"  class="login_form">
		<table>
			<tr>
				<td class="left">用户名</td><td class="right"><input type="text" name="username"><span id="username_span"></span></td>
			</tr>
			<tr>
				<td class="left">密码</td><td class="right"><input type="password" name="userpwd"><span id="userpwd_span"></span></td>
			</tr>
			<tr>
				<td class="left">验证码</td><td class="right"><input type="text"><span></span></td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="saveSession" value="true">记住密码</td>
			</tr>
			<tr>
				<td colspan="2" class="find_pwd">密码问题找回密码 注册邮件找回密码</td>
			</tr>
			<tr>
				<td colspan="2" class="submit"><input type="submit" value="登录">&nbsp;<input type="button" value="不登录，直接购买"></td>
			</tr>
		</table>
		</form>
		</div></td>
		<td><div class="reg">
		<p class="user_reg">用户注册：</p>
		<form action="" method="post" name="reg_form" onsubmit="return checkForm()">
		<table>
			<tr>
				<td class="left">用户名</td><td class="right"><input type="text" name="user_name" onblur="checkUserid(this.value)"><span id="user_name_span"></span></td>
			</tr>
			<tr>
				<td class="left">电子邮件地址</td><td class="right"><input type="text" name="user_emil"><span id="user_emil_span"></span></td>
			</tr>
			<tr>
				<td class="left">密码</td><td class="right"><input type="text" name="user_pwd"><span id="user_pwd_span"></span></td>
			</tr>
			<tr>
				<td class="left">确认密码</td><td class="right"><input type="text" name="userpwd_confirm"><span id="userpwd_confirm_span"></span></td>
			</tr>
			<tr>
				<td class="left">验证码</td><td class="right"><input type="text"><span></span></td>
			</tr>
			<tr>
				<td colspan="2" class="center"><input type="submit" value="注册新用户"></td>
			</tr>
		</table>
		</form>
		</div></td>
		</tr>
	</table>

		
		
	</div>
</div>

<%-- <%@ include file="Footer.jsp" %> --%>
<jsp:include page="Footer.jsp" />
</body>
</html>