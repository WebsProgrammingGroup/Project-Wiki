<%@ include file="./config/dbconn.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<html><head><title>회원가입 처리</title></head> <body>
<%
String UID = request.getParameter("uid");
String UNAME = request.getParameter("uname");
String UPW = request.getParameter("upw");
String UBIRTH = request.getParameter("ubirth");
String UEMAIL = request.getParameter("uemail");
%>
<% try {
conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
String query = "INSERT INTO member(id, name, pwd, birth, email) values(?,?,password(?),?,?)";
pstmt = conn.prepareStatement( query );
pstmt.setString( 1, UID);
pstmt.setString( 2, UNAME);
pstmt.setString( 3, UPW);
pstmt.setString( 4, UBIRTH);
pstmt.setString( 5, UEMAIL);
pstmt.executeUpdate();
response.sendRedirect("login.jsp");
}
catch(Exception e) {
out.println(e);
return;
}
%>
</body>
</html>