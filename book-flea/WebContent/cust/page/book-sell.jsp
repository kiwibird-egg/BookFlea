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
request.setCharacterEncoding("UTF-8");
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
		
	L_OrdersDAO DAO2 = new L_OrdersDAO();
	ArrayList<L_OrdersDTO> list2 = DAO2.getOrdersByBook(bookNo);
	
%>
<body>
	<main>
		<div class="page-title">
			<a href="?sec=book-info&no=<%=bookNo%>">도서상세</a>&nbsp>&nbsp도서판매
		</div>
		<div class="box book-box" style="margin-bottom:20px; cursor: default;" >
			<div class="book-box__img">
				<img title="표지를 등록해주세요."src="./book-img/<%=bookNo%>.jpg"/>
			</div>
			<div class="book-box__info book-box__info-sell">
				<div><%=bookTitle %></div>
				<div><%=author%>|<%=publisher%>|정가: <%=price%>원</div>
				<div>재고: <%=stock%></div>
				<div>최저가: <%=lowestPrice%></div>
			</div>
		</div>	
		
		<div class="box box-col" >
			<form action="/BOOKFLEA/cust/action/order-sell.jsp" class="select-buy">
				<input type="hidden" name="no" value="<%=bookNo%>" />
				<select name="condition" id="select-condition" onchange="calcPrice(this)">
					<option value="03004">최상</option>
					<option value="03003">상</option>
					<option value="03002">중</option>
					<option value="03001">하</option>				
				</select>
				<input class="select-buy__price" name="price" type="text" placeholder="판매가격" >
				<button type="submit" class="btn-green">판매</button>
			</form>
		</div>
	</main>
<script>
	const listPrice = <%=price%>;
	
	function calcPrice(e){
		let value = e.value;
		let discount = 0;
		if(value==="03004"){
			discount = 0.7;	
		}else if(value==="03003"){
			discount = 0.6;
		}else if(value==="03002"){
			discount = 0.5;
		}else if(value==="03001"){
			discount = 0.4;
		}else{
			alert("wrong select");
		}
		document.querySelector('.select-buy__price').value = (Math.round(listPrice * discount));
		
	}
	
</script>
</body>
</html>