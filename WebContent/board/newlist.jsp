<%@ include file="dbConnect.jsp" %>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>게시판 목록</title>
    <link href="newlistStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--헤더-->
    <header id="main_header">
        <nav id="right_nav">
            <ul>
                <li><a href="login.jsp">로그인</a></li>
                <li><a href="member.jsp">회원가입</a></li>
            </ul>
        </nav>
        <h1 class="maintext">
            <a href="body.html">웹스와 함께하는 언어공부</a>
        </h1>
    </header>

    <!--네비게이션-->
    <div class="wrapper">
	    <nav id="top_nav">
	        <div class="divclass">
	    	    <ul>
		            <li class="topmenu">
		                <a class="menuLink" href="cpp_main.html">C++</a>
		                <ul class="submenu">
		                    <li><a class="submenuLink" href="cpp1.html">C++이란?</a></li>
		                    <li><a class="submenuLink" href="cpp2.html">변수</a></li>
		                    <li><a class="submenuLink" href="cpp3.html">입출력함수</a></li>
		                    <li><a class="submenuLink" href="cpp4.html">반복문</a></li>
		                    <li><a class="submenuLink" href="cpp5.html">조건문</a></li>
		                </ul>
		            </li>
		            <li class="leftborder topmenu">
		                <a class="menuLink" href="html_main.html">HTML</a>
		                <ul class="submenu">
		                    <li><a class="submenuLink" href="html1.html">HTML1</a></li>
		                    <li><a class="submenuLink" href="html2.html">HTML2</a></li>
		                    <li><a class="submenuLink" href="html3.html">HTML3</a></li>
		                    <li><a class="submenuLink" href="html4.html">HTML4</a></li>
		                </ul>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="java_main.html">JAVA</a>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="jsp_main.html">JSP</a>
		            </li>
		            <li class="leftborder">
		                <a class="menuLink" href="mysql_main.html">MySQL</a>
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