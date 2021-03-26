<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>북플리-회원가입</title>
<link rel="stylesheet" href="/BOOKFLEA/cust/css/styles.css">
</head>
<body>
	<jsp:include page="../component/nav.jsp" />
	
	<main>	
		<div class="main__wrap">
			<div class="sign-wrap">
				<div class="sign-box">
					<div class="sign-box__title">Sign Up</div>
					<form  class="sign-box__form">
						<input type="text" name="id" placeholder="ID" class="sign-text">
						<input type="text" name="name" placeholder="Name" class="sign-text">
						<input type="text" name="pw" placeholder="PW" class="sign-text">
						<input type="text" name="pwre" placeholder="PW RE" class="sign-text">
						<button type="submit" class="sign-submit">Sign Up</button>
						<div class="sign-box__under">
							<a href="/BOOKFLEA/cust/page/sign-in.jsp">뒤로가기</a>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</main>

	<jsp:include page="../component/footer.jsp" />

	<script src="/BOOKFLEA/cust/js/component/nav.js"></script>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>