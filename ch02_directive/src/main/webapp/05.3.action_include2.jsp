<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String siteName1 = request.getParameter("siteName");
	String siteTel1 = request.getParameter("siteTel");
// 위치 어디에서 받든지 상관 없음 
// 앞에서 param으로 넘겨진 값 받음 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
	action include 로 포함되는 페이지<p/>
	<%=siteName1%> <p/>
	<%=siteTel1%> <p/>
	
</body>
</html>