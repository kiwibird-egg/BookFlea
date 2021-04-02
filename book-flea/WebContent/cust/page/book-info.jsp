<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Integer bookNo = null;
	if(request.getParameter("no")!=null){
		bookNo = Integer.parseInt((String)request.getParameter("no"));
	}
	L_BooksDAO DAO = new L_BooksDAO();
	String bookTitle = DAO.getBookInfo(bookNo).getTitle();
	String author = DAO.getBookInfo(bookNo).getAuthor();
	String publisher = DAO.getBookInfo(bookNo).getPublisher();
	String price = Integer.toString(DAO.getBookInfo(bookNo).getPrice());
	String lowestPrice = Integer.toString(DAO.getLowestPrice(bookNo));
		if(lowestPrice.equals("0")){lowestPrice="재고없음";}else{lowestPrice=lowestPrice+"원";}
	String stock = Integer.toString(DAO.getStock(bookNo));
		if(stock.equals("0")){stock="재고없음";}else{stock=stock+"권";}
%>
<body>
	<main>
		<div class="page-title">도서상세</div>
		<div class="box book-box" style="margin-bottom:20px;"  onclick="location.href='?sec=book-info&no=<%=bookNo%>'">
			<div class="book-box__img">
				<img title="표지를 등록해주세요."src="./book-img/<%=bookNo%>.jpg"/>
			</div>
			<div class="book-box__info">
				<div><%=bookTitle %></div>
				<div><%=author%>|<%=publisher%>|정가: <%=price%>원</div>
				<div>재고: <%=stock%></div>
				<div>최저가: <%=lowestPrice%></div>
			</div>
		</div>	
		
	</main>
</body>
</html>