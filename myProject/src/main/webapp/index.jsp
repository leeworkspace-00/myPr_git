<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경로페이지</title>
</head>
<body>
	<div>
		<a href="<%=request.getContextPath() %>/member/memberList.aws">회원목록</a>
	</div>

	<div>
		<a href ="<%=request.getContextPath() %>/member/mainPage.aws">메인페이지</a>
	</div>

	<div>
		<a href ="<%=request.getContextPath() %>/email/emailWrite.aws">이메일 보내기</a>
	</div>


</body>
</html>