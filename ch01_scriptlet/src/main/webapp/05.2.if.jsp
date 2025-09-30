<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg;
	
	switch(color){
	case "blue":
		msg="파란색";
		break;
	case "red":
		msg="빨간색";
		break;
	case "green":
		msg="초록색";
		break;
	default:
		msg="기타";
		color ="aqua";	
	}
	
	
	
	
	/* 
	if(color.equals("blue")){
		msg = "파란색";
	}
	else if(color.equals("red")){
		msg = "빨간색";
	}
	else if(color.equals("green")){
		msg = "초록색";
	} else{
		msg = "기타";
		color = "aqua";
	} */

%>


</head>
<body bgcolor="<%=color %>">
	jsp 페이지 입니다<br>
	<b><%=name %>님이 좋아하는 색상은 </b>
<b>	<%=color %>입니다.<br></b>
	
</body>
</html>