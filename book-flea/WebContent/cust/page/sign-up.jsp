<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플리-회원가입</title>
</head>
<body>
	<main>	
		<div class="main__wrap">
			<div class="sign-wrap">
				<div class="sign-box">
					<div class="sign-box__title">Sign Up</div>
					<form action="/BOOKFLEA/cust/action/sign-up.jsp" class="sign-box__form">
						<input type="text" name="id" placeholder="ID" class="sign-text">
						<input type="text" name="email" placeholder="E-mail" class="sign-text">
						<input type="text" name="name" placeholder="Name" class="sign-text">
						<input type="password" name="pw" placeholder="PW" class="sign-text">
						<input type="password" name="pwre" placeholder="PW RE" class="sign-text">
						<button type="submit" class="sign-submit">Sign Up</button>
						<div class="sign-box__under">
							<a href="?sec=sign-in">뒤로가기</a>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</main>
</body>
</html>