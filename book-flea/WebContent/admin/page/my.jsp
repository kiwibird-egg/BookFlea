<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "s_users.S_UsersDAO" %>
<%@ page import = "s_users.S_UsersDTO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-마이페이지</title>
</head>
<body>
	<%	
	String userId=null;
	String userName=null;
	String userEmail=null;
	
	if(session.getAttribute("adminId")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='?sec=sign-in'");
		script.println("</script>");
	}
	else{
		S_UsersDAO DAO = new S_UsersDAO();
		userId = (String)session.getAttribute("adminId");
		userName = DAO.getUserInfo(userId).getUserName();
		userEmail = DAO.getUserInfo(userId).getUserEmail();
		
	%>
	<main>	
		<div class="wrap">
			<div class="page-title">나의 정보</div>
			<div class="box box-row" style="padding:20px 0px;">
				<div class="my-info-box__info">
					<span class="my-info-box__info__name">
						<%=userName+"님"%>
					</span>
					<span class="my-info-box__info__id">
						<%="@"+userId %>
					</span>
				</div>
				<div class="my-info-box__btns">
					
					<button class="btn-green my-info-box__btns__sign-out" onclick="location.href='/BOOKFLEA/admin/action/sign-out.jsp'">로그아웃</button>
				</div>
			</div>
			
		</div>
	</main>
	<% } %>
</body>
</html>