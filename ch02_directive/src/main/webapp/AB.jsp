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
AB형은 A형과 B형의 성향을 모두 지닌 복합적이고 이중적인 성격으로 분류됩니다. 
이성적이고 논리적인 사고를 하면서도 예술적 감수성과 감정 표현이 섬세한 특징을 가집니다. 
2025년 국내 성인 20~30대 중 AB형 비율은 약 10%로 소수이지만, 독특한 사고방식과 통찰력으로 주목받는 경우가 많습니다. 
단, 타인이 보기엔 종잡을 수 없는 행동으로 비춰질 수 있어 인간관계에서 오해를 사는 경우도 있습니다.

 
	</pre>
	



</body>
</html>