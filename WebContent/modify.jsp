<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<%
	String MENU = request.getParameter("menu");
%>

<head>
<title></title>
<link href="modifyStyle.css" type="text/css" rel="stylesheet">
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
	</nav>
	</div>
	
	<!--에디터-->
	<div id="editorwrapper">
	<script type="text/javascript" src="./se2/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	<textarea name="ir1" id="ir1" rows="10" cols="100">
	<%
		String mquery = "SELECT * FROM cplus";
		rs = stmt.executeQuery(mquery);
		if (rs.next()) {
	%>	
		<%=rs.getString("explain")%>
		<%
			} else {
				response.sendRedirect("cpp_main.jsp?menu=1");
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
	</div>
</body>
</html>