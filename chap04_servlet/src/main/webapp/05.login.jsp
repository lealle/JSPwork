<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String idkey = (String)session.getAttribute("idkey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Login Servlet</h1>
	<form action="LoginServlet" method="post">
	
	<%
		if(idkey!=null){
			%>
			
			
	<%=idkey %>님 반갑습니다.<p/>			
	<a href="05.logout.jsp">로그아웃</a>
			하이용
			<% 
		}else{
			%>
			
	ID : <input name="id"><p/>
	PW : <input type="password" name="pw"><p/>
	<input type="submit" value="회원가입">
			
		<%
			 
		}
		%>
	</form>
	
	
	
	
	
	
	
</body>
</html>