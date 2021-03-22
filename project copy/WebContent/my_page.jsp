<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- fontawesome -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.jssds"></script>
    <!-- javascript     -->
    <script src="#.js" defer></script>
    <title>index.jsp</title>
    <!--Noto Sans KR-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- Css Link -->
    <link rel="stylesheet" href="temp.css">
</head>
<body>
	<%
		if(session.getAttribute("userID")==null)
		{
			response.sendRedirect("/project_copy/login/login.jsp");
		}
	%>
	<div id="header_wrap">
		<jsp:include page="include_page/header.jsp" />
	</div>
	<div id="nav_wrap">
		<jsp:include page="include_page/nav.jsp" />
	</div>
	<div id="content_wrap" style="padding : 20px;">
		<%
		String id = (String) session.getAttribute("userID"); // Object 타입이므로 다운캐스팅
		%>
		<p>ID - <%=id %></p>
		<p>로그인 되었습니다.</p>
		This page is my_page.jsp
	</div>
	<div id="footer_nav">
		<jsp:include page="include_page/footer.jsp" />
	</div>
</body>
</html>