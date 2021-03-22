<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "qa.QaDAO" %>
<%@ page import = "qa.QaDTO" %>
<%@ page import = "java.util.ArrayList" %>
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
	<div id="header_wrap">
		<jsp:include page="../include_page/header.jsp" />
	</div>
	<div id="nav_wrap">
		<jsp:include page="../include_page/nav.jsp" />
	</div>
	<div id="content_wrap" style="padding : 20px; text-align:center;">
		<p>Q&amp;A</p>
		<div class="list_content">
			<ul class="ul-col">
				<li class="col" >
					<span class="colSbj" style="text-align:center"><b>제목</b></span>
					<span class="colId"><b>글쓴이</b></span>
					<span class="colDate"><b>작성일</b></span>
				</li>
			<% 
				QaDAO qadao = new QaDAO();
				ArrayList<QaDTO> list = qadao.getList();
				for(int i=0; i<list.size(); i++) {	
			%>
				<li class="col">
					<span class="colSbj">
						<a href="q&a_post_view.jsp?id=<%=list.get(i).getPostID()%>">
							<%= list.get(i).getPostSbj() %>
							<% 
								if(list.get(i).getPostAvailable()==0){
								%><small>(삭제됨)</small><%
								}
							%>
						</a>
					</span>
					<span class="colId"><%= list.get(i).getPostWriter() %></span>
					<span class="colDate"><a><%= list.get(i).getPostDate().substring(2,10) %></a></span>
				</li>
			<%
				}
			%>
			</ul>
		</div>
		<div>
			<input class="newPost_btn" type=button value="새글작성" onclick="location.href='/project_copy/forum/q&a_upPost.jsp'">
		</div>
	</div>
	
	<div id="footer_nav">
		<jsp:include page="../include_page/footer.jsp" />
	</div>
</body>
</html>