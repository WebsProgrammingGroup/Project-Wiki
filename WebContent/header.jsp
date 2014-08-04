<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<%@ include file = "./config/dbconn.jsp" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>웹스와 함께하는 언어공부</title>
    <link href="headerStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
    <header id="main_header">
        <%
			if(session.getAttribute("uidx") == null){	// 로그인 안 된 상태
		%>
        <nav id="right_nav">
            <ul>
                <li><a href="login.jsp" >로그인</a></li>
                <li><a href="member.jsp">회원가입</a></li>
            </ul>
        </nav>
		<%
			}else{
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			String query = "select * from `member` where `idx`=" + session.getAttribute("uidx");	
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
		%>
           <nav id="right_nav">
            <ul>
            	<li><font color=white><%=rs.getString("name")%></b>님 환영합니다!</font></li>
                <li><a href="logout.jsp">로그아웃</a></li>
            </ul>
             </nav>
        <%} 
        %>
        
        
        <h1 class="maintext">
            <a href="index.jsp">웹스와 함께하는 언어공부</a>
        </h1>
    </header>

    <!--네비게이션-->
    <div id="alignDiv">
    <nav id="top_nav">
        <div class="divclass">
        <ul>
            <li class="topmenu">
                <a class="menuLink" href="cpp_main.jsp">C++</a>
       
                    <%
					conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
							stmt = conn.createStatement();
							String nquery = "SELECT * FROM cplus";
							rs = stmt.executeQuery(nquery);
							
					while (rs.next()) {
					%>
					<ul class="submenu">
						<li><a class="submenuLink" href="cpp_main.jsp?menu=<%=rs.getInt(1)%>"> <%=rs.getString("menu")%></a></li>
					</ul>
					<%
						}
						// end while
					%>
            </li>
            <li class="leftborder topmenu">
                <a class="menuLink" href="html_main.html" target="bodyFrame">HTML</a>
                <ul class="submenu">
                    <li><a class="submenuLink" href="html1.html" target="mainf">HTML1</a></li>
                    <li><a class="submenuLink" href="html2.html" target="mainf">HTML2</a></li>
                    <li><a class="submenuLink" href="html3.html" target="mainf">HTML3</a></li>
                    <li><a class="submenuLink" href="html4.html" target="mainf">HTML4</a></li>
                </ul>
            </li>
            <li class="leftborder">
                <a class="menuLink" href="java_main.html" target="bodyFrame">JAVA</a>
            </li>
            <li class="leftborder">
                <a class="menuLink" href="jsp_main.html" target="bodyFrame">JSP</a>
            </li>
            <li class="leftborder">
                <a class="menuLink" href="mysql_main.html" target="bodyFrame">MySQL</a>
            </li>
            <li class="leftborder">
                <a class="menuLink" href="list.jsp" target="bodyFrame">Q&A</a>
            </li>
        </ul>     
            </div>
    </nav>
	</div>
</body>
</html>