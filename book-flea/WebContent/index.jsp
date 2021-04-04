<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-온라인중고도서</title>
<link rel="stylesheet" href="/BOOKFLEA/cust/css/styles.css">
</head>
<%	
String sec = null;
if(request.getParameter("sec")!=null){	
	sec = (String)request.getParameter("sec");	
}
	try{if(sec.equals("sign-in")){%> <style>main{height:1px;}</style><%}}
	catch(Exception e){e.printStackTrace();}
	try{if(sec.equals("sign-up")){%> <style>main{height:1px;}</style><%}}
	catch(Exception e){e.printStackTrace();}

%>
<body>
	<jsp:include page="./cust/component/nav.jsp" />
	
	<main style="display:none">	
		<div>
			<p>인덱스 페이지</p>
			<br><br><a href="/BOOKFLEA/admin/page/main.jsp">admin/page/main.jsp</a>
			
			<br><br><a href="/BOOKFLEA/cust/page/upload.jsp">cust/page/upload.jsp</a>
			<br><br><a href="/BOOKFLEA/cust/page/sign-in.jsp">cust/page/sign-in.jsp</a>
		</div>
	</main>
	<%
	
	if(sec!=null){		
		switch(sec){
		case "book-search":%> <jsp:include page="./cust/page/book-search.jsp"/> <% break;
		case "book-best":%> <jsp:include page="./cust/page/book-best.jsp"/> <% break;
		case "book-all":%><jsp:include page="./cust/page/book-all.jsp"/> <% break;
		case "dibs": if(session.getAttribute("userId")==null){response.sendRedirect("?sec=sign-in");} %><jsp:include page="./cust/page/dibs.jsp"/> <% break;
		case "my": %> <jsp:include page="./cust/page/my.jsp"/> <% break;
		case "sign-in":%><jsp:include page="./cust/page/sign-in.jsp"/> <% break;
		case "sign-up":%><jsp:include page="./cust/page/sign-up.jsp"/> <% break;
		case "book-info":%><jsp:include page="./cust/page/book-info.jsp"/> <% break;
		
		case "buy":%><jsp:include page="./cust/page/book-buy.jsp"/> <% break;
		case "sell":%><jsp:include page="./cust/page/book-sell.jsp"/> <% break;
		default :  break;
		}
	}
	else{
		%><jsp:include page="./cust/page/main.jsp"/><%
	}
	%>

	<jsp:include page="./cust/component/footer.jsp" />

	<script src="/BOOKFLEA/cust/js/component/nav.js"></script>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>