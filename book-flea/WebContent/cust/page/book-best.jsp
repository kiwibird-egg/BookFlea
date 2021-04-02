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
<title>북플리-베스트셀러</title>
</head>
<body>
	<main>	
		<div>
			<div class="page-title">베스트셀러</div>
			<div class="col">
				<% L_BooksDAO DAO = new L_BooksDAO();
					ArrayList<L_BooksDTO> list1 = DAO.getBestNo();
					for(int i=0; i<list1.size(); i++){
						
						int bookNo = list1.get(i).getBookNo();
						
						String bookTitle = DAO.getBookInfo(bookNo).getTitle();
						String author = DAO.getBookInfo(bookNo).getAuthor();
						String publisher = DAO.getBookInfo(bookNo).getPublisher();
						String lowestPrice = Integer.toString(DAO.getLowestPrice(list1.get(i).getBookNo()));
							if(lowestPrice.equals("0")){lowestPrice="재고없음";}else{lowestPrice=lowestPrice+"원";}
						String stock = Integer.toString(DAO.getStock(list1.get(i).getBookNo()));
							if(stock.equals("0")){stock="재고없음";}else{stock=stock+"권";}
						Integer price = DAO.getBookInfo(bookNo).getPrice();
						 
						
						%>
						<div class="box book-box" style="margin-bottom:20px;" onclick="location.href='?sec=book-info&no=<%=list1.get(i).getBookNo() %>'">
							<div class="book-box__img">
								<img title="표지를 등록해주세요."src="./book-img/<%=list1.get(i).getBookNo() %>.jpg"/>
							</div>
							<div class="book-box__info">
								<div><span style="color:red;">&lt;TOP<%=i+1%>&gt;</span>&nbsp; <%=bookTitle %></div>
								<div><%=author %>|<%=publisher%>|정가: <%=price %>원</div>
								<div>재고: <%=stock %></div>
								<div>최저가: <%=lowestPrice %></div>
							</div>
						</div>	
						<%
					}
						
				%>
			</div>
		</div>
	</main>
</body>
</html>