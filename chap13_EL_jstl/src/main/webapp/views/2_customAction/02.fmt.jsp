<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.util.*, com.study.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
	숫자 데이터의 포맷(형식) 지정<br>
	- 표현하고자 하는 숫자데이터의 형식을 통화기호, %등 원하는 쓰임에 맞게 형식을 지정하는 태그<br><br>
	(fmt:formatNumber value="출력할 값" [groupingUsed="true|false" type="percent|currency" currencySymbol="통화기호문자"])
	=> groupingUsed : 세자리마다 구분자(,) 표시여부 (기본값 true = 세자리마다 구분자 표시)
	=> type : percent = %로 출력
			  currency = 현재 local 지역의 화폐 표시 여부
	=> currencySymbol = 화폐단위를 넣어 줄 때
	</p>
	
	<c:set var="num1">123456789</c:set>
	<c:set var="num2">0.75</c:set>
	<c:set var="num3">50000</c:set>
			
	num1 그냥 출력 : ${num1 }<br>		
	세자리마다 구분하여 출력 : <fmt:formatNumber value="${num1 }"/><br>
	숫자 그대로 출력 : <fmt:formatNumber value="${num1 }" groupingUsed="false"/><br>

	num2 그냥 출력 : ${num2 }<br>		
	percent : <fmt:formatNumber value="${num2 }" type="percent"/><br>

	num3 그냥 출력 : ${num3 }<br>		
	currency : <fmt:formatNumber value="${num3 }" type="currency"/><br>
	
	currencySymbol $ : <fmt:formatNumber value="${num3 }" type="currency" currencySymbol="$"/><br>
			
</body>
</html>