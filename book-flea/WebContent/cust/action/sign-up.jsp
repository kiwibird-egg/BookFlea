<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="s_users.S_UsersDTO" %>
    <%@ page import="s_users.S_UsersDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String userId = null;
    	String userPw = null;
    	String userPwRe = null;
    	String userName = null;
    	String userEmail = null;
    	
    	if(request.getParameter("id") != null){
    		userId = (String)request.getParameter("id");
    	}
    	if(request.getParameter("pw") != null){
    		userPw = (String)request.getParameter("pw");
    	}
    	if(request.getParameter("pwre") != null){
    		userPwRe = (String)request.getParameter("pwre");
    	}
    	if(request.getParameter("name") != null){
    		userName = (String)request.getParameter("name");
    	}
    	if(request.getParameter("email") != null){
    		userEmail = (String)request.getParameter("email");
    	}
    	
    	if(userId == null || userPw == null || userPwRe==null || userName==null || userEmail==null) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('입력이 안된사항이 있습니댜.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	if ( !(userPwRe.equals(userPw)) ){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('비밀번호가 일치하지 않습니다.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	
    	S_UsersDAO DAO = new S_UsersDAO();
    	int result = DAO.register(userId, userPw, userName, userEmail);
    	if(result ==1){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('회원가입 완료. 로그인이 필요합니다.');");
    		script.println("location.href='/BOOKFLEA/index.jsp?sec=sign-in';");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	else if(result==-1){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('Error has occured! 이미 등록된 아이디 일 수 있습니다.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>