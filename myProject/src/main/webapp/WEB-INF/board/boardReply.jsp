<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.myaws.myapp.domain.*" %>  
 <%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>		<!-- jstl을 사용하겠다는 선언 어노테이션으로 -->    
<%
 BoardVo bv  = (BoardVo)request.getAttribute("bv"); 


 %>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글답변</title>
<link href="/resources/css/boardStyle.css" rel="stylesheet">

<script>
	function replyBtn()  {
		
		let fm = document.frm;
		
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
		}else if(fm.pwd.value=="") {
			alert("비밀번호를 입력해주세요")
			fm.pwd.focus();
			return;
		}
		if (fm.midx.value != 112) {
	        alert("관리자만 답변을 작성할 수 있습니다.");
	        return;
	    }
		let ans = confirm("답변을 남기시겠습니까?");
		  
		  if (ans == true) {
			  fm.action="${pageContext.request.contextPath}/board/boardReplyAction.aws";
			  fm.method="post";
			  fm.enctype="multipart/form-data";
			  fm.submit();
		  }	  
		  
		  return;
	}
	
		
	</script>
	</head>
	<body>
	<header>
		<h2 class="mainTitle">글답변</h2>
	</header>

	<form name="frm">
	<input type="hidden" name="bidx" value="${bv.bidx}">
	<input type="hidden" name="originbidx" value="${bv.originbidx}">
	<input type="hidden" name="depth" value="${bv.depth}">
	<input type="hidden" name="level" value="${bv.level}">
	<input type="hidden" name="midx" value="${midx}">
	<input type="hidden" id="boardkind" name="boardkind" value="${bv.boardkind}">



		<table class="writeTable">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value = "답변입니다^^"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents" rows="6"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>첨부파일</th> <!-- 테이블 헤드 표 첫줄들어가는 자리 -->
				<td><input type="file" name="attachfile"></td>
			</tr>
		</table>
		
		<div class="btnBox">
			<button type="button" class="btn" onclick="replyBtn();">저장</button>
			<a class="btn aBtn" href="#" onclick="history.back();">취소</a>
		</div>	
	</form>

	</body>
	</html>