<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "l_dibs.L_DibsDAO" %>
<%@ page import = "l_dibs.L_DibsDTO" %>  
    <%@ page import="java.io.PrintWriter" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Integer bookNo = null;
	String userId = null;
	if(request.getParameter("no")!=null){
		bookNo = Integer.parseInt((String)request.getParameter("no"));
		userId = (String)session.getAttribute("userId");
	}
	L_DibsDAO DAO = new L_DibsDAO();
	int result = DAO.deleteDibs(userId, bookNo);
	if(result ==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/BOOKFLEA/index.jsp?sec=dibs'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Error: L_DibsDAO.deleteDibs() ');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
<body>

</body>
</html>