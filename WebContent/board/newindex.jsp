<%@ include file = "../config/dbconn.jsp" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>웹스와 함께하는 언어공부</title>
    <link href="newindexStyle.css" type="text/css" rel="stylesheet">
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
            <a href="newindex.jsp">웹스와 함께하는 언어공부</a>
        </h1>
    </header>

    <!--네비게이션-->
    <div class="wrapper">
	    <nav id="top_nav">
	        <div class="divclass">
	    	    <ul>
		            <li class="topmenu">
		                <a class="menuLink" href="newbody.jsp">C++</a>
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
		                <a class="menuLink" href="newlist.jsp">Q&A</a>
		            </li>
		        </ul>     
	        </div>
	    </nav>
	</div>
	<!--콘텐츠-->
    <div id="content">
        <section id="QNA">
        <h1>Q&A</h1>
       	<table>
       	<tr>
			<th id="title"><p>제목</p></th>
		</tr>
		</table>
        </section>

        <section id="gongmo">
            <h1>공모전정보</h1>
            <input id="first" type="radio" name="tab" checked="checked" />
            <input id="second" type="radio" name="tab" />
            <section class="buttons">
                <label for="first">1</label>
                <label for="second">2</label>
            </section>
            <div class="tab_item">
                <img src="http://image.ajunews.com/content/image/2014/06/16/20140616101000996474.jpg" width="250" />
            </div>
            <div class="tab_item">
                <img src="http://imgnews.naver.net/image/215/2014/01/06/A201401060143_1_59_20140106100913.jpg" width="250" />
            </div>
        </section>

        <aside id="chatting">
            <h1>채팅방</h1>
        </aside>
    </div>
</body>
</html>