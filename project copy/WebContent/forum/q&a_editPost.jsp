<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "qa.QaDAO" %>
<%@ page import = "qa.QaDTO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- fontawesome -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.jssds"></script>
    <!-- javascript     -->
    <script src="#.js" defer></script>
    <title>index.jsp</title>
    <!--Noto Sans KR-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- Css Link -->
    <link rel="stylesheet" href="q&a.css">
</head>
<body>
	<%
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
		QaDAO qadao = new QaDAO(); //.getPost(reqPostID)
		qadao.getPost(reqPostID);
	
		if(!(session.getAttribute("userID").equals(qadao.getPost(reqPostID).getPostWriter()))){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('본인 글만 수정할 수 있습니다.')");
			script.println("location.href ='q&a.jsp'");
			script.println("</script>");
		}
	%>
	<div id="header_wrap">
		<jsp:include page="../include_page/header.jsp" />
	</div>
	<div id="nav_wrap">
		<jsp:include page="../include_page/nav.jsp" />
	</div>
	<div id="content_wrap" style="padding : 20px; text-align:center;">
		<p>Q&amp;A 글 수정중</p>
		
		<form action="q&a_editPost_action.jsp">
			<div class="editor_wrap">
				<div class="subject_sec">
					<textarea name="postSbj" class="postSbj_text"  placeholder="제목" rows=1 ><%=qadao.getPost(reqPostID).getPostSbj() %></textarea>
				</div>
				<div class="content_sec">
					<textarea name="postContent" class="postContent_text" placeholder="내용" rows=12><%=qadao.getPost(reqPostID).getPostContent() %></textarea>
				</div>
				<textarea name=id style="display:none;"><%=reqPostID%></textarea>
			</div>
			
			<div>
				<input class="btn" type=submit value="수정완료">
			</div>
		</form>
	</div>
	
	<div id="footer_nav">
		<jsp:include page="../include_page/footer.jsp" />
	</div>
</body>
</html>