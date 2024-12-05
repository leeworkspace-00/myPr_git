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

  <title>예약 정보 입력</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script> <!-- mvc jquery-CDN주소 추가  -->
 <link href="../resources/css/level&reservation.css" rel="stylesheet">
<script>
const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;


function check(){ 
//alert("test");
	
	//유효성 검사하기	
 	var fm = document.frm;	
	
	if (fm.writer.value ==""){
		alert("보호자 성함을 입력해주세요");
		fm.writer.focus();
		return;
	}else if (fm.petname.value ==""){		
		alert("반려동물 이름을 입력해주세요");
		fm.petname.focus();
		return;
	}else if (fm.phone.value ==""){
		alert("연락 가능한 번호를 입력해주세요");
		fm.phone.focus();
		return;
	}else if (fm.addr.value==""){
		alert("시터가 방문할 주소를 입력해주세요.");
		fm.addr.focus();
		return;
	}else if (fm.useday.value ==""){
		alert("이용 날짜를 선택해주세요");
		fm.useday.focus();
		return;
	}else if (fm.servicekind.value ==""){
		alert("이용할 서비스를 선택해주세요");
		fm.servicekind.focus();
		return;
	}else if (fm.petborder.value ==""){		
	alert("아이의 경계도를 알려주세요");
	fm.petborder.focus();
	return;
}
	
		
	var ans = confirm("저장하시겠습니까?");
	
	if (ans == true){						
		fm.action="<%=request.getContextPath()%>/board/reservationWriteAction.aws"; 
		fm.method="post"; 
		fm.submit();
	}
	return;
}

</script>

</head>

<header>예약신청서</header>

<body>
<button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
<section>
  <article>
    <form name="frm">
        <input type="hidden" id="boardkind" name="boardkind" value="B">
        <input type="hidden" id="subject" name="subject" value="예약신청합니다~">
        <input type="hidden" id="midx" name="midx" value="<%= midx%>">

      <table>
        <tr>
          <th><label for="writer">보호자 성함</label></th>
          <td><input type="text" id="writer" name = "writer" value = "" maxlength="30" placeholder="보호자 성함을 입력해주세요"></td>
        </tr>

        <tr>
          <th><label for="petname">반려동물 이름</label></th>
          <td><input type="text" id="petname" name = "petname" maxlength="30" placeholder="반려동물 이름을 입력해주세요"></td>
        </tr>

        <tr>
          <th><label for="phone">연락처</label></th>
          <td><input type="text" id="phone" name = "phone" maxlength="30" placeholder="연락 가능한 번호를 입력해주세요"></td>
        </tr>

        <tr>
          <th><label for="addr">주소</label></th>
          <td><input type="text" id="addr" name = "addr" placeholder="시터가 방문할 주소를 입력해주세요"></td>
        </tr>

        <tr>
          <th><label for="useday">이용 날짜</label></th>
          <td><input type="date" id="useday" name = "useday"></td>
        </tr>

        <tr>
          <th>이용할 서비스</th>
          <td>
            <select id="servicekind" name = "servicekind">
            
              <option value="1" selected>실내 돌봄 (산책 없음 견/묘): 25,000원</option>
              <option value="2">실내외 돌봄 산책 있음 (견): 35,000원</option>
              <option value="3">강아지와 고양이 함께 실내 돌봄: 40,000원</option>
              <option value="4">강아지와 고양이 함께 실내외 돌봄: 50,000원</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>아이의 경계도</th>
          <td>
            <select id="petborder" name ="petborder" >
              <option value="1" selected>낯선 사람에게도 친화적이에요</option>
              <option value="2">낯선 사람을 만나면 구석으로 숨어요</option>
              <option value="3">짖거나 하악질을 할 수도 있어요</option>
              <option value="4">낯선 사람에게 어떤 반응인지 잘 모르겠어요</option>
            </select>
          </td>
        </tr>


        <tr>
          <th><label for="request">요청사항</label></th>
          <td><input type="text" id="request" name = "request" placeholder='ex) 약을 챙겨 먹여야 해요 / 고령의 아이라 앞이 안 보여요 조심해주세요'></td>
        </tr>


        <tr>         
          <td colspan=2 style='text-align:center;'>
          	  <input type="button" class = "write" name="btn" value="작성하기" onclick="check();"> 
	          <input type="reset" class = "reset" name="btn" value="초기화">
          </td>
          </tr>

            </table>
        </form>
     </article>
  </section>

  </body>
  </html>
            
            