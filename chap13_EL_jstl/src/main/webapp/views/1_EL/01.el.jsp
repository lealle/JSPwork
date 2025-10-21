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
	<h3>1. 기존 방식대로 스크립트릿과 표현식을 이용하여 각 scope에 담겨있는 값 출력하기</h3>
	<%
	// requestScope
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
	
	// sessionScope
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
		
	
	%>
	<p>
		학원명 : <%=academy %><br> 
		강의장 : <%=classRoom %> <br>
		강사 : <%=teacher.getName() %>, <%=teacher.getAge() %>, <%=teacher.getGender() %> <br>  
		수강생 정보
		<ul>
			<li>
				이름 : <%=student.getName() %>
			</li>
			<li>
				나이 : <%=student.getAge() %>
			</li>
			<li>
				성별 : <%=student.getGender() %>
			</li>
		</ul>
		
	</p>
	
	<h3>2. EL을 이용하여 보다 쉽게 해당 scope에 담겨있는 값 출력하기</h3>
	<p>
		EL을 이용하여 getXxx를 통해 값을 빼올 필요 없이 EL 구문내에 키값만 제시하면 바로 접근 가능 
		기본적으로 EL은 JSP 내장객체를 구분하지 않고 자동으로 모든 내장객체의 키값을 검색하여 존재하면 값을 가져옴
	</p>
	
	<p>
		학원명 정보 : ${academy }<br>
		강의장 정보 : ${classRoom }<br>
		강사 정보 : ${teacher.name }, ${teacher.age }, ${teacher.gender }<br>
		<!-- .속성 써도 되는이유 내부적으로 getter 메소드 사용하기 때문에 
		따라서 getter 메소드 없을 경우 오류 발생 -->
		수강생 정보
		<ul>
			<li>
				이름 : ${ student.name }
			</li>
			<li>
				나이 : ${ student.age }
			</li>
			<li>
				성별 : ${ student.gender }
			</li>
		</ul>
		
	</p>
	
	<h3>3. EL 사용시 내장 객체의 키값이 동일한 경우 </h3>
	<p>
		scope 값 : ${scope }  - request 값 <br>
		키값이 동일할 경우 작은 스코프 -> 큰 스코프  <br>
		page -> request -> session -> application -> 없다 하면 출력 x <br> 
		<!-- EL은 공유범위가 제일 작은 scope 부터 키를 검색함  
		만일 모든 영역에 키가 없으면 아무것도 출력안됨(오류안남)-->
		test 값 : ${test } - 값 없기에 출력 x <br>
	</p>
	
	<h3>4. 직접 scope를 지정하여 접근하기 </h3>	
	<%
		pageContext.setAttribute("scope","page");
	%>
		scope 값 : ${scope }  - page 값 <br>
		scope 값 : ${ pageScope.scope }  - pageScope 값 가져오기<br>
		scope 값 : ${ requestScope.scope }  - requestScope 값 가져오기<br>
		scope 값 : ${ sessionScope.scope }  - sessionScope 값 가져오기<br>
		scope 값 : ${ applicationScope.scope }  - applicationScope 값 가져오기<br>
		스코프 잘못 명시할 경우 값이 아예 안나올 수 있으므로 주의<br>	
		classRoom(requestScope) : ${sessionScope.classRoom }<br>
	
</body>
</html>