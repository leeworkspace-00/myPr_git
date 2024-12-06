<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myaws.myapp.domain.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% 
 int midx=0;
 if (session.getAttribute("midx") !=null){
	 midx = Integer.parseInt(session.getAttribute("midx").toString());
 }
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
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
    background-color: #007bff; /* 파란색 배경 */
    color: white; /* 흰색 텍스트 */
    border: none; 
    padding: 10px 20px; 
    font-size: 16px; 
    border-radius: 5px; 
    cursor: pointer; 
    margin-right: 10px; /* 버튼 간의 간격 */
    transition: background-color .3s ease; /* 호버 시 부드러운 색상 변화 */
  }  
  .btn-container button[type="button"] {
    background-color: #007bff; /* 파란색 배경 */
    color: white; /* 흰색 텍스트 */
    border: none; 
    padding: 10px 20px; 
    font-size: 16px; 
    border-radius: 5px; 
    cursor: pointer; 
    margin-right: 10px; /* 버튼 간의 간격 */
    transition: background-color .3s ease; /* 호버 시 부드러운 색상 변화 */
  }
    .btn-container button[type="button"]:hover {
      background-color: #0056b3; /* 호버 시 더 진한 파란색 */
      transition-duration : .3s ease-out;
      }

  .btn-container input[type="button"]:hover {
      background-color: #0056b3; /* 호버 시 더 진한 파란색 */
      transition-duration : .3s ease-out;
      }
</style>
<body>
	<section>
  
	<h2>회원 정보</h2>

	<article>
		<form name="frm">
 <input type="hidden" id="midx" name="midx" value="${midx}"> 
	<table>
	<tr>
		<th>이름</th>
		<td></td>
	</tr>
	
	<tr>
		<th>연락처</th>
		<td></td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td></td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td></td>
	</tr>
	
	<tr>
		<th>가입일시</th>
		<td></td>
	</tr>
	
	<tr>
		<th>고객 or 시터</th>
		<td></td>
	</tr>

	
	<!-- 버튼 영역 -->
	<tr> 
		<td colspan="2" class="btn-container">
			<button type="button" name="btn" value="로그아웃하기" onclick = "location.href='<%=request.getContextPath() %>/member/memberLogout.aws'">로그아웃하기</button>
			<input type="button" name="btn" value="회원탈퇴하기" onclick = "location.href='<%=request.getContextPath() %>/member/memberDelete.aws'"> 
			<input type="button" name="btn" value="비밀번호변경하기" onclick = "location.href='<%=request.getContextPath() %>/member/memberModify.aws'"> 
		</td>
	</tr>

</table>
</form>
</article>
</section>
</body>
</html>