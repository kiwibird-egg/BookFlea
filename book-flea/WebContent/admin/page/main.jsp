<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="main-wrap">
			<h2>[&nbspBOOK:FLEA&nbsp]</h2>
			<h2></h2>
			<div class="box" onclick="location.href='?sec=book'">
				도서관리 >
			</div>	
			<div class="box" onclick="location.href='?sec=order'">
				주문관리 >
			</div>	
			<div class="box" onclick="location.href='?sec=user'">
				유저관리 >
			</div>	
			<h2 style="opacity:0%;">[&nbspBOOK:FLEA&nbsp]</h2>
		</div>
	</main>
</body>
</html>