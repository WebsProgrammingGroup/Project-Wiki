<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>로그인</title>
<link href="loginStyle.css" type="text/css" rel="stylesheet">
</head>
<script language="javascript">
	function goJoin() {
		parent.location.replace("member.jsp");
	}
</script>
<body>
	<h1>LOGIN PAGE</h1>
	<div class="wrapper">
	<form action="login_ok.jsp" method="post" name="login">
	<div class="input_row" id="id_box">
		<span>
			<input type="text" name="uid" class="input_box">
		</span>
	</div>
	<div class="input_row" id="psw_box">
		<span>
			<input type="password" name="upw" class="input_box">
		</span>
	</div>
	<input type="submit" value="로그인" name="submitbtn" id="loginbutton">
	<input type="button" value="아이디/비밀번호 찾기" name="??" id="findbutton">
	<input type="button" value="회원가입" name="delete" onClick="goJoin()" id="joinbutton">
	</form>
	</div>
</body>
</html>