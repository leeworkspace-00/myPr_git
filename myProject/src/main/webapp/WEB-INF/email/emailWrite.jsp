<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일쓰기</title>
<link href="../resources/css/boardStyle.css" rel="stylesheet">
<script>
	function check()  {
		
		var fm = document.frm;
		
		if(fm.subject.value=="") {
			alert("제목을 입력해주세요")
			fm.subject.focus();
			return;
		}else if(fm.contents.value==""){
			alert("내용을 입력해주세요")
			fm.contents.focus();
			return;
		}else if(fm.senderemail.value=="") {
			alert("보내는 메일주소를 입력해주세요")
			fm.senderemail.focus();
			return;
		}else if(fm.receiveremail.value=="") {
			alert("받는 사람의 메일주소를 입력해주세요")
			fm.receiveremail.focus();
			return;
		}else {
			let ans=confirm("발송하시겠습니까?");	// 함수의 값을 참과 거짓 true false로 나눈다 
			if(ans==true) {
				fm.action="<%=request.getContextPath()%>/email/emailWriteAction.aws";
				fm.method="post";
				fm.submit();
				return;
			}
			
		}
	}	
		
		
	
</script>

</head>
<body>
<button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
<header>
	<h2 class = "mainTitle">이메일쓰기</h2>
</header>

<form name = "frm">

<table class = "writeTable">
<tr>
	<th>제목</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="text" name="subject" value =""></td>
</tr>
<tr>
	<th>내용</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><textarea name="contents" rows="6"></textarea></td>
</tr>
<tr>
	<th>보내는 메일</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="text" name="senderemail"></td>
</tr>
<tr>
	<th>받는 메일</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="text" name="receiveremail"></td>
</tr>


</table>
	<div class = "btnBox">
		<button type="button" class="btn" onclick="check();">저장</button>
		<a class="btn aBtn" onclick="history.back();">취소</a>

	</div>
</form>
</body>
</html>