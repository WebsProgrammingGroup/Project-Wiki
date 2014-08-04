<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.io.IOException, org.jsoup.Jsoup, org.jsoup.nodes.Document,
org.jsoup.nodes.Element, org.jsoup.select.Elements, java.net.*, java.util.*, java.text.*,
com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>

<%@ include file="./config/dbconn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

String query = "select * from `member` where `id`='"+uid+"' and `pwd`=password('"+upw+"')";

stmt = conn.createStatement();
rs = stmt.executeQuery(query);

if(rs.next()){
	session.setAttribute("uidx", rs.getString("idx"));
	response.sendRedirect("index.jsp");
}
else{
	out.println("<script>alert('로그인에 실패하였습니다.');");
	out.println("history.go(-1);</script>");
}



%>
