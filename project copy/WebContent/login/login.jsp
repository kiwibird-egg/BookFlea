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
    <link rel="stylesheet" href="login.css">
</head>
<body>
	<div id="header_wrap">
		<jsp:include page="../include_page/header.jsp" />
	</div>
	<div id="nav_wrap">
		<jsp:include page="../include_page/nav.jsp" />
	</div>
	<div id="main_wrap" style="padding : 20px;">
		<main>
		<div id='wrap'>
	        <form id='frm_login' method="POST">
	            <div id='box' style="display:flex; flex-direction : column;">
	                <p id="txt_title">로그인</p>
	                <input name="userID" id="kbw_login_id" type="text" placeholder="ID">
	                <input name="userPW" id="kbw_login_pw" type="password" placeholder="PW">
	                 <a href="register.jsp" style="font-size: 70%; color : black;'">I don't have an account.</a>
	                <input id="loginBtn" type="submit" value="Login" formaction="./login_action.jsp">
	            </div>
	        </form>
	    </div>
	    </main>
	</div>
	<div id="footer_nav">
		<jsp:include page="../include_page/footer.jsp" />
	</div>
</body>
</html>