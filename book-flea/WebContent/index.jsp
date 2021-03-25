<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/BOOKFLEA/cust-page/css/styles.css">
</head>
<body>
	<jsp:include page="cust-page/component/nav.jsp" />
	
	<main>	
		<div>
			<p>HERE IS INDEX.JSP!</p>
			<br><a href="/BOOKFLEA/admin-page/main.jsp">admin-page/main.jsp</a>
			
			<br><a href="/BOOKFLEA/admin-page/main.jsp">cust-page/upload.jsp</a>
		</div>
	</main>

	<jsp:include page="cust-page/component/footer.jsp" />

	<script src="/BOOKFLEA/cust-page/js/component/nav.js"></script>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>