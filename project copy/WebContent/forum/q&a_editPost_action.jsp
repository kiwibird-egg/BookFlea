<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="qa.QaDTO" %>
    <%@ page import="qa.QaDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%
    	request.setCharacterEncoding("UTF-8");
	    int reqPostID=0;
		if(request.getParameter("id") != null){
			reqPostID = Integer.parseInt(request.getParameter("id"));
		}
		if (reqPostID==0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않은글입니다.')");
			script.println("location.href = 'q&a.jsp'");
			script.println("</script>");
		}
		
		int postID=reqPostID;	
		String postSbj=null;
		String postContent=null;
	
		if(request.getParameter("postSbj") != null){
			postSbj =  (String)request.getParameter("postSbj");
		}
		if(request.getParameter("postContent") != null){
			postContent =  (String)request.getParameter("postContent");
		}
		if(postSbj == null || postContent == null) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('입력이 안된사항이 있습니댜.');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
    	}
		
    	QaDAO QaDAO1 = new QaDAO();
    	int result = QaDAO1.editPost( postSbj, postContent,postID);
    	if(result ==1){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('글이 수정되었습니다.');");
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