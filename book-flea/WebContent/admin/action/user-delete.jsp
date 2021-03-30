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
	String adminId = null;

	if(session.getAttribute("adminId")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='?sec=sign-in'");
		script.println("</script>");
	}else{
		adminId = (String)session.getAttribute("adminId");
	}
%>
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = null;
		if(request.getParameter("userId") != null){
			userId = (String)(request.getParameter("userId"));
			if(userId.equals(adminId)){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('현재 접속중인 계정은 삭제할 수 없습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			}
			else{
				S_UsersDAO DAO = new S_UsersDAO();
				int result = DAO.deleteUserInfo(userId);
				if(result==1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='/BOOKFLEA/admin.jsp?sec=user';");
					script.println("</script>");
					script.close();
				}else if(result==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('S_UsersDAO.deleteUserInfo: ERROR.');");
					script.println("history.back();");
					script.println("</script>");
					script.close();
				}
			}
		}
		
		
		
	%>
</body>
</html>