<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form>
				<select name="option">
					<option value="book">도서명</option>
					<option value="author">지은이</option>
					<option value="publisher">출판사</option>
				</select>
				<input type="text" placeholder="검색"/>
				<button type="submit" >검색</button>
			</form>
		</div>
		<div class="box box-col" style="margin-bottom:20px;">
			아직 검색 기능을 지원하지 않습니다.
		</div>
</main>
</body>
</html>