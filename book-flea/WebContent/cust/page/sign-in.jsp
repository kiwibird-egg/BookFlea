<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-로그인</title>
</head>
<body>
	<main>	
		<div class="main__wrap">
			<div class="sign-wrap">
				<div class="sign-box">
					<div class="sign-box__title">Sign In</div>
					<form action="/BOOKFLEA/cust/action/sign-in.jsp" class="sign-box__form">
						<input type="text" name="userId" placeholder="ID" class="sign-text">
						<input type="password" name="userPw" placeholder="PW" class="sign-text">
						<button type="submit" class="sign-submit">Sign In</button>
						<div class="sign-box__under">
							<a href="?sec=sign-up">회원가입</a>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</main>
</body>
</html>