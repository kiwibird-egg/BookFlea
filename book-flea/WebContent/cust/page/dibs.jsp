<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_dibs.L_DibsDAO" %>
<%@ page import = "l_dibs.L_DibsDTO" %>
<%@ page import = "java.io.PrintWriter" %>  
<%@ page import = "java.util.ArrayList" %>   

<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<%@ page import = "l_orders.L_OrdersDAO" %>
<%@ page import = "l_orders.L_OrdersDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-북마크</title>
</head>
<%
	String userId = null;
	if(session.getAttribute("userId")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='?sec=sign-in&nav=dibs'");
		script.println("</script>");
	}
	else{
		userId = (String)session.getAttribute("userId");
	}

	L_DibsDAO DAO = new L_DibsDAO();
	
	
		
%>
<body>
	<main>	
		<div>
			<div class="page-title">찜 도서</div>
		</div>
		<%
			ArrayList<L_DibsDTO> list1 = DAO.getBookNo(userId);
			for(int i=0; i<list1.size(); i++){
				int bookNo = list1.get(i).getBookNo();
				L_BooksDAO DAO2 = new L_BooksDAO();
				String bookTitle = DAO2.getBookInfo(bookNo).getTitle();
				String author = DAO2.getBookInfo(bookNo).getAuthor();
				String publisher = DAO2.getBookInfo(bookNo).getPublisher();
				String price = Integer.toString(DAO2.getBookInfo(bookNo).getPrice());
				String lowestPrice = Integer.toString(DAO2.getLowestPrice(bookNo));
					if(lowestPrice.equals("0")){lowestPrice="재고없음";}else{lowestPrice=lowestPrice+"원";}
				String stock = Integer.toString(DAO2.getStock(bookNo));
					if(stock.equals("0")){stock="재고없음";}else{stock=stock+"권";}
					
		%>
		<div class="box book-box" style="margin-bottom:20px; cursor:default">
			<div class="book-box__img" onclick="location.href='?sec=book-info&no=<%=bookNo%>'">
				<img title="표지를 등록해주세요."src="./book-img/<%=bookNo%>.jpg"/>
			</div>
			<div class="book-box__info">
				<div style="cursor:pointer;" onclick="location.href='?sec=book-info&no=<%=bookNo%>'"><%=bookTitle %></div>
				<div><%=author%>|<%=publisher%>|정가: <%=price%>원</div>
				<div>재고: <%=stock%></div>
				<div>최저가: <%=lowestPrice%></div>
				<div class="book-box__info__btns">
					<button onclick="location.href='/BOOKFLEA/cust/action/dibs-del.jsp?no=<%=bookNo%>'" style="width:90%;"class="btn-white">삭제</button>
				</div>
			</div>
		</div>	
		<%
			}
		%>
	</main>
</body>
</html>