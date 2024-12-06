<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>고양이 서비스 소개</title>
  <link rel="stylesheet" href="../resources/css/styles.css">
</head>
<body>
  <div class="container">
    <header>
      <div class="logo">
   		 <a href="<%=request.getContextPath() %>/member/mainPage.aws"><img src="../resources/images/cat&dogLogo.png"></a>
  	</div>
      <h1>고양이 서비스 소개 페이지</h1>
      <button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
    </header>
    <main>
      <section class="intro">
        <p>검증된 펫시터가 안전한 돌봄과 믿을 수 있는 서비스를 제공합니다.</p>
      </section>
      <section class="features">
  <div class="feature">
    <img src="../resources/images/cat1.jpg" alt="강아지 산책 이미지">
    <div class="text">
      <h2>엄선된 집사가 돌봐드려요</h2>
      <p>고양이 반려경험이 있는 펫시터 분만 고양이 돌봄을 진행하고 있어요</p>
    </div>
  </div>
  <div class="feature">
    <img src="../resources/images/catcare.jpg" alt="배변처리 이미지">
    <div class="text">
      <h2>고양이 성향에 맞춰서 돌봐드려요</h2>
      <p>사람을 좋아하는 개냥이부터 낯선사람을 무서워하는 소심냥이까지! 성향에 맞춰 돌봄을 진행해요</p>
    </div>
  </div>
  <div class="feature">
    <img src="../resources/images/catplay.jpg" alt="실내 놀이 이미지">
    <div class="text">
      <h2>요청사항을 상세히 적어주세요</h2>
      <p>화장실과 음수량 등 신경써야 할 부분들을 상세히 작성해주시면 방문펫시터가 요청사항에 맞춰 세심하게 돌봄을 진행해요</p>
    </div>
  </div>
  <div class="feature">
    <img src="../resources/images/cateat.jpg" alt="고양이 식사 이미지">
    <div class="text">
      <h2>혼자서도 잘 챙겨 먹어요</h2>
      <p>식사시간에 맞춰 준비해두신 깨끗한 그릇에 신선한 물과 사료를 급여해요! **약이나 특별식을 급여해야하는 날에는 펫시터에게 요청해주세요!</p>
    </div>
  </div>
</section>
      <footer class="footer-button">
      <button onclick="location.href='<%=request.getContextPath() %>/board/reservationWrite.aws'" class="btn aBtn">예약</button>
       <!--  <button>지금 예약하기</button> -->
      </footer>
    </main>
  </div>
</body>
</html>
