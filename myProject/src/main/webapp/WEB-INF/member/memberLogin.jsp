<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String msg = "";
	if(request.getAttribute("msg")!=null) {
		msg = (String)request.getAttribute("msg"); 
	}
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script>
//아이디 비밀번호 유효성 검사
	function check() {
	let memberid = document.getElementsByName("memberid");
	let memberpwd = document.getElementsByName("memberpwd");
	//alert(memberid);
	
	if(memberid[0].value=="") { // 아이디 입력란이 비어있으면
		alert("아이디를 입력해주세요"); // 알림창에 입력해주세요 출력
		memberid[0].focus(); // 다시 아이디 칸에 포커스 주기
		return;
	}else if(memberpwd[0].value=="") { // 비밀번호 입력란이 비어있으면 
		alert("비밀번호를 입력해주세요"); // 알림창에 입력해주세요 출력
		memberpwd[0].focus(); // 비밀번호 칸에 포커스 주기
		return;
		
	}
	
	var fm = document.frm;
	fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.aws"; 
	fm.method = "post";
	fm.submit();

	return;
}
</script>
<link href="../resources/css/loginStyle.css" rel="stylesheet">
</head>
<!-- home 버튼을 오른쪽 최상단에 위치시킴 -->
<button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
<body>
	<section>
		<header>LogIn</header>
		

		<form name = "frm">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="memberid" placeholder="아이디를 입력하세요"></td>
				</tr>	
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="memberpwd" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<tr>
				<td colspan=2 style="text-align:center;">
					<input type="button" name="btn" value="로그인" onclick = "check();">
				</td>
				</tr>
				<tr>
					<td colspan=2 style="text-align:center;">
						
						<input type="button" class="signup-btn" value="회원가입" onclick = "location.href='<%=request.getContextPath() %>/member/memberJoin.aws'">
						<input type="button" class="findpwd-btn" value="비밀번호 찾기" onclick = ""> 
					</td>	
				</tr>
			</table>
		</form>
	</section>

</body>
</html>