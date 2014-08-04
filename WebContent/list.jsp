<%@ include file="./config/dbconn.jsp" %>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>게시판 목록</title>
    <link href="listStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--헤더-->
    <header id="main_header">
        <%
			if(session.getAttribute("uidx") == null){	// 로그인 안 된 상태
		%>
        <nav id="right_nav">
            <ul>
                <li><a href="login.jsp">로그인</a></li>
                <li><a href="member.jsp">회원가입</a></li>
            </ul>
        </nav>
        <%
			}else{
		%>
           <nav id="right_nav">
            <ul>
                <li><a href="logout.jsp">로그아웃</a></li>
            </ul>
             </nav>
        <%} %>
        <h1 class="maintext">
            <a href="index.jsp">웹스와 함께하는 언어공부</a>
        </h1>
    </header>

    <!--네비게이션-->
    <div class="wrapper">
	    <nav id="top_nav">
	        <div class="divclass">
	    	    <ul>
		            <li class="topmenu">
		                <a class="menuLink" href="body.jsp">C++</a>
		                <ul class="submenu">
		                    <li><a class="submenuLink" href="#">C++이란?</a></li>
		                    <li><a class="submenuLink" href="#">변수</a></li>
		                    <li><a class="submenuLink" href="#">입출력함수</a></li>
		                    <li><a class="submenuLink" href="#">반복문</a></li>
		                    <li><a class="submenuLink" href="#">조건문</a></li>
		                </ul>
		            </li>
		            <li class="leftborder topmenu">
		                <a class="menuLink" href="#">HTML</a>
		                <ul class="submenu">
		                    <li><a class="submenuLink" href="#">HTML1</a></li>
		                    <li><a class="submenuLink" href="#">HTML2</a></li>
		                    <li><a class="submenuLink" href="#">HTML3</a></li>
		                    <li><a class="submenuLink" href="#">HTML4</a></li>
		                </ul>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="#">JAVA</a>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="#">JSP</a>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="#">MySQL</a>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="list.jsp">Q&A</a>
		            </li>
		        </ul>     
	        </div>
	    </nav>
	</div>

	<h1>Q&A</h1>
	<div id="wrapper">
	<table>
		<tr>
			<th id="no"><p>No</p></th>
			<th id="writer"><p>Writer</p></th>
			<th id="title"><p>Title</p></th>
			<th id="date"><p>Date</p></th>
			<th id="hits"><p>Hits</p></th>
		</tr>
		<%
			try {
				conn = DriverManager
						.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				stmt = conn.createStatement();
				String query = "SELECT * FROM board";
				rs = stmt.executeQuery(query);
		%>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><a href="write.jsp?idx=<%=rs.getInt(1)%>&mode=R"> <%=rs.getString(3)%></a></td>
			<td><%=rs.getString("wdate")%></td>
			<td><%=rs.getString("hits")%></td>
		</tr>
		<%
			} // end while
		%>
		<%
			rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				out.println("err:" + e.toString());
				return;
			}
		%>
	</table>
	</div>
	<a id="writelink" href="write.jsp?mode=W"> 글쓰기 </a>
</body>
</html>