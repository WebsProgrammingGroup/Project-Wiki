<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<%
String MENU= request.getParameter("menu");
String UIDX=(String)session.getAttribute("uidx");
String IDX = request.getParameter("idx");
String MODE = request.getParameter("mode");
String Query = null;
String UID = null;
String CONTENTS = null;
%>
<head>
    <link href="cpp_mainStyle.css" type="text/css" rel="stylesheet">
    <SCRIPT language="javascript">
    function submitForm(){
    	var f = document.addcomment;
    		f.submit();
    }
    function cpp_main(){
    	location.replace("cpp_main.jsp?menu=1");
    }
    function goEdit(idx){
  	 	parent.location.replace("cpp_main.jsp?idx="+idx +"&mode=E&menu="+<%=MENU%>);
    }
    function goDelete(idx) {
    	parent.location.replace("cpp_main.jsp?idx="+idx +"&mode=D&menu="+<%=MENU%>);
    }
    </SCRIPT>
</head>
<%
	if (IDX != null) {
		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER,DB_PASSWORD);
			stmt = conn.createStatement();

		if (MODE.equalsIgnoreCase("D")) {
			Query = "DELETE from comment where idx=" + IDX;
			stmt.executeUpdate(Query);
			stmt.close();
			conn.close();
			out.println("<script>document.location.href='cpp_main.jsp?menu="+MENU+"';</script>");
			//response.sendRedirect("cpp_main.jsp?");
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
	else{}
%>
<body>
   <!--LEFT 네비게이션-->
    <div id="left_wrapper">
    <nav id="left_nav">
    <%
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = conn.createStatement();
		Query = "SELECT * FROM cplus";
		rs = stmt.executeQuery(Query);
		
		while (rs.next()) {
	%>
	<ul>
		<li><a href="cpp_main.jsp?menu=<%=rs.getInt(1)%>"> <%=rs.getString("menu")%></a></li>
		
	</ul>
	<%
		}
		// end while
	%>
	</nav>
	</div>
	
	<!--컨텐츠 -->
	<div id=conwrapper>
    <div id="contents">
		<%
		Query = "SELECT * FROM cplus WHERE idCplus='"+MENU+"'";
		rs = stmt.executeQuery(Query);
		if(rs.next()){
	 %>	
		<%=rs.getString("explain")%>
		<%}else{%>
			<body onload="cpp_main()"><body>
		<%
		}
		
		%>
		
		<a href="modify.jsp?menu=<%=MENU%>"><input type="button" class="btn" value="수정하기"/></a>
    </div>
    
    <!-- 댓글 -->
    <div id="reply">
   <table>
		<tr>
			<td id="writer">작성자</td>
			<td id="text">내용</td>
			<td id="date">작성일자</td>
		</tr>
		<%
		try {
			if (UIDX != null) {
			Query = "SELECT * FROM member where idx ="+UIDX;
			rs = stmt.executeQuery(Query);
			rs.next();
			UID = rs.getString("id");
			}
			
			Query = "SELECT * FROM comment where category='"+MENU+"'";
			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("writer")%></td>
					<td>
					<%=rs.getString("contents")%>
					<%
					if (UIDX != null) {
						if(UID.equalsIgnoreCase(rs.getString("writer"))){
						%>
							<input type="button" value="수정" name="edit" onClick="goEdit(<%=rs.getString("idx")%>)">
							<input type="button" value="삭제" name="delete" onClick="goDelete(<%=rs.getString("idx")%>)">
						<%
						}
					}
					%>
					</td>
					<td><%=rs.getString("wdate")%></td>
				</tr>
				<%
				} // end while
		} catch (SQLException e) {
			out.println("err:" + e.toString());
			return;
		}
		rs.close();
		stmt.close();
		conn.close();
		%>
	</table>
	<%
		if(IDX!=null){
			conn = DriverManager.getConnection(DB_URL, DB_USER,DB_PASSWORD);
			stmt = conn.createStatement();
			if(MODE.equalsIgnoreCase("E")){
				Query = "SELECT * FROM comment where idx=" + IDX;
				rs = stmt.executeQuery(Query);
				while (rs.next()) {
				CONTENTS = rs.getString("contents");
				}
				rs.close();
				stmt.close();
				conn.close();
			}
		}
	%>

    <form action="cpp1_comment_prog.jsp" method="post" name="addcomment" onsubmit="return false">
    <input type="hidden" name="category" value="<%=MENU%>">
    <%if(IDX!=null){%>
    	<input type="hidden" name="idx" value=<%=IDX%>>
    	<input type="text" name="comment" value="<%=CONTENTS%>" id="textbox">
        <input type="button" value="수정하기" onClick="submitForm()" id="writebutton">
    <%}
    else{%>
    <input type="text" name="comment" value="댓글내용" id="textbox">
    <input type="button" value="댓글쓰기" onClick="submitForm()" id="writebutton">
    
    <%}%>
   
    </form>
    </div>
    </div>
</body>