<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<%@ page import = "java.io.PrintWriter" %>    
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
			<a href="?sec=book">도서관리</a>&nbsp> 수정
		</div>
			<div class="box box-col">
			<%	
				int bookNo = Integer.parseInt(request.getParameter("no"));
				L_BooksDAO DAO = new L_BooksDAO();
				String title = DAO.getBookInfo(bookNo).getTitle();
				String author = DAO.getBookInfo(bookNo).getAuthor();
				String publisher = DAO.getBookInfo(bookNo).getPublisher();
				int price = DAO.getBookInfo(bookNo).getPrice();
			%>	<form action="/BOOKFLEA/admin/action/book-edit.jsp" class="book-edit-form">			
					<input type='hidden' name='bookNo' value='<%=bookNo %>'>
					<ul>
						<li>
							<label>도서명</label>
							<input type="text" value="<%=title %>" name="title">
						</li>
						<li>
							<label>도서저자</label>
							<input type="text" value="<%=author %>" name="author">
						</li>
						<li>
							<label>출판사</label>
							<input type="text" value="<%=publisher %>" name="publisher">
						</li>
						<li>
							<label>도서정가</label>
							<input type="text" value="<%=price %>" name="price">
						</li>
					</ul>
					<div class="book-edit-form__btns">
						<div class="book-edit-form__btns__left">
							<button type="button" class="btn-white" onclick="location.href='?sec=book'">목록</button>						
							<button type="button" class="btn-white" onclick="location.href='/BOOKFLEA/admin/action/book-delete.jsp?bookNo=<%=bookNo %>'" style="margin-left:10px;">삭제</button>
						</div>
						<div class="book-edit-form__btns__right">						
							<button type="submit" class="btn-green">저장</button>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</main>
</body>
</html>