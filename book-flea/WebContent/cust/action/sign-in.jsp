<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="s_users.S_UsersDTO" %>
    <%@ page import="s_users.S_UsersDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String userId = null;
    	String userPw = null;
    	
    	if(request.getParameter("userId") != null){
    		userId = (String)request.getParameter("userId");
    	}
    	if(request.getParameter("userPw") != null){
    		userPw = (String)request.getParameter("userPw");
    	}

    	if(userId == null || userPw == null) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('입력 안된 사항이 있습니다.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	
    	S_UsersDAO DAO = new S_UsersDAO();
    	int result = DAO.login(userId,userPw);
    	if(result ==1){
    		session.setAttribute("userId",userId); //세션설정
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('로그인 성공');");
    		script.println("location.href='/BOOKFLEA/index.jsp';");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==0){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('로그인 실패');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==-1){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('아이디가 없습니다.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==-2){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('DB 에러');");
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