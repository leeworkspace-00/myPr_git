<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>   
<%@ page import="com.myaws.myapp.domain.*" %>  


 <% 
 BoardVo bv = (BoardVo)request.getAttribute("bv");   //강제형변환  양쪽형을 맞춰준다 
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약글내용</title>
 <link href="../resources/css/boardStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <!-- mvc jquery-CDN주소 추가  -->
<script>



</script>
</head>
<body>
<header>

	<h2 class = "mainTitle">글내용</h2>
</header>

<article class = "detailContents">
	<h2 class = "contentTitle">제목 : <%=bv.getSubject() %></h2>
	
	<p class="write"> 작성자 : <%=bv.getWriter()%>


	<hr>
	<div class="content">
	
	<table>
		
		<tr>
			<td>이름 : <%=bv.getWriter() %></td>
		</tr>
		<tr>
			<td>연락처 : <%=bv.getPhone() %></td>
		</tr>	
		<tr>
			<td>주소: <%=bv.getAddr() %></td>
		</tr>
		<tr>
			<td>면접가능일 : <%=bv.getInterviewday() %></td>
		</tr>
		<tr>
			<td>선호하는 반려동물 : <%=bv.getPerferpet() %></td>
		</tr>
		<tr>
			<td>반려경험 : <%=bv.getExperience() %></td>
		</tr>
		<tr>
			<td>요청사항 : <%=bv.getRequest() %></td>
		</tr>
	</table>
	</div>
	


</article>



<div class="btnBox">
	<a class="btn aBtn" href="<%=request.getContextPath() %>/board/reservationAccept.aws?bidx=<%=bv.getBidx()%>">승인</a>
	<a class="btn aBtn" href="<%=request.getContextPath() %>/board/boardDelete.aws?bidx=<%=bv.getBidx()%>">거절</a>
	<a class="btn aBtn" href="<%=request.getContextPath() %>/board/levelupList.aws">목록</a>
</div> 

</body>
</html>