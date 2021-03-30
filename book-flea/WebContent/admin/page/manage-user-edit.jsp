<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "s_users.S_UsersDAO" %>
<%@ page import = "s_users.S_UsersDTO" %>
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
			<a href="?sec=user">유저관리</a>&nbsp> 수정
		</div>
			<div class="box box-col">
			<%	
				String userId = (String)(request.getParameter("id"));
				S_UsersDAO DAO = new S_UsersDAO();
				String userName = DAO.getUserInfo(userId).getUserName();
				String userEmail = DAO.getUserInfo(userId).getUserEmail();
				String userGrade = DAO.getUserInfo(userId).getUserGrade();
				
			%>	<form action="/BOOKFLEA/admin/action/user-edit.jsp" class="book-edit-form">			
					<input type='hidden' name='userId' value='<%=userId %>'>
					<ul>
						<li>
							<label>아이디 <small>(수정불가)</small></label>
							<input type="text" value="<%=userId %>" name="userId" disabled>
						</li>
						<li>
							<label>이름</label>
							<input type="text" value="<%=userName %>" name="userName">
						</li>
						<li>
							<label>이메일</label>
							<input type="text" value="<%=userEmail %>" name="userEmail">
						</li>
						<li>
							<label>구분 <small>(수정불가)</small></label>
							<input type="text" value="<%=userGrade %>" name="userGrade" disabled>
						</li>
					</ul>
					<div class="book-edit-form__btns">
						<div class="book-edit-form__btns__left">
							<button type="button" class="btn-white" onclick="location.href='?sec=user'">목록</button>						
							<button type="button" class="btn-white" onclick="location.href='/BOOKFLEA/admin/action/user-delete.jsp?userId=<%=userId %>'" style="margin-left:10px;">삭제</button>
						</div>
						<div class="book-edit-form__btns__right">						
							<button type="submit" class="btn-green">저장</button>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</main>
</body>
</html>