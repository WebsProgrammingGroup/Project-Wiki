<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>웹스와 함께하는 언어공부</title>
    <link href="indexStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!--콘텐츠-->
    <div id="content">
        <section id="QNA">
        <h1>Q&A</h1>
       	<table>
       	<tr>
			<th id="title"><p>제목</p></th>
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
			<td><a href="write.jsp?idx=<%=rs.getInt(1)%>&mode=R"> <%=rs.getString(3)%></a></td>
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