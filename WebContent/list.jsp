<%@ include file="header.jsp" %>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>게시판 목록</title>
    <link href="listStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
	<h1>Q&A</h1>
	<div id="wrapper">
	<table>
		<tr>
			<th id="no"><p>No</p></th>
			<th id="writer"><p>Writer</p></th>
			<th id="title"><p>Title</p></th>
			<th id="date"><p>Date</p></th>
			<th id="hits"><p>Hits</p></th>
		</tr>
		<%
			try {
				conn = DriverManager
						.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				stmt = conn.createStatement();
				String query = "SELECT * FROM board";
				rs = stmt.executeQuery(query);
		%>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><a href="write.jsp?idx=<%=rs.getInt(1)%>&mode=R"> <%=rs.getString(3)%></a></td>
			<td><%=rs.getString("wdate")%></td>
			<td><%=rs.getString("hits")%></td>
		</tr>
		<%
			} // end while
		%>
		<%
			rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				out.println("err:" + e.toString());
				return;
			}
		%>
	</table>
	</div>
	<a id="writelink" href="write.jsp?mode=W"> 글쓰기 </a>
</body>
</html>