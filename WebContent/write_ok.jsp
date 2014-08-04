<%@ include file="./config/dbconn.jsp"%>
<%@ page language="java" import="java.util.*, java.text.*"%>
<%
request.setCharacterEncoding("utf-8");
String UID = request.getParameter("uid");
String TITLE = request.getParameter("title");
String CONTENTS = request.getParameter("contents");
String IDX = request.getParameter("idx");
String Query=null;
%>
<%!
private java.util.Date date;
SimpleDateFormat simformat;
private String getDate()
{
date = new java.util.Date();
simformat = new SimpleDateFormat("yyyy-MM-dd");
return simformat.format(date);
}
%>
<%
	try {
// Connection 을 가져온다.
conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
if(IDX==null) {
Query = "INSERT INTO board(writer, title, contents, wdate, hits) values(?,?,?,?,?)";
pstmt = conn.prepareStatement( Query );
pstmt.setString( 1, UID);
			pstmt.setString(2, TITLE);
			pstmt.setString(3, CONTENTS);
			pstmt.setString(4, getDate());
			pstmt.setString(5, "0");
		} else {
			Query = "UPDATE board set title='" + TITLE
					+ "', contents='" + CONTENTS + "' where idx=" + IDX;
			pstmt = conn.prepareStatement(Query);
		}
		pstmt.executeUpdate();
		response.sendRedirect("list.jsp");
	} catch (Exception e) {
		out.println(e);
		return;
	}
%>