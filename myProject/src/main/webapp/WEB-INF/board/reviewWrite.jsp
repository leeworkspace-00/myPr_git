<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="com.myaws.myapp.domain.*" %>  
        <%
        BoardVo bv = (BoardVo)request.getAttribute("bv");   //강제형변환  양쪽형을 맞춰준다 
        
/*         String memberName = "";
        if (session.getAttribute("memberName") !=null){
       	 memberName = (String)session.getAttribute("memberName");
        } */
        int midx=0;
        if (session.getAttribute("midx") !=null){
       	 midx = Integer.parseInt(session.getAttribute("midx").toString());
        }
   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
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
		}else if(fm.writer.value=="") {
			alert("작성자를을 입력해주세요")
			fm.writer.focus();
			return;
		}else if(fm.star.value=="") {
			alert("별점을 선택해주세요")
			fm.star.focus();
			return;
		}
		
		else if(fm.pwd.value=="") {
			alert("비밀번호를 입력해주세요")
			fm.pwd.focus();
			return;
			}else {
				let ans=confirm("저장하시겠습니까?");	// 함수의 값을 참과 거짓 true false로 나눈다 
				if(ans==true) {
					fm.action="<%=request.getContextPath()%>/board/reviewWriteAction.aws"; 
					fm.method="post";
					fm.enctype="multipart/form-data";		// 문자를 넘길때 어떤 형태로 넘길건지 지정한다
					//multipart = 이미지파일과 같은 여러형태의 파일 타입을 저장하고 업로드하고 다운로드 받을거임
					fm.submit();
					return;
				}
				
			}
		}	
		
	
	
</script>

</head>
<body>

<header>
	<h2 class = "mainTitle">리뷰쓰기</h2>
</header>

<form name = "frm">
<input type="hidden" id="boardkind" name="boardkind" value="R">
<input type="hidden" id="midx" name="midx" value="<%= midx%>">
<table class = "writeTable">
<tr>
	<th>제목</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="text" id = "subject" name="subject"></td>
</tr>
<tr>
	<th>내용</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><textarea id = "contents" name="contents" rows="6"></textarea></td>
</tr>
<tr>
	<th>별점을 선택해주세요</th>
		<td>
			<div class="star">
				<input type="radio" name="star" value="5" id="rate1"><label for="rate1">★</label>
				<input type="radio" name="star" value="4" id="rate2"><label for="rate2">★</label>
				<input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>
				<input type="radio" name="star" value="2" id="rate4"><label for="rate4">★</label>
		        <input type="radio" name="star" value="1" id="rate5"><label for="rate5">★</label>
		    </div>
		</td>
</tr>	
<tr>
	<th>작성자</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="text" name="writer"></td>
</tr>
<tr>
	<th>비밀번호</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="password" name="pwd"></td>
</tr>
<tr>
	<th>첨부파일</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
	<td><input type="file" name="attachfile"></td>
</tr>


</table>

	<div class = "btnBox">
		<button type="button" class="btn" onclick="check();">저장</button>
		<a class="btn aBtn" onclick="history.back();">취소</a>

	</div>
</form>
</body>
</html>