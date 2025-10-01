<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Out Ex</h1>
	버퍼사이즈
	<%=out.getBufferSize()%>
	
	<%
		int totalBuffer = out.getBufferSize();
		int remainBuffer = out.getRemaining();
		int useBuffer = totalBuffer - remainBuffer;
	
	%>
	<br>
	버퍼의 총 크기 : <%=totalBuffer  %><p/>
	남은 버퍼 크기 : <%=remainBuffer  %><p/>
	사용한 버퍼 크기 : <%=useBuffer  %><p/>
	
	<!-- 
	쿠키 : 클라이언트가 자신의 정보 가지고 있음
	세션 : 서버에 클라이언트 정보를 가지고 있음 
	세션이 더 보완 좋음 
	 -->
</body>
</html>