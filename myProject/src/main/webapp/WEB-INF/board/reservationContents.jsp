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
  <div class="logo">
    <a href="<%=request.getContextPath() %>/member/mainPage.aws"><img src="../resources/images/cat&dogLogo.png"></a>
  </div>
	<h2 class = "mainTitle">글내용</h2>
</header>

<article class = "detailContents">
	<h2 class = "contentTitle"><%=bv.getSubject() %> 

	</h2>
	
	<p class="write"><%=bv.getWriter() %> (<%=bv.getWriteday() %>)</p>
	<hr>
	<div class="content">
	
	<table>
		
		<tr>
			<td>보호자이름 : <%=bv.getWriter() %></td>
		</tr>
		<tr>
			<td>반려동물이름 : <%=bv.getPetname() %></td>
		</tr>	
		<tr>
			<td>연락처 : <%=bv.getPhone() %></td>
		</tr>
		<tr>
			<td>주소 : <%=bv.getAddr() %></td>
		</tr>
		<tr>
			<td>예약일 : <%=bv.getUseday() %></td>
		</tr>
		<tr>
			<td>서비스 종류 : <%=bv.getServicekind() %></td>
		</tr>
		<tr>	
			<td>아이의 경계도<%=bv.getPetborder() %></td>
		</tr>
		<tr>
			<td>요청사항 : <%=bv.getRequest() %></td>
		</tr>
	</table>
	</div>
	


</article>



<div class="btnBox">
	<a class="btn aBtn" href="<%=request.getContextPath() %>/board/boardReply.aws?bidx=<%=bv.getBidx()%>">답변</a>
	<a class="btn aBtn"	href="<%=request.getContextPath()%>/board/reviewModify.aws?bidx=<%=bv.getBidx()%>">수정</a>	
	<%-- <a class="btn aBtn" href="<%=request.getContextPath() %>/board/boardDelete.aws?bidx=<%=bv.getBidx()%>">삭제</a> --%>
	<a class="btn aBtn" href="<%=request.getContextPath() %>/board/reservationList.aws">목록</a>
</div> 

</body>
</html>