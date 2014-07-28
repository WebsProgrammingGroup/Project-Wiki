<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../config/dbconn.jsp" %>


<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <link href="newbodyStyle.css" type="text/css" rel="stylesheet">
        <SCRIPT>
    function submitForm(){
    	var f = document.addcomment;
    		f.submit();
    }
    </SCRIPT>
</head>
<body>
	<!--헤더-->
    <header id="main_header">
        <nav id="right_nav">
            <ul>
                <li><a href="login.jsp">ë¡ê·¸ì¸</a></li>
                <li><a href="member.jsp">íìê°ì</a></li>
            </ul>
        </nav>
        <h1 class="maintext">
            <a href="newindex.html">ì¹ì¤ì í¨ê»íë ì¸ì´ê³µë¶</a>
        </h1>
    </header>

    <!--네비게이션-->
    <div class="wrapper">
	    <nav id="top_nav">
	        <div class="divclass">
	    	    <ul>
		            <li class="topmenu">
		                <a class="menuLink" href="newbody.html">C++</a>
		                <ul class="submenu">
		                    <li><a class="submenuLink" href="#">C++ì´ë?</a></li>
		                    <li><a class="submenuLink" href="#">ë³ì</a></li>
		                    <li><a class="submenuLink" href="#">ìì¶ë ¥í¨ì</a></li>
		                    <li><a class="submenuLink" href="#">ë°ë³µë¬¸</a></li>
		                    <li><a class="submenuLink" href="#">ì¡°ê±´ë¬¸</a></li>
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
		                <a class="menuLink" href="newlist.jsp">Q&A</a>
		            </li>
		        </ul>     
	        </div>
	    </nav>
	</div>
	
	<!--Left 네비게이션-->
    <nav id="left_nav">
        <ul>
            <li><a href="cpp1.html" target="mainf">C++ì´ë?</a></li>
            <li><a href="cpp2.html" target="mainf">ë³ì</a></li>
            <li><a href="cpp3.html" target="mainf">ìì¶ë ¥ í¨ì</a></li>
            <li><a href="cpp4.html" target="mainf">ë°ë³µë¬¸</a></li>
            <li><a href="cpp5.html" target="mainf">ì¡°ê±´ë¬¸</a></li>
        </ul>
    </nav>
	
	<!--컨텐츠 -->
    <div id="contents">
		ê¸ë´ì©
		<a href="modify.html"><input type="button" value="ìì "/></a>
    </div>
    <div id="reply">
    <table>
    	<tr>
			<td id="writer">ìì±ì</td>
			<td id="text">ë´ì©</td>
			<td id="date">ìì±ì¼ì</td>
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
    <input type="text" name="comment" value="ëê¸ë´ì©" id="textbox">
    <input type="button" value="ëê¸ì°ê¸°" onClick="submitForm()" id="writebutton">
    </form>
    </div>
</body>