<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" import="java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>
<!DOCTYPE html>
<%
// Paging 기법 DB를 이용한것이 아닌 자바스크립트 및 자바로 처리 
	ArrayList<Board> board = new ArrayList<>();
	String keyWord ="";
	String keyField ="";
	if(request.getParameter("keyWord") !=null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	board = bDao.getListBoard(keyField, keyWord);
	if(request.getParameter("reload")!=null){
		if(request.getParameter("reload").equals("true")){
			keyField ="";
			keyWord ="";
		}
	}
	int listSum = (board.size()); // 총 행(레코드) 수 
	int numPerPage = 10; // 1페이지당 행 수 
	int pagePerBlock =5; // 블록당 페이지수 [1][2][3][4][5]... 이렇게 5개씩 보여주겠다는 이야기
	
	int totalPage = (int)Math.ceil((double)listSum/numPerPage); // 총 페이지 수 
	int totalBlock = (int)Math.ceil((double)totalPage/5); // 총 블록 수 
	
	int nowPage = 1; //현재 해당하는 페이지
	int nowBlock = 1; // 현재 해당하는 블록 
	if(request.getParameter("nowBlock") !=null){
		nowBlock =Integer.parseInt(request.getParameter("nowBlock"));
	}
	int blockSize = (int)Math.ceil((double)nowBlock / 5);
	if(request.getParameter("BlockSize") !=null){
		blockSize =Integer.parseInt(request.getParameter("blockSize"));

	}
	// 현재 있는 블록집합구분 1~5 , 6~10, ...
	int curList = listSum - (10*(nowBlock-1)) - 1;
	// DB에서 start 번호까지 10개 가져오기 
	
%>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function list(){
		// document.listFrm.action = "list.jsp"; // 넣어도 되고 안넣어도 자기것 들어감 (안넣으면 자동으로 내거 호출)
		document.listFrm.submit();
	}
	
	function read(num){
		document.readFrm.num.value = num;
		// document.readFrm.action = "read.jsp"; // script 에서 action 지정 가능 
		document.readFrm.submit();
	}
	
	function set(num){
		document.blockFrm.nowBlock.value = num;
		document.blockFrm.submit();
	}
	
	function setblockSize(num,flag){
		if(num <= document.sizeFrm.totalBlock.value && num > 0){
			document.sizeFrm.blockSize.value = num;			
			document.sizeFrm.nowBlock.value = (num-1)*5+1;
		}else if(flag == 0){
			document.sizeFrm.blockSize.value = num+1;						
			document.sizeFrm.nowBlock.value = (num)*5+1;
		}
		else{
			document.sizeFrm.blockSize.value = num-1;						
			document.sizeFrm.nowBlock.value = (num-2)*5+1;
		}
		
		document.sizeFrm.submit();
		
	}
</script>
<link href="style.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list">
		<h1><%=totalBlock %> / <%=blockSize %></h1>
		<h2 class="m30">JSPBoard</h2>
		<table class="table m30">
		<tr>
			<td colspan=5 class="right-align">Total : <%=listSum %>Articles(<font color="red"><%=nowBlock %>/<%=totalPage %>Pages</font>)</td>

		</tr>
		<tr>
			<th width="12%">번호</th>
			<th width="36%">제목</th>
			<th width="15%">이름</th>
			<th width="25%">날짜</th>
			<th width="12%">조회수</th>		
		</tr>
	<%
		for(int i=0; i<10; i++){
			out.print("<tr><td>");
			out.print(board.get(curList - i).getNum()+"</td><td>");
			%>
			<a href="javascript:read(<%= board.get(curList - i).getNum()%>)">

			<%
				out.print(			
					board.get(curList - i).getSubject()+"</a></td><td>"
					+board.get(curList - i).getName()+"</td><td>"
					+board.get(curList - i).getRegdate().substring(0,10)+"</td><td>"
					+board.get(curList - i).getCount()  );
			out.print("</td></tr>");
			if((curList-i) == 0)
				break;
		}
	
	%>
	<tr>
				<td colspan=5><br/><br/></td>
			</tr>
			<tr>
				<td colspan=3 class="cen">
				<%
					for(int i=5*(blockSize-1); i<5*blockSize; i++){
						%>
						<a href="javascript:set(<%=i+1%>)">[<%=i +1 %>]</a> 
						<%
						if(i+1 == totalPage ){
							break;
						}
					}
				%>
				<!-- 왜 자체 코드로 안하고 DB를 사용하는건지 알겠음 동기화를 시켜줘야하는 과정이 껄끄러움 (위의 식이 존재하더라도 값이 변경될때 그 과정을 한번 더 하지는 않음 ) -->
				<% 
					if(totalPage != 1) {
						if(blockSize > 1) {
				%>
							<a href = "javascript:setblockSize(<%=blockSize-1 %>,0)">prev...</a>&ensp;
				<%			
						} 
						if(totalBlock > blockSize) {
				%>
							<a href = "javascript:setblockSize(<%=blockSize+1%>,1)">...next</a>
				<%		
						}
					} // if(totalPage != 1) end
				%>
				</td>
				<td colspan=2 class="right-align">
					<a href = "write.jsp">[글쓰기]</a>&emsp;
					<a href = "javascript:list();">[처음으로]</a>&emsp;
				</td>
			</tr>
	</table>
	
	<form action="list.jsp" name="searchFrm" >
		<select name="keyField">
			<option value="name">이름</option>
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
		<input name="keyWord" required>
		<input type="submit" value="찾기">
	
	</form>
	</div>
	
	<!-- 처음으로 누르면 화면 reload -->
	<form name="listFrm">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	
	<!-- 제목을 누르면 상세보기 페이지로 가기 -->
	<form name="readFrm" action="read.jsp">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
	
	
	<form name="blockFrm" action = "list.jsp">
		<input type="hidden" name="nowBlock">
		<%
			if(!(keyWord == null || keyWord.equals(""))){
		%>
				<input type="hidden" name="keyField" value="<%=keyField %>">
				<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
			}
		%>
	</form>
	
	<form name="sizeFrm">
		<input type="hidden" name="blockSize">
		<input type="hidden" name="nowBlock">
		<input type="hidden" name="totalBlock" value="<%=totalBlock%>">
		<%
			if(!(keyWord == null || keyWord.equals(""))){
		%>
				<input type="hidden" name="keyField" value="<%=keyField %>">
				<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
			}
		%>
	</form>
	
	
	
	
	
</body>
</html>