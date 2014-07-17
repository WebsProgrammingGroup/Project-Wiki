<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	// 드라이버를 로드한다.
	Class.forName("com.mysql.jdbc.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/webboard?"
			+ "useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD = "0424";
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>