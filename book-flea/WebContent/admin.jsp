<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/BOOKFLEA/admin/css/styles.css">
<style>
	body{
		background-color:#1E1F21;
		color:white;
	}
</style>
</head>
<body>
	
	<jsp:include page='admin/component/nav.jsp' />
	<%
	String sec = request.getParameter("sec");
	if(sec!=null){		
		switch(sec){
		case "book":%> <jsp:include page="./admin/page/manage-book.jsp"/> <% break;
		case "order":%> <jsp:include page="./admin/page/manage-order.jsp"/> <% break;
		case "user":%><jsp:include page="./admin/page/manage-user.jsp"/> <% break;
		case "my":%><jsp:include page="./admin/page/my.jsp"/> <% break;
		default :  break;
		}
	}
	else{
		%><jsp:include page="./admin/page/main.jsp"/><%
	}
	%>
	
	<jsp:include page="admin/component/footer.jsp" />
	<script src="/BOOKFLEA/admin/js/component/nav.js"></script>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>