<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{ text-align: center}
	img {width: 600px}
	table {border:2px solid; width: 600px; border-collapse:collapse;}
	th, td {border: 1px solid}

</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<body>
	<img src="../resources/img/캡처게시판2.PNG">
	<table align="center" id="reply">
		<thead>
			<tr>
				<th>댓글 작성</th>
				<th><textarea rows="3" cols="50" id="replyContent"></textarea>
				<th><input type="button" id="btn" value="댓글 등록"></th>
			</tr>
			<tr>
				<th>댓글</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>	
		</thead>
		
		<tbody>
			
		</tbody>
	
	</table>
	
	
	<script type="text/javascript">
	$(()=>{
		loadReplies();
		setInterval(loadReplies , 1000);
	});
	
	function loadReplies() {
		$.ajax({
			url: "ajaxReply.do",
			data : {bno: "1"},
			success : function(result){
				let result1 = ""
				console.log(result);
				for(let i=0; i<result.length; i++){
					result1 += "<tr><td>";
					result1 += result[i].name + "</td><td>" + result[i].content + "</td><td>" + result[i].redate.substring(0, 10);	// substring - subString X					
					result1 += "</td></tr>";
				}
				$("#reply>tbody").html(result1);
			}
			, error : function(){
				console.log("fail");
			}
		})
	};
	
	
	$("#btn").click(function(){
		var replyContent = $("#replyContent").val(); 
        if (replyContent.trim() == "") {
            alert("댓글 내용을 입력하세요.");
            $("#replyContent").focus();
            return;
        }
        
		$.ajax({
			url: "ajaxInsertReply.do",
			data : {content: replyContent},
			success : function(result){
				alert("댓글 등록 성공");
				// location.reload(); ajax 를 쓴 의미가 없어지므로 아래를 추가
				loadReplies(); // 원래 시작하자 마자 쓰는 함수였지만 함수명 추가하고 변경 ajax 효율 좋게 하기위해 함수로 변경
				$("#replyContent").val("");
				// ajax 를 쓰는 목적에 맞게 설계함 ( gemini 를 보고 약수정)
			}
			, error : function(){
				alert("댓글 등록 실패");
			}
		})
	});
	
	
	
	
	</script>
	
	
</body>
</html>