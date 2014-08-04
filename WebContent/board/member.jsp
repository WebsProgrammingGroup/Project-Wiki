<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>회원가입</title>
<link href="memberStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
	<h1>JOIN PAGE</h1>
	<div class="wrapper">
	<form action="member_ok.jsp" method="post" name="regitform">
		<a>아이디</a>
		<input type="text" name="uid" class="input_box">
		<a>이름</a>
		<input type="text" name="uname" class="input_box">
		<a>비밀번호</a>
		<input type="password" name="upw" class="input_box">
		<a>비밀번호 확인</a>
		<input type="password" name="upwcheck" class="input_box">
		<a>생년월일</a>
		<input type="date" name="ubirth" class="input_box">
		<a>이메일 주소</a>
		<input type="email" name="uemail" class="input_box">
		<input type="submit" value="가입하기" name="submitbtn" id="submitbtn">
		<input type="reset" value="취소" name="resetbtn" id="resetbtn">
	</form>
	</div>
</body>
</html>