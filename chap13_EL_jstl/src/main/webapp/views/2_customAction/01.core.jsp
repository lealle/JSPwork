<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.*, com.study.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성 == attribute)</h3>
	<h4>1.1 변수 선언과 초기화</h4>
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="변수명" value="값" [scope=""])
	 - 변수 선언하고 초기값을 대입해주는 기능을 제공
	 - 해당 변수를 어떤 scope에 담아둘것인지 지정 가능함(생략시 기본값 pageScope)
	 	=> 해당 scope에 setAttribute를 통해 key-value 형태로 데이터를 담아놓는 거와 같음
	 	=> c:set으로 선언된 변수는 EL로 접근하여 사용(스크립팅원소로는 접근 불가)  

	 - 변수 타입은 별도로 지정하지 않음 
	 - 초기값은 반드시 지정해야 됨 
	
	</pre>
	
	<c:set var="num1" value="10"/> <!-- ==  pageContext.setAttribute("num1",10) -->
	<c:set var="num2" value="20" scope="request"/>	
	
	num1 변수의 값 : ${ num1 }<br>
	num2 변수의 값 : ${ num2 }<br>
	
	<c:set var="result" value="num1 + num2" scope="session"/>	<!-- String  -->
	result : ${result } <br>
	<c:set var="result" value="${ num1 + num2}" scope="session"/>	
	result : ${result } <br>
	
	pageScope.num1 : ${ pageScope.num1 }<br>
	requestScope.num2 : ${ requestScope.num2 }<br>
	sessionScope.result : ${ sessionScope.result }<br>
	
	<c:set var="result" scope="request">
		9999
	</c:set>
	<!-- scope 가 다르면 덮어쓰기 아닌 따로따로 존재 -->
	
	result : ${ result }<br>
	<!-- 더 작은 request 출력 -->
	
	sessionScope.result : ${ sessionScope.result }<br>
	
	
	<h4>1.2 변수 삭제</h4>
	<pre>
	* 변수 삭제 (c:remove var="제거할 변수명" [scope=""])
		- 해당 scope 영역에서 해당 변수를 찾아서 제거하는 태그 
		- scope 지정 생략시 모든 scope 에서 해당 변수를 다 찾아서 제거함
		=> 즉, 해당 scope에 .removeAttribute를 통해 제거하는 거라고 생각하면 됨 
	</pre>
	
	삭제전 result : ${ result }<br>

	1) 특정 scope 지정하여 삭제 <br>
	<c:remove var="result" scope="request"/>
	requestScope에서 삭제후 result : ${result }<br>
	
	
	2) 모든 scope 에서 삭제	
	<c:remove var="result"/>
	모든 Scope에서 삭제후 result : ${result }<br>
	
	<hr>
	
	<h4>1.3. 변수 출력</h4>
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하고자하는 값" [default="기본값"][escapeXml="true|false"])
		데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	<c:out value="${num1 }"/><br>
	<c:out value="${abcd }" default="없음"/><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>"/>
	
	<!-- escapeXml를 넣지않으면 기본값 true : 태그 해석안됨(문자열로 취급) -->
	<c:out value="${outTest}"/><br>
	<c:out value="${outTest}" escapeXml="false"/><br>
	
	<h3>2. 조건문 - if (c:if test="조건식")</h3>
	
	<c:if test="${num1 gt num2 }">
		<b>num1이 num2보다 크다</b>
	</c:if>
	
	<c:if test="${num1 lt num2 }">
		<b>num1이 num2보다 작다</b>
	</c:if>
	
	<c:if test="${num1 le num2 }">
		<b>num1이 num2보다 작거나 같다</b>
	</c:if>
	<!-- 기존 자바 문법보다 쉽게 작성 가능  -->
	
	<h3>3. 조건문 Choose (c:choose, c:when, c:otherwise)</h3>
	<pre>
	- java 의 if-else, if-else 문과 비슷한 역할을 하는 구문
	- 
	
	</pre>
	<c:choose>
		<c:when test="${num1 gt 20 }">
			<b>20보다 큰 숫자</b>
		</c:when>
		<c:when test="${num1 ge 10 }">
			<b>20보다 작고 10보다 크거나 같은 숫자</b>
		</c:when>
		<c:otherwise>
			<b>10보다 작은 숫자</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문 - forEach </h3>
	<pre>
	for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="증가값"])
	향상된 for loop문 - (c:forEach var="변수명" items="순차적으로 접근하고자 하는 객체(배열|컬렉션)" [varStatus="현재 접근된 요소의 상태값을 보관할 변수명"])
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${i }<br>
	</c:forEach>
	<c:forEach var="i" begin="1" end="6">
		<h${i }>태그안에서도 적용가능</h${i }>		
	</c:forEach>
	
	<c:set var="colors">
		red, yellow, green, pink
	</c:set>
	
	colors 변수값 : ${colors }<br>
	
	<ul>
		<c:forEach var="c" items="${colors}">
			<li style="color: ${c}">${c}</li>
		</c:forEach>
	</ul>	
	
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("이하늘",24,"여자"));
		list.add(new Person("박미향",23,"여자"));
		list.add(new Person("강미남",27,"남자"));
	%>
	
	<c:set var="pList" value="<%=list %>" scope="request" />
	
	<table border="1">
		<thead>
			<tr>
				<th>index번호</th>
				<th>count번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty pList}">
				<tr>
					<td colspan="5">조회된 사람이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="c" items="${pList}" varStatus="status">
					<tr>
						<td>${status.index}</td>			
						<td>${status.count}</td>			
						<td>${c.name }</td>			
						<td>${c.age }</td>			
						<td>${c.gender }</td>			
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>	
	</table>
	
	<hr>
	
	<h3>5. 반복문 forTokens</h3>
	<pre>
	(c:forToken var="변수명" items="분리시키고자하는 문자열" delims="구분자")
	- 구분자를 통하여 분리된 각각의 문자열에 순차적으로 접근하여 반복 수행 
	- java 의 split("구분자") 또는 StringTokenizer 와 비슷한 기능 처리 
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,TV.에어컨/냉장고.세탁기"/>
	
	<ol>
		<c:forTokens var="d" items="${device }" delims=",./">
			<li>${d }</li>
		</c:forTokens>	
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리 스트링 관련 - url, param</h3>
	<pre>
	- url 경로를 생성하고, 쿼리스트링을 정의해 둘  수 있는 태그
	(c:url var="변수명" value="요청할url")
		(c:param name="키" value="값"/) 
		(c:param name="키" value="값"/) 
	(/c:url)
	</pre>
	
	<a href="list.dp?nowPage=1&num=2">기존 방식</a>
	
	<c:url var="u" value="list.do"> 
		<c:param name="nowPage" value="1"/>
		<c:param name="num">2</c:param>
	</c:url>	
	
	<a href="${u }">c:url 이용한 방식</a>
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>