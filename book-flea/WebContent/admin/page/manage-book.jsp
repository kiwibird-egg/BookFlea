<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>	
		<div class="wrap">
			<div class="page-title">
				<a href="?sec=book">도서관리</a>
			</div>
			<div class="box box-col" style="padding:10px 0;">
				
				<ul class="book-list">
					<li class="book-list__li book-list__li-title">
						<div>도서명</div>
						<div>저자</div>
						<div>출판사</div>
						<div>도서정가</div>
					</li>
				<% 
					L_BooksDAO DAO = new L_BooksDAO();
					ArrayList<L_BooksDTO> list = DAO.getList();
					for(int i=0; i<list.size(); i++){
				%>
					<li class="book-list__li" onclick="location.href='?sec=book-edit&no=<%=list.get(i).getBookNo() %>'">
						<div><%=list.get(i).getTitle() %></div>
						<div><%=list.get(i).getAuthor() %></div>
						<div><%=list.get(i).getPublisher() %></div>
						<div><%=list.get(i).getPrice() %></div>
					</li>
					
				<%
					}
				%>
				</ul>
			</div>
				<div class="book-box__bottom">
					<button class="btn-green" onclick="location.href='?sec=book-add'">도서등록</button>
				</div>
		</div>
	</main>
</body>
</html>