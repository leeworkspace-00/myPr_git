<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="com.myaws.myapp.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl을 사용하겠다는 선언 어노테이션으로 -->
<%
BoardVo bv = (BoardVo) request.getAttribute("bv"); //강제형변환  양쪽형을 맞춰준다
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글내용</title>
<link href="../resources/css/boardStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- mvc jquery-CDN주소 추가  -->
<script>
function checkImageType (fileName) {
	var  pattern = /jpg$|gif$|png$|jpeg$/i; // 자바스크립트 정규 표현식 이런 파일들을 취급하겠다는 의미

	return fileName.match(pattern);
}

function getOriginalFileName(fileName){				// 실제 원본 파일 이름 추출하는 메서드
	
	var idx = fileName.lastIndexOf("_")+1;	// 언더바로 자른 마지막 순서 +1 해줘서 언더바 다음에 오는 문자들을 가져오겠다(그 문자가 파일 원본이름이기때문)
	
	return fileName.substr(idx);
	
}
function getImageLink(fileName) {		// 이미지 링크 가져오는 메서드
	var front = fileName.substr(0,12);
	var end = fileName.substr(14); 		//13번(s-) 빼고 전체 다가져와 붙여서 리턴할거임
	
	return front+end;
}


function download_() {
	//주소 사이에 s- 빼고 전체 파일이름추출 > 썸네일 파일아닌 원본파일 저장하고 올리기위함
	
	
	var downloadImage = getImageLink("${bv.filename}");		
		alert(downloadImage);
	var downloadLink =  "${pageContext.request.contextPath}/board/displayFile.aws?fileName="+downloadImage+"&down=1";
		alert(downloadLink);
	
	

	return downloadLink;
}
$(document).ready(function(){
	//  시작하자마자 동작해야함 페이지 들어오자마자 댓글 있는거 보여줘야함

$("#dUrl").html(getOriginalFileName("${bv.filename}"));	
	// 실제 파일이름 보여주는 j쿼리
	
$("#dUrl").click(function(){	
$("#dUrl").attr("href",download_());
return;

});
</script>
</head>
<body>

<header>
<h2 class = "mainTitle">글내용</h2>
</header>


	<article class="detailContents">
		<h2 class="contentTitle"> 제목 : <%=bv.getSubject()%>

		</h2>

		<p class="write"> 작성자 : <%=bv.getWriter()%>
			<p>작성일 : (<%=bv.getWriteday()%>)</p>
		</p>
		<hr>
		<div class="content">

			<table>
				<tr>
					<th>제목</th>
					<!-- 테이블 헤드 표 첫줄들어가는 자리 -->
					<td><%=bv.getSubject()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<!-- 테이블 헤드 표 첫줄들어가는 자리 -->
					<td><%=bv.getWriter()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<!-- 테이블 헤드 표 첫줄들어가는 자리 -->
					<td><%=bv.getContents()%></td>
				</tr>
			<tr>
			<th>첨부파일</th>
			<td>
	<c:if test="${!empty bv.filename}">
		<img id = "dUrl" src="${pageContext.request.contextPath}/board/displayFile.aws?fileName=${bv.filename}">		<!-- 컨트롤러에서 displayFile  설정해주기   -->
	</c:if>
	</td>
</tr>

				<!-- <tr>
	<th>첨부파일</th> 테이블 헤드 표 첫줄들어가는 자리
	<td><input type="file" name="filename"></td>
</tr> -->
			</table>
		</div>
		

<%-- 		

		<c:if test="${!empty bv.filename}">
			<img
				src="${pageContext.request.contextPath}/board/displayFile.aws?fileName=${bv.filename}">
			<!-- 컨트롤러에서 displayFile  설정해주기   -->
			<p>
				<a id="dUrl" href="#" class="fileDown">첨부파일 다운로드</a>
			</p>
		</c:if>




 --%>
	</article>



	<div class="btnBox">
		<a class="btn aBtn"	href="<%=request.getContextPath()%>/board/boardReply.aws?bidx=<%=bv.getBidx()%>">답변</a>
		<a class="btn aBtn"	href="<%=request.getContextPath()%>/board/boardDelete.aws?bidx=<%=bv.getBidx()%>">삭제</a>
		<a class="btn aBtn"	href="<%=request.getContextPath()%>/board/reviewModify.aws?bidx=<%=bv.getBidx()%>">수정</a>	
		<a class="btn aBtn" href="<%=request.getContextPath()%>/board/askList.aws">목록</a>
	</div>

</body>
</html>