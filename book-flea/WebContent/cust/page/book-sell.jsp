<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<%@ page import = "l_orders.L_OrdersDAO" %>
<%@ page import = "l_orders.L_OrdersDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	
	
%>
<body>
	<main>
		<div class="page-title">도서상세</div>
		<div class="box book-box" style="margin-bottom:20px; cursor: default;" >
			
		</div>	
		
		<div class="box box-col orders-box" >
		<ul style="width:100%;">
			<li style="text-align:center; font-weight:600; width:100%; display:flex; padding:10px 20px;">
				<div>판매자</div>
				<div>상태</div>
				<div>가격</div>
				<div>구매</div>
			</li>
		
		</ul>
		</div>
	</main>
</body>
</html>