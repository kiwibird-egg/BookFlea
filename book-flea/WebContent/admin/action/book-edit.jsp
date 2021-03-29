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
<%
	Integer bookNo = null;
	String title = null;
	String author = null;
	String publisher = null;
	Integer price = null;
	
	try{		
		if(request.getParameter("bookNo") != null){
			bookNo = Integer.parseInt(request.getParameter("bookNo"));
		}
		if(request.getParameter("title") != null){
			title = (String)request.getParameter("title");
		}
		if(request.getParameter("author") != null){
			author = (String)request.getParameter("author");
		}
		if(request.getParameter("publisher") != null){
			publisher = (String)request.getParameter("publisher");
		}
		if(request.getParameter("price") != null){
			price = Integer.parseInt(request.getParameter("price"));
		}
	}catch(Exception e){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('형식에 맞춰 입력해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
	
	L_BooksDAO DAO = new L_BooksDAO();
	int result = DAO.updateBookInfo(bookNo, title, author, publisher, price);
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/BOOKFLEA/admin.jsp?sec=book';");
		script.println("</script>");
		script.close();
	}else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('L_BooksDAO.updateBookInfo: ERROR.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
%>
</body>
</html>