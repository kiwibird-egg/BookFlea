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
    	if(request.getParameter("userPWRE") != null){
    		userPWRE = (String)request.getParameter("userPWRE");
    	}
    	if(userID == null || userPW == null || userPWRE == null) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('입력이 안된사항이 있습니댜.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	if ( !(userPWRE.equals(userPW)) ){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('비밀번호 재입력이 잘못되었습니다.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
    	
    	UsersDAO userDAO = new UsersDAO();
    	int result = userDAO.register(userID, userPW);
    	if(result ==1){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('회원가입 되었습니다. 로그인을 해주세요.');");
    		script.println("location.href='./login.jsp';");
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