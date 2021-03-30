<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "s_users.S_UsersDAO" %>
<%@ page import = "s_users.S_UsersDTO" %>
<%@ page import = "java.util.ArrayList" %>
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
	<main>	
		<div class="wrap">
			<div class="page-title">
				<a href="#">유저관리</a>
			</div>
			<div class="box box-col">
				<ul class="user-list">
					<li class="user-list__li user-list__li-title">
						<div>아이디</div>
						<div>이름</div>
						<div>이메일</div>
						<div>구분</div>
					</li>
				<% 
					S_UsersDAO DAO = new S_UsersDAO();
					ArrayList<S_UsersDTO> list = DAO.getUsersList();
					for(int i=0; i<list.size(); i++){
				%>
					<li  class="user-list__li" onclick="location.href='?sec=user-edit&id=<%=list.get(i).getUserId() %>'">
						<div><%=list.get(i).getUserId() %></div>
						<div><%=list.get(i).getUserName() %></div>
						<div><%=list.get(i).getUserEmail() %></div>
						<div><%=list.get(i).getUserGrade() %></div>
					</li>
							
				<%
					}
				%>
				</ul>
			</div>
				
			</div>
		
	</main>
</body>
</html>