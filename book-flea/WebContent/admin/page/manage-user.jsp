<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "s_users.S_UsersDAO" %>
<%@ page import = "s_users.S_UsersDTO" %>
<%@ page import = "java.util.ArrayList" %>
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
				유저관리
			</div>
			<div class="box box-col">
				<% 
					S_UsersDAO DAO = new S_UsersDAO();
					ArrayList<S_UsersDTO> list = DAO.getUsersList();
					for(int i=0; i<list.size(); i++){
				%>
					<div style="margin:20px;">
						<div><%=list.get(i).getUserId() %></div>
						<div><%=list.get(i).getUserName() %></div>
						<div><%=list.get(i).getUserEmail() %></div>
						<div><%=list.get(i).getUserGrade() %></div>
					</div>
							
				<%
					}
				%>
			</div>
		</div>
	</main>
</body>
</html>