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
A형은 대체로 성실하고 신중한 성격을 가진 것으로 알려져 있습니다. 타인과의 조화를 중시하고, 계획적인 행동을 선호합니다. 
A형은 사회적 책임감을 강하게 느끼며, 팀 내에서 중재자 역할을 자주 맡습니다. 
반면, 스트레스에 민감하고 낯가림이 심한 경향도 있어 새로운 환경에 적응하는 데 시간이 필요합니다. 
A형은 특히 인간관계에서 조심스러운 태도를 보이며, 갈등을 피하려는 성향이 뚜렷합니다.

	</pre>
	



</body>
</html>