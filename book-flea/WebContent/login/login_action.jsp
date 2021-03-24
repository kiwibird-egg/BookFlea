<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="users.UsersDTO" %>
    <%@ page import="users.UsersDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String userID = null;
    	String userPW = null;
    	String userPWRE = null;
    	
    	if(request.getParameter("userID") != null){
    		userID = (String)request.getParameter("userID");
    	}
    	if(request.getParameter("userPW") != null){
    		userPW = (String)request.getParameter("userPW");
    	}

    	if(userID == null || userPW == null) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('ID를 입력해주세요.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	
    	UsersDAO userDAO = new UsersDAO();
    	int result = userDAO.login(userID,userPW);
    	if(result ==1){
    		session.setAttribute("userID",userID); //세션설정
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('return 1 로그인 성공');");
    		script.println("location.href='../index.jsp';");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==0){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('return 0 비밀번호틀림');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==-1){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('return -1 아이디 없음');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==-2){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('return -2 오류발생');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>