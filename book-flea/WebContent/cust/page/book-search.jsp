<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-도서검색</title>
</head>
<body>
<main>	
	<div>
		<div class="page-title">도서검색</div>
	</div>
	
	<div class="box box-col" style="margin-bottom:20px;">
		<form class="form-search">
			<input name="sec" value="book-search-result" type="hidden"/>
			<div class="search-box">
				<select name="column"  style="height:38px;">
					<option value="title">도서명</option>
					<option value="author">지은이</option>
					<option value="publisher">출판사</option>
				</select>
				<input name="text" type="text" placeholder="검색" minlength="1" autofocus required style="height:38px;">
			</div>
			<input type="submit" value="검색" class="btn-green" style="height:38px; width:100px;">
			
		</form>
	</div>

	<div class="box box-col" style="margin-bottom:20px;">
		<span>검색어를 입력해주세요.</span>
	</div>

	
</main>
</body>
</html>