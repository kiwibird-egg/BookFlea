<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
</head>
<body>
	<jsp:include page="./component/nav.jsp" />
	
	<form method="post" enctype="multipart/form-data" action="imgup.jsp"> 
		<input type="file" name="filename1" size=40> 
		<input type="submit" value="업로드"><br><br> 
	</form> 
	<span>E:\GitHub\BookFlea\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\book-flea\fileFolder</span>
	<script src="../js/component/nav.js"></script>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>