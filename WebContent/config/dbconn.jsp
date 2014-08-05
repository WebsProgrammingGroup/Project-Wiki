<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.io.IOException, org.jsoup.Jsoup, org.jsoup.nodes.Document,
org.jsoup.nodes.Element, org.jsoup.select.Elements" %>
<%@ page session = "true" %>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");


Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/wiki?useUnicode=true&characterEncoding=utf8";
String DB_USER = "root";
String DB_PASSWORD = "1234";

Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
%>