<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String name = request.getParameter("name");
	//request로 단 한번만 받을 수 있음 // 버전 업그레이드 되서 이젠 안그럼 다 받을 수 있음 
	// 한번 받으면 이 이상 받을 수 없음

%>

</head>
<body>
	action include 로 포함되는 페이지<p/>
	<%=name %> Fighting!!!
	
</body>
</html>