<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* 
request.getParameterNames()
request.getAttributeName()
request.getAttribute()
request.removeAttribute()
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Request Method</h1>
	프로토콜 : <%=request.getProtocol() %><p/>
	서버의 이름 : <%=request.getServerName() %><p/>
	서버의 포트번호 : <%=request.getServerPort() %><p/>
	클라이언트 주소 : <%=request.getRemoteAddr() %><p/>
	클라이언트 이름 : <%=request.getRemoteHost() %><p/>
	<!-- 도메인 이름이 있으면 도메인 이름출력 없으면 서버 주소 출력  -->
	요청 경료(URI) : <%=request.getRequestURI() %><p/>
	요청 경료(URL) : <%=request.getRequestURL() %><p/>
	현재 사용하느 브라우저 : <%=request.getHeader("User-Agent") %><p/>
	파일 type : <%=request.getHeader("Accept") %><p/>
	<!-- 주로 사용하는거 클라이언트 주소  -->
	
</body>
</html>