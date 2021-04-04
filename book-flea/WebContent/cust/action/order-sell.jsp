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
Integer bookNo = null;
String condition = null;
Integer price = null;

//===========================================================
if(request.getParameter("no")!=null){
	bookNo = Integer.parseInt(request.getParameter("no"));
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Parameter:no is null');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}
//===========================================================
if(request.getParameter("condition")!=null){
	condition = (String)request.getParameter("condition");
}
else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Parameter:condition is null');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}
//===========================================================

if(request.getParameter("price")!=null){
	price = Integer.parseInt(request.getParameter("price"));
}
else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Parameter:price is null');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}
//===========================================================

L_OrdersDAO DAO = new L_OrdersDAO();
int result = DAO.sellBook(bookNo, condition, userId, price);
if(result==1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('판매 신청이 완료되었습니다.');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('판매 신청에 실패했습니다.');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}
%>
<body>
<main>
	<div class="box box-col">
		<br>유저아이디<%=userId %>
		<br>책번호<%=bookNo %>
		<br>책상태<%=condition %>
		<br>가격<%=price %>
	</div>
</main>
</body>
</html>