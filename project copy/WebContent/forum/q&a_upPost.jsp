<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		if(session.getAttribute("userID")==null)
		{
			response.sendRedirect("/project_copy/login/login.jsp");
		}
	%>
	<div id="header_wrap">
		<jsp:include page="../include_page/header.jsp" />
	</div>
	<div id="nav_wrap">
		<jsp:include page="../include_page/nav.jsp" />
	</div>
	<div id="content_wrap" style="padding : 20px; text-align:center;">
		<p>Q&amp;A 새 글 작성중</p>
		
		<form action="q&a_upPost_action.jsp">
			<div class="editor_wrap">
				<div class="subject_sec">
					<textarea name="postSbj" class="postSbj_text"  placeholder="제목" rows=1 ></textarea>
				</div>
				<div class="content_sec">
					<textarea name="postContent" class="postContent_text" placeholder="내용" rows=12></textarea>
				</div>
			</div>
			
			<div>
				<input class="upPost_btn" type=submit value="등록">
			</div>
		</form>
	</div>
	
	<div id="footer_nav">
		<jsp:include page="../include_page/footer.jsp" />
	</div>
</body>
</html>