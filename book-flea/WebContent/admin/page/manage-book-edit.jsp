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
			<%	
				int bookNo = Integer.parseInt(request.getParameter("no"));
				L_BooksDAO DAO = new L_BooksDAO();
				String title = DAO.getBookInfo(bookNo).getTitle();
				String author = DAO.getBookInfo(bookNo).getAuthor();
				String publisher = DAO.getBookInfo(bookNo).getPublisher();
				int price = DAO.getBookInfo(bookNo).getPrice();
			%>	
<body>
	<main>
		<div class="wrap">
		<div class="page-title">
			<a href="?sec=book">도서관리</a>&nbsp> 수정
		</div>
			<div class="box box-col" style="padding: 20px 20px; margin-bottom:30px;">
				<form method="post" enctype="multipart/form-data" action="/BOOKFLEA/admin/action/upload-img.jsp?no=<%=bookNo%>">
					<ul style="display:flex; flex-direction:column;">
						<li style="width:100%; display:flex; justify-content: center;align-items: center;">
							<div style="width:220px; height:300px; border:var(--border); border-radius:5px;">
								<img title="표지를 등록해주세요."src="./book-img/<%=bookNo %>.jpg" style="cursor:pointer; border-radius:5px; height:100%; width:100%; object:cover;"/>
							</div>
						</li>
						<li style="width:100%; flex-direction:column; display:flex; justify-content: center;align-items: center; margin-top:20px;">
						<div style="display:flex; margin-bottom:20px; width:220px;">
							<input type="text" id="fileName" class="file_input_textbox" readonly="readonly" style="width:55%;">
							<div class="file_input_div" >
							    <input type="button" value="파일선택" class="file_input_button" >
							   <input type="file" name="filename1" class="file_input_hidden" onchange="javascript:document.getElementById('fileName').value = this.value.split('\\')[this.value.split('\\').length-1]">
							</div>	
						</div>
						
							<button type="submit" class="btn-green" style="height:38px; width:220px;">이미지 업로드</button>
						</li>
					</ul>
				</form>
			</div>
			<div class="box box-col" style=" margin-bottom:30px;">
			<form action="/BOOKFLEA/admin/action/book-edit.jsp" class="book-edit-form">			
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