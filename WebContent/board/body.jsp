<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../config/dbconn.jsp" %>


<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <link href="bodyStyle.css" type="text/css" rel="stylesheet">
        <SCRIPT>
    function submitForm(){
    	var f = document.addcomment;
    		f.submit();
    }
    </SCRIPT>
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
	
	<!--Left 네비게이션-->
    <nav id="left_nav">
        <ul>
            <li><a href="cpp1.html" target="mainf">C++이란?</a></li>
            <li><a href="cpp2.html" target="mainf">변수</a></li>
            <li><a href="cpp3.html" target="mainf">입출력함수</a></li>
            <li><a href="cpp4.html" target="mainf">반복문</a></li>
            <li><a href="cpp5.html" target="mainf">조건문</a></li>
        </ul>
    </nav>
	
	<!--컨텐츠 -->
    <div id="contents">
		내용
		<a href="modify.html"><input type="button" value="수정하기"/></a>
    </div>
    <div id="reply">
    <table>
    	<tr>
			<td id="writer">작성자</td>
			<td id="text">내용</td>
			<td id="date">날짜</td>
		</tr>
		<%
			try {
				conn = DriverManager
						.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				stmt = conn.createStatement();
				String query = "SELECT * FROM comment";
				rs = stmt.executeQuery(query);
		%>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%>
			<td><%=rs.getString("wdate")%></td>
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
    
    <form action="cpp1_comment_prog.jsp" method="post" name="addcomment" onsubmit="return false">
    <input type="text" name="comment" value="댓글 내용" id="textbox">
    <input type="button" value="댓글 쓰기" onClick="submitForm()" id="writebutton">
    </form>
    </div>
</body>