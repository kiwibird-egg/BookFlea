<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="qa.QaDTO" %>
    <%@ page import="qa.QaDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%
    request.setCharacterEncoding("UTF-8");
    		String postID=null;	//미사용
    		int sum;
    		if(request.getParameter("id") != null)
    	postID =  (String)request.getParameter("id");
    	sum = Integer.parseInt(postID);
    		
    		if(postID == null) {
        		PrintWriter script = response.getWriter();
        		script.println("<script>");
        		script.println("alert('게시글ID를 알 수 없습니다.');");
        		script.println("history.back();");
        		script.println("</script>");
        		script.close();
        		return;
        	}
    		
        	QaDAO QaDAO1 = new QaDAO();
        	int result = QaDAO1.deletePost(sum);
        	if(result ==1){
        		PrintWriter script = response.getWriter();
        		script.println("<script>");
        		script.println("alert('글이 삭제되었습니다.');");
        		script.println("location.href='./q&a.jsp';");
        		script.println("</script>");
        		script.close();
        		return;
        	}
        	else if(result==-1){
        		PrintWriter script = response.getWriter();
        		script.println("<script>");
        		script.println("alert('Error has occured!');");
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