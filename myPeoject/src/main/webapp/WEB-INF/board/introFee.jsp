<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요금안내</title>
</head>
 <link rel="stylesheet" href="../resources/css/styles.css">
<body>
 <section class="pricing">
      <h2>요금안내페이지</h2>
      <button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
      <p>펫시터 집으로부터는 방문 펫시터 서비스는 1회 25000원</p>
	  <p>시간 추가, 주말, 명절, 마리추가(반려묘,반려견추가)에 따라서 추가금이 발생합니다.</p>
	  <p>자세한 내용은 아래 화면을 통해 확인해주세요!</p>
      <!-- 요금표 -->
      <div class = "feetable"><h3>요금표</h3>
      <ul class="price-list">
        <li>실내 돌봄 (산책 없음 견/묘): 25,000원</li>
        <li>실내외 돌봄 산책 있음 (견): 35,000원</li>
        <li>강아지와 고양이 함께 실내 돌봄: 40,000원</li>
        <li>강아지와 고양이 함께 실내외 돌봄: 50,000원</li>
      </ul>
      </div>

      <!-- 추가 안내 -->
      <div class="extra-fee"><h3>추가금 안내</h3>
      
      	<div class="fee-grid">
      	    <div class="fee-item">
      		<h4>마리당추가요금</h4>
      			<p>15kg 미만 > 5000원/ 15kg 이상 > 10000원</p>
      	</div>
      	    <div class="fee-item">
      		<h4>시간당추가요금</h4>
      			<p>1시간 추가이용시 15000원</p>
      	</div>
      	    <div class="fee-item">
      		<h4>휴일 및 명절 추가요금</h4>
      			<p>휴일및 공휴일 > 5000원/명절 > 14000원</p>
      	</div>
      	    <div class="fee-item">
      		<h4>반려견/묘 동반돌봄</h4>
      			<p>반려묘 추가시 최대 총 4마리 까지 가능 마리당 5000원</p>
      	</div>
      </div>
      </div>
      

      <!-- 예약 버튼 -->
      <footer class="footer-button">
         <button onclick="location.href='<%=request.getContextPath() %>/board/reservationWrite.aws'" class="btn aBtn">예약</button>
      </footer>
    </section>

</body>
</html>
