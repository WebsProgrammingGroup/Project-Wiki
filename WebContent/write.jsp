<%@page import="com.sun.xml.internal.ws.wsdl.writer.document.OpenAtts"%>
<%@ include file="./config/dbconn.jsp"%>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<link href="writeStyle.css" type="text/css" rel="stylesheet">
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
			conn = DriverManager.getConnection(DB_URL, DB_USER,DB_PASSWORD);
			stmt = conn.createStatement();

			if (MODE.equalsIgnoreCase("E")|| MODE.equalsIgnoreCase("R")) {
				if (MODE.equalsIgnoreCase("R")) {
					Query = "UPDATE board set hits=hits+1 where idx="+ IDX;
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
	<div id="wrapper">
	<form action="write_ok.jsp" method="post" name="regitform">
		<table>
			<tr>
				<td class="td1">작성자</td>
				<%
					if (IDX == null) {
				%>
				<td class="td2"><input readonly type="text" name="uid" value=<%=UID%>>
				</td>
				<%
					} else {
				%>
				<td class="td2"><input <%if (MODE.equalsIgnoreCase("R")) {%>) readonly
					<%}%> type="text" name="uid" value=<%=WRITER%>></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td class="td1">제목</td>
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
				<td class="td1 td3">내용</td>
				<%
					if (IDX == null) {
				%>
				<td><textarea name="contents"></textarea></td>
				<%
					} else {
				%>
				<td><textarea <%if (MODE.equalsIgnoreCase("R")) {%>) readonly
						<%}%> name="contents"><%=CONTENTS%></textarea></td>
				<%
					}
				%>
			</tr>
		</table>
		<%
			if (IDX == null) {
		%>
		<input type="submit" value="글쓰기" name="submitbtn">
		<%
			} else {
		%>
		<input type="button" value="목록" name="list" onClick="goList()">
		<%
			if (WRITER.equalsIgnoreCase(UID)) {
					if (MODE.equalsIgnoreCase("R")) {
		%>
		<input type="button" value="수정" name="edit" onClick="goEdit(<%=IDX%>)">
		<input type="button" value="삭제" name="delete" onClick="goDelete(<%=IDX%>)">
		<%
			} else {
		%>
		<input type="hidden" name="idx" value=<%=IDX%>>
		<input type="submit" value="글쓰기" name="submitbtn" id="submitbtn">
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
	</div>
</body>
</html>