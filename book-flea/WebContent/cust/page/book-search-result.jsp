<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import="java.util.ArrayList" %>
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-도서검색</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String column=null;
String text=null;
if(request.getParameter("column")!=null){
	column = request.getParameter("column");
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('No Parameter: column');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
}
if(request.getParameter("text")!=null){
	text = request.getParameter("text");
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('No Parameter: text');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
}
%>

<main>	
	<div>
		<div class="page-title">도서검색</div>
	</div>
	
	<div class="box box-col" style="margin-bottom:20px;">
		<form class="form-search">
				<input name="sec" value="book-search-result" type="hidden"/>
			<div class="search-box">
				<select name="column">
					<option value="title" <%if(column.equals("title")) {%> selected <%}%>>도서명</option>
					<option value="author" <%if(column.equals("author")) {%> selected <%}%>>지은이</option>
					<option value="publisher" <%if(column.equals("publisher")) {%> selected <%}%>>출판사</option>
				</select>
				<input name="text" type="text" placeholder="검색" minlength="1" value="<%=text %>" required>
			</div>
			<input type="submit" class="btn-green" style="height:38px; width:100px;">
		</form>
	</div>
	<%
		L_BooksDAO DAO = new L_BooksDAO();
		ArrayList<L_BooksDTO> list1 = DAO.searchBook(column,text);
		if(list1.size()<1){
	%>
		<div class="box box-col" style="margin-bottom:20px;">
			검색 결과가 없습니다.
		</div>
	<%
	 }
		else{ 
			Integer bookNo = null;
			for(int i=0; i<list1.size(); i++){
				bookNo = list1.get(i).getBookNo();
				Integer stock = DAO.getStock(bookNo);
				Integer lowestPrice = DAO.getLowestPrice(bookNo);
				%><div class="box book-box" style="margin-bottom:20px;"  onclick="location.href='?sec=book-info&no=<%=bookNo %>'">
								<div class="book-box__img">
						<img title="표지를 등록해주세요."src="./book-img/<%=bookNo%>.jpg"/>
					</div>
					<div class="book-box__info">
						<div><%=list1.get(i).getTitle() %></div>
						<div><%=list1.get(i).getAuthor() %>|<%=list1.get(i).getPublisher()%>|정가: <%=list1.get(i).getPrice() %>원</div>
						<div>재고: <%=stock %></div>
						<div>최저가: <%=lowestPrice %></div>
					</div>			
				</div><%
			}
		}
	%>
		

	
</main>
</body>
</html>