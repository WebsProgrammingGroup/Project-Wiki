<%@page import="com.sun.xml.internal.ws.wsdl.writer.document.OpenAtts"%>
<%@ include file="dbConnect.jsp"%>
<html>
<head>
<title>WRITE</title>
<script language="javascript">
 function goList(){
 parent.location.replace("list.jsp");
 }
 function goEdit(idx){
 parent.location.replace("write.jsp?idx="+idx +"&mode=E");
 }
 function goDelete(idx) {
 parent.location.replace("write.jsp?idx="+idx +"&mode=D");
 }
 function openAlert(str){ 
	 alert(str);
 }
 </script>
</head>
<%
	String UID = (String) session.getAttribute("userid");
	if (UID == null)
		response.sendRedirect("login.jsp");

	String IDX = request.getParameter("idx");
	String MODE = request.getParameter("mode");
	String WRITER = null;
	String TITLE = null;
	String CONTENTS = null;
	String Query = null;
%>

<%
	if (IDX != null) {
		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER,
					DB_PASSWORD);
			stmt = conn.createStatement();

			if (MODE.equalsIgnoreCase("E")
					|| MODE.equalsIgnoreCase("R")) {
				if (MODE.equalsIgnoreCase("R")) {
					Query = "UPDATE board set hits=hits+1 where idx="
							+ IDX;
					stmt.executeUpdate(Query);
				}
				Query = "SELECT * FROM board where idx=" + IDX;
				rs = stmt.executeQuery(Query);
				while (rs.next()) {
					WRITER = rs.getString("writer");
					TITLE = rs.getString("title");
					CONTENTS = rs.getString("contents");
				}
				rs.close();
				stmt.close();
				conn.close();

			} else if (MODE.equalsIgnoreCase("D")) {
				Query = "DELETE from board where idx=" + IDX;
				stmt.executeUpdate(Query);
				stmt.close();
				conn.close();
				response.sendRedirect("./list.jsp");
				return;

			}
		} catch (SQLException e) {
			out.println("err:" + e.toString());
			return;
		} catch (Exception e) {
			System.out.println("Error occured");
			e.printStackTrace();
		}
	}
%>


<body>
	<%
		if (MODE.equalsIgnoreCase("W")) {
	%>
	<h1>WRITE MODE</h1>
	<%
		} else if (MODE.equalsIgnoreCase("R")) {
	%>
	<h1>READ MODE</h1>
	<%
		} else if (MODE.equalsIgnoreCase("E")) {
	%>
	<h1>EDIT MODE</h1>
	<%
		}
	%>
	<form action="write_ok.jsp" method="post" name="regitform">
		<table cellspacing=1 width=600 border=1>
			<tr>
				<td>Writer</td>
				<%
					if (IDX == null) {
				%>
				<td><input readonly type="text" name="uid" value=<%=UID%>>
				</td>
				<%
					} else {
				%>
				<td><input <%if (MODE.equalsIgnoreCase("R")) {%>) readonly
					<%}%> type="text" name="uid" value=<%=WRITER%>></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>Title</td>
				<%
					if (IDX == null) {
				%>
				<td><input type="text" name="title"></td>
				<%
					} else {
				%>
				<td><input <%if (MODE.equalsIgnoreCase("R")) {%>) readonly
					<%}%> type="text" name="title" value=<%=TITLE%>></td>
				<%
					}
				%>
			</tr>


			<tr>
				<td>Contents</td>
				<%
					if (IDX == null) {
				%>
				<td><textarea name="contents" cols="100" rows="20"></textarea></td>
				<%
					} else {
				%>
				<td><textarea <%if (MODE.equalsIgnoreCase("R")) {%>) readonly
						<%}%> name="contents" cols="100" rows="20"><%=CONTENTS%></textarea></td>
				<%
					}
				%>
			</tr>
		</table>
		<%
			if (IDX == null) {
		%>
		<input type="submit" value="WRITE" name="submitbtn">
		<%
			} else {
		%>
		<input type="button" value="LIST" name="list" onClick="goList()">
		<%
			if (WRITER.equalsIgnoreCase(UID)) {
					if (MODE.equalsIgnoreCase("R")) {
		%>
		<input type="button" value="EDIT" name="edit"
			onClick="goEdit(<%=IDX%>)"> <input type="button"
			value="DELETE" name="delete" onClick="goDelete(<%=IDX%>)">
		<%
			} else {
		%>
		<input type="hidden" name="idx" value=<%=IDX%>> <input
			type="submit" value="WRITE" name="submitbtn">
		<%
			}
		%>
		<%
			}
		%>
		<%
			}
		%>
	</form>
</body>
</html>