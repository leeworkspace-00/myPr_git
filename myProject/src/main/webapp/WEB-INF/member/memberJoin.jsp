<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <!-- mvc jquery-CDN주소 추가  -->
<script>

const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;


function join(){ 
	alert("test");
	
	//유효성 검사하기	
	var fm = document.frm;	
	
	if (fm.memberid.value ==""){
		alert("아이디를 입력해주세요");
		fm.memberid.focus();
		return;
	}else if (fm.memberpwd.value ==""){		
		alert("비밀번호를 입력해주세요");
		fm.memberpwd.focus();
		return;
	}else if (fm.memberpwd2.value ==""){
		alert("비밀번호확인을 해주세요");
		fm.memberpwd2.focus();
		return;
	}else if (fm.memberpwd.value != fm.memberpwd2.value){
		alert("비밀번호가 일치하지 않습니다.");
		fm.memberpwd2.value="";
		fm.memberpwd2.focus();
		return;
	}else if (fm.membername.value ==""){
		alert("이름을 입력해주세요");
		fm.membername.focus();
		return;
	}else if (fm.memberemail.value ==""){
		alert("이메일을 입력해주세요");
		fm.memberemail.focus();
		return;
	}else if (email.test(fm.memberemail.value)== false){
		alert("이메일 형식이 올바르지 않습니다.");
		fm.memberemail.value="";
		fm.memberemail.focus();
		return;
	}else if (fm.btn.value=="N"){
		alert("아이디중복체크를 해주세요");
		fm.memberid.focus();
	
	}

		
	var ans = confirm("저장하시겠습니까?");
	
	if (ans == true){						
		fm.action="<%=request.getContextPath()%>/member/memberJoinAction.aws"; 
		fm.method="post"; 
		fm.submit(); // submit 제출버튼 폼을 서버로 전송한다
	}
	return;
}
$(document).ready(function(){
	
	$("#btn").click(function(){
		//alert("중복체크버튼 클릭");	
		let memberId = $("#memberid").val();
		if (memberId ==""){
			alert("아이디를 입력해주세요");
			return;
		}
	
		$.ajax({
			type :  "post",    //전송방식
			url : "<%=request.getContextPath()%>/member/memberIdCheck.aws",
			dataType : "json",       // json타입은 문서에서  {"키값" : "value값","키값2":"value값2"}
			data : {"memberId" : memberId },
			success : function(result){   //결과가 넘어와서 성공했을 받는 영역
				//alert("전송성공 테스트");
			//	alert("길이는"+result.length);
			//	alert("cnt값은"+result.cnt);
			if(result.cnt ==0){
				alert("사용할수 있는 아이디입니다.");
				$("#btn").val("Y");
			}else{
				alert("사용할수 없는 아이디입니다.");
				$("#memberid").val("");   //입력한 아이디 지우기
			}
			
			
			},
			error : function(){  //결과가 실패했을때 받는 영역
						
				alert("전송실패 테스트");
			}			
		});			
	});	
});
</script>
<link href="../resources/css/joinStyle.css" rel="stylesheet">
</head>
<!-- home 버튼을 오른쪽 최상단에 위치시킴 -->
<button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
<body>
	<section>
	<header>JOIN</header>

	<form name = "frm">
	<input type="hidden" id="memberkind" name="memberkind" value="M">
		<table>
			<tr>
				<th>ID</th>
				<td>
				<div>
					<input type="text" id="memberid" name="memberid" placeholder="아이디를 입력하세요">
					<button type="button" name="btn" id="btn" value="N">아이디 중복체크</button>
				</div>
				</td>
			</tr>

			<tr>
				<th>PASSWORD</th>
				<td><input type="password" name="memberpwd" placeholder="비밀번호를 입력하세요"></td>
			</tr>

			<tr>
				<th>PASSWORDCHECK</th>
				<td><input type="password" name="memberpwd2" placeholder="비밀번호 확인을 해주세요"></td>
			</tr>

			<tr>
				<th>NAME</th>
				<td><input type="text" name="membername" placeholder="이름을 입력하세요"></td>
			</tr>

			<tr>
				<th>BIRTH</th>
				<td><input type="text" name="memberbirth" placeholder="ex)20000101"></td>
			</tr>

			<tr>
				<th>E-MAIL</th>
				<td><input type="email" name="memberemail" placeholder="이메일을 입력하세요"></td>
			</tr>

			<tr>
				<th>PHONE</th>
				<td><input type="text" name="memberphone" placeholder="연락처를 입력하세요"></td>
			</tr>

			<tr>
				<th>ADDR</th>
					<td>
						<input type="text" name="memberaddr">
					</td>
			</tr>

			<tr>
				<th>GENDER</th>
					<td style ="text-align:center;">
						 <input type="radio" name="membergender" id="select1" value = "M"><label for="select1">남성</label> 
						 <input type="radio" name="membergender" id="select2" value = "F"><label for ="select2">여성 </label> 
					</td >
				 </tr >


			<tr>         
	          <td colspan=2 style='text-align:center;'>
		          <input type="button" name="btn" class = "btn" value="회원가입하기" onclick="join();"> 
		          <input type="reset" name="btn" class = "btn" value="초기화">
	          </td>
          </tr>

	    </table >
	  </form >


   </section >
</body>
</html>