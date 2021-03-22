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
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.jssds">
    </script>
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
			script.println("location.href = q&a.jsp");
			script.println("</script>");
		}
		QaDAO qadao = new QaDAO(); //.getPost(reqPostID)
		qadao.getPost(reqPostID);
	%>
	<div id="header_wrap">
		<jsp:include page="../include_page/header.jsp" />
	</div>
	<div id="nav_wrap">
		<jsp:include page="../include_page/nav.jsp" />
	</div>
	<div id="content_wrap" style="padding : 20px; text-align:center;">
		<p>Q&amp;A</p>
		
		
			<div class="view_wrap">
				<div class="view_subject_sec">
					<%=qadao.getPost(reqPostID).getPostSbj().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;") %>
				</div>
				<div class="view_info_sec">
					<%=qadao.getPost(reqPostID).getPostWriter() %>
					|
					<%=qadao.getPost(reqPostID).getPostDate() %>
					
				</div>
				<div class="view_content_sec">
					<%=qadao.getPost(reqPostID).getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
				</div>
				<div class="view_footer">
					
					<input class="btn" type="button" value="목록" onClick="location.href='q&a.jsp'">
					<%	
						if(session.getAttribute("userID")!=null){
							if(session.getAttribute("userID").equals((qadao.getPost(reqPostID).getPostWriter())))
							{
							%>	
								<input class="btn" type="button" value="수정" onClick="location.href='q&a_editPost.jsp?id=<%=reqPostID%>'">
								<input class="btn" type="button" value="삭제" onClick="location.href='q&a_deletePost_action.jsp?id=<%=reqPostID%>'">
							<%
							}
						}
					%>
					
				</div>
			</div>
			
			

	</div>
	
	<div id="footer_nav">
		<jsp:include page="../include_page/footer.jsp" />
	</div>
</body>
</html>