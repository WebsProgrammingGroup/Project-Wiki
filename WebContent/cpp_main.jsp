<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<%
String MENU= request.getParameter("menu");
String UIDX=(String)session.getAttribute("uidx");
%>
<head>
    <link href="cpp_mainStyle.css" type="text/css" rel="stylesheet">
    <SCRIPT>
    function submitForm(){
    	var f = document.addcomment;
    		f.submit();
    }
    function cpp_main(){
    	location.replace("cpp_main.jsp?menu=1");
    }
    </SCRIPT>
</head>
<body>
   <!--LEFT 네비게이션-->
    <div id="left_wrapper">
    <nav id="left_nav">
    <%
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = conn.createStatement();
		String query = "SELECT * FROM cplus";
		rs = stmt.executeQuery(query);
		
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
		String mquery = "SELECT * FROM cplus WHERE idCplus='"+MENU+"'";
		rs = stmt.executeQuery(mquery);
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
			String Query = "SELECT * FROM member where idx ="+UIDX;
			rs = stmt.executeQuery(Query);
			rs.next();
			String UID = rs.getString("id");
			
			
			String cquery = "SELECT * FROM comment where category='"+MENU+"'";
			rs = stmt.executeQuery(cquery);
			while (rs.next()) {
		%>
		<input type="hidden" name="category" value="<%=rs.getString("idx")%>">
		<tr>
			<td><%=rs.getString("writer")%></td>
			<td>
			<%=rs.getString("contents")%>
			<%if(UID.equalsIgnoreCase(rs.getString("writer"))){%>
				<input type="button" value="수정">
				<input type="button" value="삭제">
			<%
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

    <form action="cpp1_comment_prog.jsp" method="post" name="addcomment" onsubmit="return false">
    <input type="hidden" name="category" value="<%=MENU%>">
    <input type="text" name="comment" value="댓글내용" id="textbox">
    <input type="button" value="댓글쓰기" onClick="submitForm()" id="writebutton">
    </form>
    </div>
    </div>
</body>