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
<title>북플리-전체도서</title>
</head>
<body>
	<main>	
		<div>
			<div class="page-title">전체도서</div>
		</div>
		
					
				<% 
					L_BooksDAO DAO = new L_BooksDAO();
					ArrayList<L_BooksDTO> list = DAO.getList();
					for(int i=0; i<list.size(); i++){
						String lowestPrice = Integer.toString(DAO.getLowestPrice(list.get(i).getBookNo()));
							if(lowestPrice.equals("0")){lowestPrice="재고없음";}else{lowestPrice=lowestPrice+"원";}
						String stock = Integer.toString(DAO.getStock(list.get(i).getBookNo()));
						if(stock.equals("0")){stock="재고없음";}else{stock=stock+"권";}
				%>
				<div class="box book-box" style="margin-bottom:20px;"  onclick="location.href='?sec=book-info&no=<%=list.get(i).getBookNo() %>'">
					<div class="book-box__img">
						<img title="표지를 등록해주세요."src="./book-img/<%=list.get(i).getBookNo() %>.jpg"/>
					</div>
					<div class="book-box__info">
						<div><%=list.get(i).getTitle() %></div>
						<div><%=list.get(i).getAuthor() %>|<%=list.get(i).getPublisher()%>|정가: <%=list.get(i).getPrice() %>원</div>
						<div>재고: <%=stock %></div>
						<div>최저가: <%=lowestPrice %></div>
					</div>
				</div>	
				<%
					}
				%>
		
	</main>
</body>
</html>