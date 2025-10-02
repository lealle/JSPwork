<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		if(id!=null){
			%>
			
			
	<%=id %>님 반갑습니다.<p/>			
	<a href="05.logout.jsp">로그아웃</a>
			
			<% 
		}else{
			%>
			
	<h1>Login Servlet</h1>
	<form action="LoginServlet" method="post">
	ID : <input name="id"><p/>
	PW : <input type="password" name="pw"><p/>
	<input type="submit" value="회원가입">
	</form>
			
		<%
			 
		}
		%>
	
	
	
	
	
	
	
</body>
</html>