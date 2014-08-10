<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<%
	String MENU = request.getParameter("menu");
%>

<head>
<title></title>
<link href="modifyStyle.css" type="text/css" rel="stylesheet">
<SCRIPT>
	function submitContents(elClickedObj) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}
</SCRIPT>

</head>


<body>
	<!--LEFT 네비게이션-->
	<div id="left_wrapper">
		<nav id="left_nav">
			<%
				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				stmt = conn.createStatement();
				String query = "SELECT * FROM cplus";
				rs = stmt.executeQuery(query);

				while (rs.next()) {
			%>
			<ul>
				<li><a href="cpp_main.jsp?menu=<%=rs.getInt(1)%>"> <%=rs.getString("menu")%></a></li>

			</ul>
			<%
				}
				// end while
			%>
			<img src="btn_1.png">
		</nav>
	</div>

	<!--에디터-->
	<div id="editorwrapper">
		<form action="modify_ok.jsp" method="post" name="regitform">

			<script type="text/javascript" src="./se2/js/HuskyEZCreator.js"
				charset="utf-8"></script>
			<textarea name="ir1" id="ir1" rows="10" cols="100">
		
		<%
					String mquery = "SELECT * FROM cplus WHERE idCplus='" + MENU + "'";
					rs = stmt.executeQuery(mquery);
					if (rs.next()) {
				%>	
			<%=rs.getString("explain")%>
			<%
				}
			%>
		</textarea>

			<script type="text/javascript">
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "ir1",
					sSkinURI : "./se2/SmartEditor2Skin.html",
					fCreator : "createSEditor2"
				});
			</script>
			<input type="hidden" name="idCplus" value="<%=MENU%>">
			<input type="button" value="글쓰기" class="writebtn" onclick="submitContents(this);">
		</form>
	</div>
</body>
</html>