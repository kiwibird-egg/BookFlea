<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-마이페이지</title>
</head>
		<%
		if(session.getAttribute("userId")==null)
		{
			response.sendRedirect("/BOOKFLEA/index.jsp?sec=sign-in");
		}
		%>
<body>
	<main>	
		<div id="content_wrap" style="padding : 20px;">
			<%
			String id = (String) session.getAttribute("userId"); // Object 타입이므로 다운캐스팅
			%>
			<p>ID - <%=id %></p>
			<p>로그인 되었습니다.</p>
			This page is my.jsp
		</div>
	</main>
</body>
</html>