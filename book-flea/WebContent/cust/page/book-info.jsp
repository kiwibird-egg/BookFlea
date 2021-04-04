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
		<div class="page-title">도서상세</div>
		<div class="box book-box" style="margin-bottom:20px; cursor: default;" >
			<div class="book-box__img">
				<img title="표지를 등록해주세요."src="./book-img/<%=bookNo%>.jpg"/>
			</div>
			<div class="book-box__info">
				<div><%=bookTitle %></div>
				<div><%=author%>|<%=publisher%>|정가: <%=price%>원</div>
				<div>재고: <%=stock%></div>
				<div>최저가: <%=lowestPrice%></div>
				<div class="book-box__info__btns">
					<button class="btn-green" onclick="location.href='?sec=sell&no=<%=bookNo%>'">판매</button>
					<button class="btn-white" onclick="location.href='/BOOKFLEA/cust/action/dibs-add.jsp?no=<%=bookNo%>'">찜</button>
				</div>
			</div>
		</div>	
		
		<div class="box box-col orders-box" >
		<ul style="width:100%;">
		<li style="text-align:center; font-weight:600; width:100%; display:flex; padding:10px 20px;">
			<div>판매자</div>
			<div>상태</div>
			<div>가격</div>
			<div>구매</div>
			
		</li>
		<%
		if(list2.size() < 1){
			%>
			<div style="width:100%; text-align:center; padding:30px 10px;">재고없음</div>
			<%
		}
		else{
		for(int i=0; i<list2.size();i++){
			Integer orderNo = list2.get(i).getOrderNo();
			String bookCondition = list2.get(i).getBookCondition();
			String sellerId = list2.get(i).getSellerId();
			Integer orderPrice= list2.get(i).getPrice();
			%>
			<li style="text-align:center;width:100%; display:flex; padding:10px 20px; cursor: pointer;">
				<div><%=sellerId %></div>
				<div><%=bookCondition %></div>
				<div><%=orderPrice %></div>
				<div><button onclick="location.href='/BOOKFLEA/cust/action/order-buy.jsp?orderNo=<%=orderNo %>&sellerId=<%=sellerId %>'" style="height:100%;width:100%;"class="btn-green">구매</button></div>
			</li>
			<%
			}
		}
		%>
		</ul>
		</div>
	</main>
</body>
</html>