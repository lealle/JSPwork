<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "com.study.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 산술 연산</h3>
	
	기존방식 : 
	<%=
	(int)request.getAttribute("big") + (int)request.getAttribute("small")
	%>
	<br><br>
	
	EL 방식 : <br>
	10 + 3 = ${big + small }<br>
	10 - 3 = ${big - small }<br>
	10 * 3 = ${big * small }<br>
	10 / 3 = ${big / small } 또는 ${big div small }<br>
	10 % 3 = ${big % small } 또는 ${big mod small }<br><br>
	
	<h3>2. 대소 비교 연산</h3>
	10 > 3 = ${big > small } 또는 ${big gt small }<br>
	10 < 3 = ${big < small } 또는 ${big lt small }<br>
	10 >= 3 = ${big >= small } 또는 ${big ge small }<br>
	10 <= 3 = ${big <= small } 또는 ${big le small }<br>

	<h3>3. 동등 비교 연산</h3>
	<!-- el에서는 == 비교는 자바에서는 equals()와 같은 동작을 함  -->
	sOne 과 sTwo는 일치합니까? ${sOne == sTwo} 또는 ${sOne eq sTwo }<br>
	sOne 과 sTwo는 일치하지 않습니까? ${sOne != sTwo} 또는 ${sOne ne sTwo }<br>
	
	big 에 담긴값이 10과 일치합니까? ${ big == 10 } 또는 ${ big eq 10 }<br>
	sThree 에 담긴 값이 '안녕'과 일치합니까? ${sThree =='안녕'} 또는 ${sThree eq '안녕' }<br>

	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 비교</h3>
	pOne이 null 입니까? ${pOne == null } 또는 ${pOne eq null } 또는 ${empty pOne }<br>
	pTwo이 null 입니까? ${pTwo== null } 또는 ${pTwo eq null } 또는 ${empty pTwo}<br>
	pOne이 null이 아닙니까? ${pOne != null } 또는 ${pOne ne null } 또는 ${not empty pOne }<br>

	aOne은 텅비어 있습니까? ${empty aOne } 또는 ${ aOne == null }<br>
	aTwo은 텅비어 있습니까? ${empty aTwo } 또는 ${ aTwo == null }<br>
	<!-- 주소가 들어있기에 null은 아님 비어있는가를 체크할려면 empty 사용해야함  -->

	<h3>5. 논리연산자</h3>
	${ true && true } 또는 ${ true and true }<br>
	${ true || true } 또는 ${ true or true }<br><br>
 	
	big 이 small 보다 크고 aOne은 텅비어있습니까?<br>

	${ (big > small) && (empty aOne) }<br>


	<br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>