<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="s_users.S_UsersDTO" %>
    <%@ page import="s_users.S_UsersDAO" %>
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
<%
	String userId = null;
	String userName = null;
	String userEmail = null;
	
	try{		
		if(request.getParameter("userId") != null){
			userId = (String)(request.getParameter("userId"));
		}
		if(request.getParameter("userName") != null){
			userName = (String)request.getParameter("userName");
		}
		if(request.getParameter("userEmail") != null){
			userEmail = (String)request.getParameter("userEmail");
		}
	}catch(Exception e){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('형식에 맞춰 입력해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
	S_UsersDAO DAO = new S_UsersDAO();
	int result = DAO.updateUserInfo(userId, userName, userEmail);
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/BOOKFLEA/admin.jsp?sec=user';");
		script.println("</script>");
		script.close();
	}else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('S_UsersDAO.updateUserInfo: ERROR.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
%>
</body>
</html>