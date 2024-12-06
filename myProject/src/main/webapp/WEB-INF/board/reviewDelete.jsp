<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.myaws.myapp.domain.*" %>  
    <%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>	    
    
<%
String msg= "";

if (request.getAttribute("msg") != null){
 msg = (String)request.getAttribute("msg");
}
if (msg !=""){
	 out.println("<script>alert('"+msg+"');</script>");	
	 }
%>
    

     
     <%
 BoardVo bv  = (BoardVo)request.getAttribute("bv"); 
 %>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰글삭제하기</title>
<link href="/resources/css/boardStyle.css" rel="stylesheet">

<script>
function DeleteBtn() {
	let fm = document.frm;

	
	if(fm.pwd.value=="") {
		alert("비밀번호란이 공란입니다");
		fm.pwd.focus();
		return;
	}
	
	let ans=confirm("삭제하시겠습니까?");	// 함수의 값을 참과 거짓 true false로 나눈다 
	if(ans==true) {
		fm.action="${pageContext.request.contextPath}/board/reviewDeleteAction.aws";
		fm.method="post";
		fm.submit();
	}
	return;
	}

</script>


</head>
<body>

<header>
	<h2 class="mainTitle">글삭제</h2>
</header>

<form name="frm">
<input type = "text" name = "bidx" value = "${bidx}">
<input type = "text" name = "midx" value = "${midx}">

	<table class = "writeTable">
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		
	</table>
	
	<div class="btnBox">
		<button type="button" class="btn" onclick="DeleteBtn();">삭제</button>
		<a class="btn aBtn" href="#"  onclick="history.back();">취소</a>
	</div>

</form>
	
</body>
</html>