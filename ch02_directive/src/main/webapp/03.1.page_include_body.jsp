<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.body{
		height: 200px;
		line-height: 200px;	
		background-color: deepskyblue;
	}
	.hf{
		height: 100px;
		line-height: 100px;	
		background-color: coral;
	
	}
	
	
</style>

</head>
<body>
	<%@ include file="03.2.page_include_header.jsp" %>
	
	<div class="body">include 지시자의 Body 부분입니다.</div>
	<%@ include file="03.3.page_include_footer.jsp" %>
	include 지시자의 Body 부분입니다.
</body>
</html>