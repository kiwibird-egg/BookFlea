<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-관리페이지</title>
<link rel="stylesheet" href="/BOOKFLEA/admin/css/styles.css">
<style>
	body{
		background-color:#1E1F21;
		color:white;
	}
</style>
<%	

String sec = null;
if(request.getParameter("sec")!=null){	
	sec = (String)request.getParameter("sec");
}
try{if(sec==null){%> <style>main{height:1px;}</style><%}}
catch(Exception e){e.printStackTrace();}

try{if(sec.equals("sign-in")){%> <style>main{height:1px;}</style><%}}
catch(Exception e){e.printStackTrace();}



%>

</head>
<body>
	
	<jsp:include page='admin/component/nav.jsp' />
	<%
	
	if(sec!=null){		
		switch(sec){
		case "book":%> <jsp:include page="./admin/page/manage-book.jsp"/> <% break;
		case "order":%> <jsp:include page="./admin/page/manage-order.jsp"/> <% break;
		case "order-review":%> <jsp:include page="./admin/page/manage-order-review.jsp"/> <% break;
		case "order-selling":%> <jsp:include page="./admin/page/manage-order-selling.jsp"/> <% break;
		case "order-sold":%> <jsp:include page="./admin/page/manage-order-sold.jsp"/> <% break;
		case "user":%><jsp:include page="./admin/page/manage-user.jsp"/> <% break;
		case "user-edit":%> <jsp:include page="./admin/page/manage-user-edit.jsp"/> <% break;
		case "my":%><jsp:include page="./admin/page/my.jsp"/> <% break;
		case "sign-in":%><jsp:include page="./admin/page/sign-in.jsp"/> <% break;
		case "book-edit":%> <jsp:include page="./admin/page/manage-book-edit.jsp"/> <% break;
		case "book-add":%> <jsp:include page="./admin/page/manage-book-add.jsp"/> <% break;
		
		
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