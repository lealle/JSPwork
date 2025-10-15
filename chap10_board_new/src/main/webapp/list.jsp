<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" import="java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>
<!DOCTYPE html>
<%
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
	
	int curList = listSum - (10*(nowBlock-1)) - 1;
	// DB에서 start 번호까지 10개 가져오기 
	// listSize 현재 읽어온 레코드 수 
	
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
</script>
<link href="style.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list">
		<h2 class="m30">JSPBoard</h2>
		<table class="table m30">
		<tr>
			<td colspan=5 class="right-align">Total : <%=listSum %></td>
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
					+board.get(curList - i).getRegdate()+"</td><td>"
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
						if(blockSize+i == totalPage ){
							break;
						}
					}
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
	
	
	<form name="blockFrm" >
		<input type="hidden" name="nowBlock">
	</form>
	
	
	
	
	
	
	
	
	
</body>
</html>