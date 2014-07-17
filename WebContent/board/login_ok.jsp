<%@ include file="dbConnect.jsp"%>
<%
request.setCharacterEncoding("utf-8"); // 한글 처리를 위한 구문
String UID = request.getParameter("uid");
String UPW = request.getParameter("upw");
%>
<%
	try {
// Connection 을 가져온다.
conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
String query = "SELECT count(*) from member where uid='" + UID +"' and upw='" + UPW + "'";
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()) // ResultSet 가져와서 처리
{
String count = rs.getString(1);
if(count.equals("1")){
session.setAttribute("userid",UID);
response.sendRedirect("list.jsp");
			}
		}
		response.sendRedirect("login.jsp");
	} catch (Exception e) {
		out.println(e);
		return;
	}
%>