<%@ include file="dbConnect.jsp" %>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>게시판 목록</title>
</head>
<body>
	<h1>LIST</h1>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>No</p></td>
			<td width=100><p align=center>Writer</p></td>
			<td width=320><p align=center>Title</p></td>
			<td width=100><p align=center>Date</p></td>
			<td width=100><p align=center>Hits</p></td>
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
			<td><a href="write.jsp?idx=<%=rs.getInt(1)%>&mode=R"> <%=rs.getString(3)%>
			</a></td>
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
	<a href="write.jsp?mode=W"> WRITE </a>
</body>
</html>