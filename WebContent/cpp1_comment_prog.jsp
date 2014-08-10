<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<%@ include file="./config/dbconn.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	String CONTENTS = request.getParameter("comment");
	String CATEGORY = request.getParameter("category");
	String IDX = request.getParameter("idx");
	String UIDX = (String)session.getAttribute("uidx");
	
	String Query = null;
%>
<%
	// Connection 을 가져온다.
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	if(UIDX != null){
		Query = "select * from `member` where `idx` = " + UIDX;
		stmt = conn.createStatement();
		rs = stmt.executeQuery(Query);
		rs.next();
		String UID = rs.getString("id");
		if(IDX==null) {
		Query = "INSERT INTO comment(writer, contents, category) values(?,?,?)";
		pstmt = conn.prepareStatement(Query);
		pstmt.setString(1, UID);
		pstmt.setString(2, CONTENTS);
		pstmt.setString(3, CATEGORY);
		out.println("<script>alert('댓글이 등록되었습니다.'); document.location.href='cpp_main.jsp?menu="+CATEGORY+"';</script>");
		}else {
			Query = "UPDATE comment set contents='" + CONTENTS + "' where idx=" + IDX;
			pstmt = conn.prepareStatement(Query);
			out.println("<script>alert('댓글이 수정되었습니다.'); document.location.href='cpp_main.jsp?menu="+CATEGORY+"';</script>");
		}
		pstmt.executeUpdate();
		
	}
	else{
		out.println("<script>alert('로그인 해주세요.');");
		out.println("history.go(-1);</script>");
		}
%>