<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_orders.L_OrdersDAO" %>
<%@ page import = "l_orders.L_OrdersDTO" %>
<%@ page import = "java.io.PrintWriter" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	if(session.getAttribute("adminId")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='?sec=sign-in'");
		script.println("</script>");
	}
%>
<% //allowOrder
	
	Integer orderNo = null;
	
	try{		
		if(request.getParameter("orderNo") != null){
			orderNo = Integer.parseInt(request.getParameter("orderNo"));
		}
	}catch(Exception e){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Error: request 'orderNo' is null ');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
	
	L_OrdersDAO DAO = new L_OrdersDAO();
	int result = DAO.allowOrder(orderNo);
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/BOOKFLEA/admin.jsp?sec=order';");
		script.println("</script>");
		script.close();
	}else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('L_OrdersDAO.allowOrder: ERROR.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
%>
</body>
</html>