<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>로그인</title>
</head>
<script language="javascript">
	function goJoin() {
		parent.location.replace("member.jsp");
	}
</script>
<body>
	<h1>LOGIN PAGE</h1>
	<form action="login_ok.jsp" method="post" name="login">
		<table>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="uid">
				<td />
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" name="upw"></td>
			</tr>
		</table>
		<input type="submit" value="OK" name="submitbtn"> <input
			type="button" value="JOIN" name="delete" onClick="goJoin()">
	</form>
</body>
</html>