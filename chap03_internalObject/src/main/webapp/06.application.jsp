<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Application Ex</h1>
	서블릿 컨테이너의 이름과 버전 : <%=application.getServerInfo() %><p/>
	05.1.session.html 파일의 MIME Type : <%=application.getMimeType("05.1.session.html") %><p/>
	웹 어플리케이션의 url경로 : <%=application.getContextPath() %><p/>
	로컬 파일 시스템의 경로 : <%=application.getRealPath("/") %><p/>
	<% application.log("application 내부 객체 로그 텍스트"); %><p/>
	
	<% out.print("출력"); %>
	
	<% pageContext.getOut().print("출력"); %>
	
</body>
</html>