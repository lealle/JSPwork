<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>* EL(Expression Launguage)</h1>
	<p>
		기존에 사용했던 표현식(출력식) &lt;%=변수명 %&gt;;<br>
		jsp상에서 표현하고자 하는 값을 \$(변수명)의 형식으로 표현하여 작성하기
	
	</p>
	
	<h3><a href="el.do">01_EL 구문</a></h3>
	<!-- 
	com.study.controller -> servlet 파일들 
	com.study.dto -> bean 
	-->
	<h3><a href="operation.do">02_EL의 연산자</a></h3>
	<hr>
	<!-- 
		* jsp를 이루는 구성인자
		1. 스크립팅 원소 : jsp 페이지에서 자바코드를 직접 기술할 수 있게 하는 기능 
						ex) 스크립트릿, 표현식, 등등 ... 
						
		2. 지시어 : jsp 페이지 정보에 대한 내용을 표현하다거나 또 다른 페이지를 포함시킬 떼 사용
					jsp 기능을 확장시키는 라이브러리 등록 할 때도 사용 
					ex) include, page, taglib 지시어 

		3. 액션태그 (표준액션태그, 커스텀액션태그) : jsp 페이지에서 어떤 동작을 하도록 지시하는 태그 
											xml 기술을 이용하여 기존의 jsp문법을 확장하는 기술을 제공하는 태그

			>> 표준액션태그(Standard Action Tag) : jsp 페이지에서 바로 사용가능
												모든 태그명 앞에 jsp: 접두어 붙음  

			>> 커스텀액션태그(Custom Action Tag) : jsp 페이지에서 바로 사용 불가 (별도의 라이브러리 필요)
												모든 태그명 앞에 jsp: 접두어 외의 다른 접두어 붙음(종류가 다양)
												가장 대표적인 유용한 라이브러리 == JSTL  
		
	 -->
	<h1>JSP Action Tag</h1>
	<p>xml 기술을 이용하여 기존의 jsp 문법을 확장시키는 기술을 제공하는 태그들 </p>
	
	<h3>* 커스텀 액션 태그 </h3>
	<h3><a href="views/2_customAction/jstl.jsp">JSTL</a></h3>









</body>
</html>