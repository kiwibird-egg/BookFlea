<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_orders.L_OrdersDAO" %>
<%@ page import = "l_orders.L_OrdersDTO" %>
<%@ page import = "java.io.PrintWriter" %>    
<%	
	if(session.getAttribute("adminId")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='?sec=sign-in'");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<div class="wrap">
		<div class="page-title">
			<a href="?sec=order">주문관리</a>&nbsp>&nbsp<a href="#"> 판매신청 검토</a>
		</div>
			<div class="box box-col" style="padding:10px 0">
			<%	
				int orderNo = Integer.parseInt(request.getParameter("no"));
				L_OrdersDAO DAO = new L_OrdersDAO();
				
				String sellerId = DAO.getUnreviewedInfo(orderNo).getSellerId();
				String bookTitle = DAO.getUnreviewedInfo(orderNo).getBookTitle();
				String bookCondition = DAO.getUnreviewedInfo(orderNo).getBookCondition();
				int price = DAO.getUnreviewedInfo(orderNo).getPrice();
				
				int fullPrice = DAO.getPriceFromOrderNo(orderNo);
				
				int disPer =  (int)((double)price/ (double)fullPrice * 100);
			%>	<form action="/BOOKFLEA/admin/action/order-allow.jsp" class="book-edit-form">			
					<input type='hidden' name='orderNo' value='<%=orderNo %>'>
					<ul>
						<li>
							<label>판매자</label>
							<input type="text" value="<%=sellerId %>" name="title" disabled>
						</li>
						<li>
							<label>도서명</label>
							<input type="text" value="<%=bookTitle %>" name="author" disabled>
						</li>
						<li>
							<label>도서상태</label>
							<input type="text" value="<%=bookCondition %>" name="publisher" disabled>
						</li>
						<li>
							<label>판매가격<small>&nbsp(정가:<%=fullPrice%>원)</small></label>
							<input type="text" value="<%=price%>&nbsp(할인율: <%=disPer %>%)" name="price" disabled>
						</li>
					</ul>
					<div class="book-edit-form__btns">
						<div class="book-edit-form__btns__left">
							<button type="button" class="btn-white" onclick="location.href='?sec=order'">목록</button>						
							<button type="button" class="btn-white" onclick="location.href='/BOOKFLEA/admin/action/order-denied.jsp?orderNo=<%=orderNo %>'" style="margin-left:10px;">반려</button>
						</div>
						<div class="book-edit-form__btns__right">						
							<button type="submit" class="btn-green">승인</button>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</main>
</body>
</html>