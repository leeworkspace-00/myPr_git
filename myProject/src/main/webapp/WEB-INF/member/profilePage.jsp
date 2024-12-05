<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터프로필페이지</title>

</head>
<style>
  /* 기본 스타일 초기화 */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    padding: 20px;
  }

  section {
    max-width: 800px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  h2 {
    text-align: center;
    color: #343a40;
    margin-bottom: 20px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    vertical-align: middle; /* 텍스트를 세로 중앙에 배치 */
  }

  th {
    background-color: #f8f9fa;
    font-weight: bold;
    color: #495057;
    width: 30%;
  }

  td {
    color: #343a40;
    width: 70%;
  }

  /* 버튼 스타일 */
  .btn-container {
    text-align: center; /* 버튼들을 가운데 정렬 */
    margin-top: 20px; /* 버튼과 테이블 사이 간격 */
  }

  .btn-container input[type="button"] {
    background-color: black; /* 파란색 배경 */
    color: white; /* 흰색 텍스트 */
    border: none; 
    padding: 10px 20px; 
    font-size: 16px; 
    border-radius: 5px; 
    cursor: pointer; 
    margin-right: 10px; /* 버튼 간의 간격 */
    transition: background-color .3s ease; /* 호버 시 부드러운 색상 변화 */
  }

  .btn-container input[type="button"]:hover {
      background-color: #0056b3; /* 호버 시 더 진한 파란색 */
      transition-duration : .3s ease-out;
      }
</style>
<body>
	<section>
  
	<h2>시터 정보</h2>

	<article>
		<form name="frm">
  
		<table>
	<tr>
		<th>닉네임</th>
		<td>시터닉네임</td>
	</tr>
	
	<tr>
		<th>연락처</th>
		<td>연락처</td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td>이메일</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>주소</td>
	</tr>
	
	<tr>
		<th>가입일시</th>
		<td>회원가입일 보여주기</td>
	</tr>
	
	<tr>
		<th>평점</th>
		<td>별점 평균보여주기</td>
	</tr>

	
	<!-- 버튼 영역 -->
	<tr> 
		<td colspan="2" class="btn-container">
			<input type="button" name="btn" value="로그아웃하기">
			<input type="button" name="btn" value="시터탈퇴하기"> 
			<input type="button" name="btn" value="비밀번호변경하기"> 
		</td>
	</tr>

<!-- 추가적인 버튼이 필요하다면 여기에 추가 -->
<!-- 예시로 예약 정보 저장하기와 초기화 버튼을 추가할 수 있음 -->
<!-- <input type="reset" value="초기화"> -->

</table>
</form>
</article>
</section>
</body>
</html>