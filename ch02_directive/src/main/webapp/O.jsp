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
O형은 자신감 있고 사교성이 풍부한 유형으로 분류됩니다. 대체로 긍정적인 에너지를 발산하며, 리더십이 뛰어난 성향을 보입니다. 
팀워크에 강하고 경쟁심도 높아 조직 내에서 중심 역할을 맡는 경우가 많습니다. 
2025년 기업 리더 성향 분석에서도 O형 리더가 차지하는 비율이 약 34%로 높은 편입니다. 
하지만 고집이 세고 충동적으로 행동하는 단점도 있습니다.
	</pre>
	



</body>
</html>