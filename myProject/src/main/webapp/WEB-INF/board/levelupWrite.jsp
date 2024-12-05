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
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>시터 신청서 작성페이지</title>
    <link href="../resources/css/level&reservation.css" rel="stylesheet">
</head>
<script>
const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;


function levelupBtn(){ 
//alert("test");
	
	//유효성 검사하기	
 	var fm = document.frm;	
	
	if (fm.writer.value ==""){
		alert("시터님 성함을 입력해주세요");
		fm.writer.focus();
		return;
	}else if (fm.phone.value ==""){		
		alert("연락처를 입력해주세요");
		fm.phone.focus();
		return;
	}else if (fm.addr.value ==""){
		alert("주소를 입력해주세요");
		fm.addr.focus();
		return;
	}else if (fm.interviewday.value==""){
		alert("면접가능한 날짜를 선택해주세요.");
		fm.interviewday.focus();
		return;
	}else if (fm.perferpet.value ==""){
		alert("선호하는 반려동물의 종류를 선택해주세요");
		fm.perferpet.focus();
		return;
	}else if (fm.experience.value ==""){
		alert("반려경험을 선택해주세요");
		fm.experience.focus();
		return;
	}
	
		
	var ans = confirm("저장하시겠습니까?");
	
	if (ans == true){						
		fm.action="<%=request.getContextPath()%>/board/levelupWriteAction.aws"; 
		fm.method="post"; 
		fm.submit();
	}
	return;
}

</script>

<button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
<header>시터로 등업 신청하기</header>
<body>


<section>
  <article>
    <form name="frm">
	<input type="hidden" id="boardkind" name="boardkind" value="L">
    <input type="hidden" id="subject" name="subject" value="등업신청합니다~">
    <input type="hidden" id="midx" name="midx" value="<%= midx%>">
      <table>
        <tr>
          <th><label for="writer">이름</label></th>
          <td><input type="text" id="writer" name ="writer" maxlength="30" placeholder="시터님의 성함을 입력해주세요"></td>
        </tr>


        <tr>
          <th><label for="phone">연락처</label></th>
          <td><input type="text" id="phone" name = "phone" maxlength="30" placeholder="연락 가능한 번호를 입력해주세요"></td>
        </tr>

        <tr>
          <th><label for="addr">주소</label></th>
          <td><input type="text" id="addr" name = "addr" placeholder="현재 거주하시는 주소를 입력헤주세요"></td>
        </tr>

        <tr>
          <th>면접 가능한 날짜</th>
          <td>
          <input type="date" id = "interviewday" name = "interviewday">
          
          </td>
        </tr>

        <tr>
          <th>선호하는 반려동물</th>
          <td>
            <input type="radio" id="dog" name="perferpet" value="D" checked> 
            <label for="dog">dog</label>

            <input type="radio" id="cat" name="perferpet" value="C"> 
            <label for="cat">cat</label>

            <input type="radio" id="both" name="perferpet" value="B"> 
            <label for="both">both</label>
          </td>
        </tr>

        <tr>
          <th>반려경험</th>
          <td>
            <input type="radio" id="dog" name="experience" value="D" checked> 
            <label for="dog">dog</label>

            <input type="radio" id="cat" name="experience" value="C"> 
            <label for="cat">cat</label>

            <input type="radio" id="both" name="experience" value="B"> 
            <label for="both">both</label>
          </td>
        </tr>


        <tr>
          <th><label for="request">추가요청사항</label></th>
          <td><input type="text" id="request" name = "request" placeholder='참고할 사항이 있다면 적어주세요'></td>
        </tr>

        <!-- 버튼 -->
        <tr> 
          <td colspan=2 style='text-align:center;'>
	          <input type="button" name="btn" value="작성하기" onclick="levelupBtn();"> 
	          <input type="reset" name="btn" value="초기화">
          </td>
        </tr>
            <!-- 저장하기 버튼 -->
            <!-- onclick 이벤트는 나중에 구현할 수 있습니다 -->
            <!-- 예시로 check() 함수가 호출되도록 설정 -->
            <!-- 실제로 check() 함수가 정의되지 않았으므로 동작하지 않음 -->
            <!-- 필요 시 자바스크립트로 추가 구현 가능 -->
            <!-- 아래 버튼은 예약 정보를 저장하는 역할을 합니다 -->
            <!-- 초기화 버튼은 폼의 내용을 리셋합니다 -->
            <!-- 사용자가 잘못된 정보를 입력했을 때 초기화할 수 있습니다 -->
            <!-- 이 기능은 유용하며 사용자 경험을 개선할 수 있습니다 -->
            
            <!-- 예약 정보 저장하기 버튼과 초기화 버튼 -->
            
            <!-- 예약 정보 저장하기 버튼은 사용자가 폼을 제출할 때 사용할 수 있습니다 -->
            
            <!-- 초기화 버튼은 폼의 내용을 리셋하는 데 사용됩니다 -->
            </table>
        </form>
     </article>
  </section>
  
  <footer>
  <div style = "text-align: center;">
  	*등업성공여부는 시터게시판에서 확인해주세요
  </div>
  
  
  </footer>
  
  
  </body>
  </html>
            
            