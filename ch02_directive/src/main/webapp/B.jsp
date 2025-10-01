<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%=name %></b>님의 혈액형은 <b><%=bloodType %></b>입니다.<br> 
	
	<pre>
B형은 일반적으로 자유분방하고 창의적인 성향이 강한 편입니다. 
새로운 것을 좋아하고, 규칙이나 틀에 얽매이기보다는 자신의 방식대로 움직이는 것을 선호합니다. 
2025년 직장 내 세대 차이 이슈에서 B형 특유의 독립성과 유연성이 긍정적으로 평가되기도 합니다. 
하지만 때로는 이기적이라는 오해를 받기도 하며, 감정 기복이 있는 편이라는 평도 존재합니다.
	</pre>
	



</body>
</html>