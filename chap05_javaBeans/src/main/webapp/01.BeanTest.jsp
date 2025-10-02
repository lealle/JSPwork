<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="test" class="beans.BeanTest01"/>
<jsp:setProperty name="test" property="name" value="자바빈 사용"/>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
자바빈즈의 이름 : <jsp:getProperty name="test" property="name"/>




</body>
</html>