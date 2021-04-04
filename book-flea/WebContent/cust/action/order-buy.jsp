<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="l_orders.L_OrdersDTO" %>
<%@ page import="l_orders.L_OrdersDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String userId = null;

if(session.getAttribute("userId")!=null){
	userId = (String)session.getAttribute("userId");
}
else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href ='/BOOKFLEA/index.jsp?sec=sign-in'");
	script.println("</script>");
	script.close();
}

//===========================================================
request.setCharacterEncoding("UTF-8");
Integer orderNo = null;
String sellerId = null;
//===========================================================

if(request.getParameter("sellerId")!=null){
	sellerId = (String)request.getParameter("sellerId");
	if(userId.equals(sellerId)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('본인 도서는 구매할 수 없습니다.');");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Parameter:orderNo is null');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
}

if(request.getParameter("orderNo")!=null){
	orderNo = Integer.parseInt(request.getParameter("orderNo"));
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Parameter:orderNo is null');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
}


L_OrdersDAO DAO = new L_OrdersDAO();
int result = DAO.buyBook(userId, orderNo);
if(result==1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('구매 완료되었습니다.');");
	script.println("location.href='/BOOKFLEA/index.jsp?sec=buy'");
	script.println("</script>");
	script.close();
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('구매 실패했습니다.');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}
%>
<body>

</body>
</html>