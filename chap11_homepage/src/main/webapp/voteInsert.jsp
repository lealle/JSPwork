<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
body {
    width: 1000px;
    margin: 0 auto;
}
	h2, h5 {
		padding 0;
		text-align : center;
	}

	</style>
</head>
<body>
<h2>투표프로그램</h2>
<hr>
<h5>설문작성</h5>
<hr>
<form action="voteInsertProc.jsp" method="post">
	
	<table class="table">
	  <thead>
	    <tr>
	      <th >질문</th>
	      <td colspan="2">q : <input size="70" name="question"></td>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th  rowspan="8">항목</th>
	      <td>1 : <input name="item"></td>
	      <td>2 : <input name="item"></td>
	    </tr>
	    <tr>
	      <td>3 : <input name="item" ></td>
	      <td>4 : <input name="item"></td>
	    </tr>
	    <tr>
	      <td>5 : <input name="item" ></td>
	      <td>6 : <input name="item" ></td>
	    </tr>
	    <tr>
	      <td>7 : <input name="item" ></td>
	      <td>8 : <input name="item" ></td>
	    </tr>
	    <!-- for문으로 돌려도 괜찮음  -->
	    
	    <tr>
	      <td >시작일</td>
	      <td >
	      <select name="sdateY">
			<% 
			for(int i=1; i<=10; i++){
				out.print("<option value='"+(2024+i)+"'>"+(2024+i));
			}
			
			%>
	      </select>년 
	      <select name="sdateM">
			<%
			for(int i=1; i<=12; i++){
				out.print("<option value='" +i+"'>"+i);
					
			}
			
			%>
	      </select>월 
	      <select name="sdateD">
			<%
			for(int i=1; i<=31; i++){
				out.print("<option value='" +i+"'>"+i);
				
			}
			
			%>
	      </select>일 
	      
	    </tr>
	    <tr>
	      <td >종료일</td>
	      <td >      <select name="edateY">
			<% 
			for(int i=1; i<=10; i++){
				out.print("<option value='"+(2024+i)+"'>"+(2024+i));
			}
			
			%>
	      </select>년 
	      <select name="edateM">
			<%
			for(int i=1; i<=12; i++){
				out.print("<option value='" +i+"'>"+i);
					
			}
			
			%>
	      </select>월 
	      <select name="edateD">
			<%
			for(int i=1; i<=31; i++){
				out.print("<option value='" +i+"'>"+i);
				
			}
			
			%>
	      </select>일 </td>
	    </tr>
	    <tr>
	      <td >이중답변</td>
	      <td >
	     
	      <input type="radio" name="type" value="1">YES&emsp;
	      <input type="radio" name="type" value="0">NO
	      
	      </td>
	    </tr>
	    <tr>
	      <td colspan="3" class="cen"><button type="submit">작성하기</button>&emsp;<button type="reset">초기화</button>&emsp;<button type="button" onclick="location.href='voteList.jsp'">리스트보기</button></td>
	    </tr>
	  </tbody>
	</table>
</form>
    

    


</body>
</html>