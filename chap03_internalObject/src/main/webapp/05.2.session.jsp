<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	session.setAttribute("idkey",id);
	// 대소문자 상관 있음 세션이기에 3에서 얻어 올 수 있음 
	session.setMaxInactiveInterval(1*60);
	// 기본값 30분
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session Ex</h1>
	<form action="05.3.session.jsp">
		1. 가장 좋아하는 계절은?<p/>
		<input type="radio" name ="season" value="봄">봄&emsp;
		<input type="radio" name ="season" value="여름">여름&emsp;
		<input type="radio" name ="season" value="가을">가을&emsp;
		<input type="radio" name ="season" value="겨울">겨울<br>

		2. 가장 좋아하는 과일은?<p/>
		<input type="radio" name ="fruit" value="사과">사과&emsp;
		<input type="radio" name ="fruit" value="배">배&emsp;
		<input type="radio" name ="fruit" value="포도">포도&emsp;
		<input type="radio" name ="fruit" value="샤인머스캣">샤인머스캣<br>

		<input type="submit" value="입력"> &emsp; <input type="reset">
	</form>
	
</body>
</html>