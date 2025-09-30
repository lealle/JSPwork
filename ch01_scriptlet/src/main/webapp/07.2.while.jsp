<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String str = request.getParameter("msg");
	int cnt = Integer.parseInt(request.getParameter("count"));
	// request 로 받은건 모두 String 

%>
</head>
<body>
<!-- 	while문으로 str을 count 만큼 출력 -->
	<%
		while(true){
			out.print(cnt +". "+str+"<br>");
			cnt--;
			if(cnt == 0){
				break;
			}
		}
	
	%>
<%=str %>
	<%=cnt %>
</body>
</html>