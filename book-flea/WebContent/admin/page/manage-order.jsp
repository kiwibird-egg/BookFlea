<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_orders.L_OrdersDAO" %>
<%@ page import = "l_orders.L_OrdersDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>	
		<div class="wrap">
		<!-- ======================================== -->
		<%
		L_OrdersDAO DAO = new L_OrdersDAO();
		ArrayList<L_OrdersDTO> list = DAO.getUnreviewedList();
		%>
			<div class="page-title">
				<a href="#">주문관리</a>&nbsp>&nbsp판매신청 검토
				<%
					if(list.size()!=0){
						%>
						<span style="display:flex; justify-content:center; align-items:center; text-align:center;font-size:12px; color:white; height:16px; width:16px;border-radius:50%; margin:0px 5px; background-color:red; color:white!important;"><a style=><%=list.size() %></a></span>
						<%
					}
				%>
			</div>
			<div class="box box-col" style="padding:10px 0">
			<ul class="unreviewed-list">
				<li class="unreviewed-list__li unreviewed-list__li-title">
					<div>판매자</div>
					<div>도서명</div>
					<!-- <div>도서상태</div> -->
					<div>판매가격</div>
				</li>
			
			<%
			
			for(int i=0; i < list.size(); i++){
				%>
				<li class="unreviewed-list__li" style="cursor:pointer;" onclick="location.href='?sec=order-review&no=<%=list.get(i).getOrderNo() %>'">
					<div><%=list.get(i).getSellerId() %></div>
					<div><%=list.get(i).getBookTitle() %></div>
					<!-- <div><%=list.get(i).getBookCondition() %></div>-->
					<div><%=list.get(i).getPrice() %></div>
				</li>
			<%
			}
			%>
			</ul>
			
			</div>
			<!-- ======================================== -->
			<div class="page-title" style="margin-top:20px;">
				<a href="#">주문관리</a>&nbsp>&nbsp 판매중인 도서
			</div>
			<div class="box box-col" style="padding:10px 0">
				<ul class="unreviewed-list">
				<li class="unreviewed-list__li unreviewed-list__li-title" >
					<div>판매자</div>
					<div>도서명</div>
					<!-- <div>도서상태</div> -->
					<div>판매가격</div>
				</li>
			
				<%
				
				
				ArrayList<L_OrdersDTO> list2 = DAO.getSellingList();
				for(int i=0; i < list2.size(); i++){
					%>
					<li class="unreviewed-list__li" style="cursor:pointer;" onclick="location.href='?sec=order-selling&no=<%=list2.get(i).getOrderNo() %>'">
						<div><%=list2.get(i).getSellerId() %></div>
						<div><%=list2.get(i).getBookTitle() %></div>
						<div><%=list2.get(i).getPrice() %></div>
					</li>
				<%
				}
				%>
				</ul>
			</div>
			<!-- ======================================== -->
			<div class="page-title" style="margin-top:20px;">
				<a href="#">주문관리</a>&nbsp>&nbsp판매완료 도서
			</div>
			<div class="box box-col" style="padding:10px 0">
				<ul class="unreviewed-list">
				<li class="unreviewed-list__li unreviewed-list__li-title">
					<div>판매자</div>
					<div>도서명</div>
					<!-- <div>도서상태</div> -->
					<div>판매가격</div>
				</li>
			
				<%
				
				
				ArrayList<L_OrdersDTO> list3 = DAO.getSoldList();
				for(int i=0; i < list3.size(); i++){
					%>
					<li class="unreviewed-list__li" style="cursor:pointer;" onclick="location.href='?sec=order-sold&no=<%=list3.get(i).getOrderNo() %>'">
						<div><%=list3.get(i).getSellerId() %></div>
						<div><%=list3.get(i).getBookTitle() %></div>
						<div><%=list3.get(i).getPrice() %></div>
					</li>
				<%
				}
				%>
				</ul>
			</div>
			<!-- ======================================== -->
		</div>
	</main>
</body>
</html>