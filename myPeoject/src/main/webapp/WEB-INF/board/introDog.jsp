<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강아지 서비스 소개</title>
 <link rel="stylesheet" href="../resources/css/styles.css">
</head>
<body>
  <div class="container">
    <header>
      <h1>강아지 서비스 소개 페이지</h1>
      <button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>
    </header>
    <main>
      <section class="intro">
        <p>검증된 펫시터가 안전한 산책과 믿을 수 있는 서비스를 제공합니다.</p>
      </section>
      
      <section class="features">
  <div class="feature">
    <img src="../images/outdoor_dog.jpg" alt="강아지 산책 이미지">
    <div class="text">
      <h2>즐겁고 안전한 산책시간</h2>
      <p>강아지가 편안히 즐길 수 있는 환경에서 산책을 제공합니다.</p>
    </div>
  </div>
  <div class="feature">
    <img src="../images/cleandog.jpg" alt="배변처리 이미지">
    <div class="text">
      <h2>배변처리와 깔끔한 환경정리</h2>
      <p>매번 산책 후, 주변 환경을 깨끗하게 정리합니다.</p>
    </div>
  </div>
  <div class="feature">
    <img src="../images/indoor_dog.jpg" alt="실내 놀이 이미지">
    <div class="text">
      <h2>비가 와도 괜찮아, 실내 놀이하기</h2>
      <p>실내에서도 강아지가 즐겁게 놀 수 있는 다양한 활동을 제공합니다.</p>
    </div>
  </div>
  <div class="feature">
    <img src="../images/dog_eat.jpg" alt="강아지 식사 이미지">
    <div class="text">
      <h2>혼자서도 잘 챙겨 먹어요</h2>
      <p>식사시간에 맞춰 강아지의 건강을 고려한 사료를 제공합니다.</p>
    </div>
  </div>
</section>
      <footer class="footer-button">
          <button onclick="location.href='<%=request.getContextPath() %>/board/reservationWrite.aws'" class="btn aBtn">예약</button>
      </footer>
    </main>
  </div>
</body>
</html>