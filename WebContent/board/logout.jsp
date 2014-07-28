<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../config/dbconn.jsp" %>
<%
	session.removeAttribute("uidx");
	response.sendRedirect("./index.jsp");
%>