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
		request.setCharacterEncoding("UTF-8");
		Integer bookNo = null;
		if(request.getParameter("bookNo") != null){
			bookNo = Integer.parseInt(request.getParameter("bookNo"));
		}
		
		L_BooksDAO DAO = new L_BooksDAO();
		int result = DAO.deleteBookInfo(bookNo);
		if(result==1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='/BOOKFLEA/admin.jsp?sec=book';");
			script.println("</script>");
			script.close();
		}else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('L_BooksDAO.deleteBookInfo: ERROR.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
	%>
</body>
</html>