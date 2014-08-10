<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<%@ include file="./config/dbconn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
String EXPLAIN = request.getParameter("ir1");
String IDCPLUS = request.getParameter("idCplus");
out.println(EXPLAIN);
out.println(IDCPLUS);
conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

String Query = "update cplus set cplus.explain='"+EXPLAIN+"' where idCplus="+IDCPLUS;
pstmt = conn.prepareStatement(Query);
pstmt.executeUpdate();
response.sendRedirect("cpp_main.jsp?menu="+IDCPLUS);
%>
