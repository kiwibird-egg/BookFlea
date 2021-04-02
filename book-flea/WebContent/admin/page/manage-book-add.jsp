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
			<a href="?sec=book">도서관리</a>&nbsp> 등록
		</div>
			<div class="box box-col">
				<form method="post" enctype="multipart/form-data" action="/BOOKFLEA/admin/action/book-add.jsp" class="book-edit-form">			
					<input type='hidden' name='bookNo'>
					
					<ul>
						<li>
							<label>도서명</label>
							<input type="text" name="title">
						</li>
						<li>
							<label>도서저자</label>
							<input type="text" name="author">
						</li>
						<li>
							<label>출판사</label>
							<input type="text" name="publisher">
						</li>
						<li>
							<label>도서정가</label>
							<input type="text" name="price">
						</li>
					</ul>
					<div class="book-edit-form__btns">
						<div class="book-edit-form__btns__left">
							<button type="button" class="btn-white" onclick="location.href='?sec=book'">취소</button>						
							
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