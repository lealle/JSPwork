<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		float f = 4.67f;
		int num =Math.round(f);
		java.util.Date date = new java.util.Date();
		int hour = date.getHours();	
		int i =1;
		int j=3;
	%>
	<%!
		int max(int i, int j){
			return i > j ? i : j;
		}
	
		String ampm(int hour){
			if(hour > 12){
				return "오후";}
			else{
				return "오전";
				}
		}
	%>
	실수 4.67을 정수로 반올림한 값 : <%=num %><br>
	현재 날짜와 시간 <%=date %><br>
	두 수중 큰값 : <%=max(2,5) %><br>
	두 수중 큰값 : <%=max(i,j) %><br>
	지금은 오전/오후 중 <%= ampm(hour) %>입니다
	
</body>
</html>