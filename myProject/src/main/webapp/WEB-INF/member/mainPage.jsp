<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg = "";
if(session.getAttribute("msg") != null) {
    msg = (String)session.getAttribute("msg");
}
session.setAttribute("msg", "");

int midx = 0;

boolean isLoggedIn = false;

if (session.getAttribute("midx") == null) { 
    
    isLoggedIn = false;
} else {
    isLoggedIn = true;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메인페이지</title>

  <script type="text/javascript">
    function toggleChapters() {
      const chapterList = document.getElementById('chapterList');
      const overlay = document.getElementById('overlay');
      
      if (chapterList.classList.contains('open')) {
        chapterList.classList.remove('open');
        overlay.style.display = 'none';
        document.body.style.overflow = 'auto';
      } else {
        chapterList.classList.add('open');
        overlay.style.display = 'block';
        document.body.style.overflow = 'hidden';
      }
    }

    document.addEventListener('click', function(event) {
      const chapterList = document.getElementById('chapterList');
      const overlay = document.getElementById('overlay');
      
      if (!chapterList.contains(event.target) && !event.target.matches('.category-btn')) {
        chapterList.classList.remove('open');
        overlay.style.display = 'none';
        document.body.style.overflow = 'auto';
      }
    });
  </script>
  <link href="../resources/css/mainstyle.css" rel="stylesheet">
</head>
<body>
<header>
  <div class="logo">
    <a href="<%=request.getContextPath() %>/member/mainPage.aws"><img src="../resources/images/cat&dogLogo.png"></a>
    
  </div>
  <nav class="navbar">
    <ul>
      <% if (!isLoggedIn) { %>
        <li><a href="<%=request.getContextPath() %>/member/memberJoin.aws">JOIN</a></li>
        <li><a href="<%=request.getContextPath() %>/member/memberLogin.aws">LOGIN</a></li>
      <% } else { %>
        <li><a href="<%=request.getContextPath() %>/member/myPage.aws">MYPAGE</a></li>
        <li><a href="<%=request.getContextPath() %>/member/memberLogout.aws">LOGOUT</a></li>
      <% } %>
      <li><button class="category-btn" onclick="toggleChapters()">≡</button></li>
    </ul>
  </nav>
</header>
<section class="fold-section">
    <div class="fold-content">
        <h1>믿을 수 있는 펫시터 서비스</h1>
        <p>강아지와 고양이를 위한 최고의 돌봄 서비스를 제공합니다.</p>
        <button onclick="location.href='<%=request.getContextPath() %>/board/reservationWrite.aws'">지금 예약하기</button>
        <button onclick="location.href='<%=request.getContextPath() %>/board/reviewList.aws'">리뷰 보러가기</button>
    </div>  
</section>

<div class="chapter-list" id="chapterList">
  <div><h3>CHAPTER</h3></div>

  <ul>
    <li><a href="<%=request.getContextPath() %>/board/reservationList.aws">예약목록</a></li>
    <li><a href="<%=request.getContextPath() %>/board/askList.aws">문의게시판</a></li>
    <li><a href="<%=request.getContextPath() %>/board/introFee.aws">요금안내</a></li>
    <li><a href="<%=request.getContextPath() %>/board/reviewList.aws">후기게시판</a></li>
    <li><a href="<%=request.getContextPath() %>/board/levelupWrite.aws">시터지원하러가기</a></li>
	<li><a href="<%=request.getContextPath() %>/board/levelupList.aws">지원목록</a></li>
	 </ul>
    <!-- Bottom Links for Login/Signup or My Page/Logout -->
    <div class="bottom-links">
      <% if (isLoggedIn) { %>
        <a href="<%=request.getContextPath() %>/member/myPage.aws">MYPAGE</a>
        <a href="<%=request.getContextPath() %>/member/memberLogout.aws">LOGOUT</a>
      <% } else { %>
        <a href="<%=request.getContextPath() %>/member/memberLogin.aws">LOGIN</a> 
        <a href="<%=request.getContextPath() %>/member/memberJoin.aws">JOIN</a> 
      <% } %>
    </div>

 
</div>

<div class="container">
  <!-- Item 1 -->
  <div class="item">
    <img src="../resources/images/dogLogo.png" alt="강아지 이미지">
    <div class="text">DOG</div> <!-- 강아지 텍스트 -->
    <div class="sitter-link"><a href="<%=request.getContextPath() %>/board/introDog.aws">소개</a></div>
  </div>

  <!-- Item 2 -->
  <div class="item">
   <img src="../resources/images/catLogo.png" alt="고양이 이미지">
   <div class="text">CAT</div> <!-- 고양이 텍스트 -->
   <div class="sitter-link"><a href="<%=request.getContextPath() %>/board/introCat.aws">소개</a></div>
  </div>

</div>

<section class="program-intro">
  <h1>INTRO</h1>

  <!-- h3 태그와 li 목록을 가로로 배치하기 위한 컨테이너 -->
  <div class="h3-container">
      <!-- 첫 번째 h3와 목록 -->
      <div class="service-group">
          <h3>이런 서비스를 제공해드려요</h3>
          <ul>
              <li>사료, 물 급여</li>
              <li>화장실 청소</li>
              <li>산책</li>
              <li>놀이</li>
              <li>주변 환경 정리 (온도 조절, 밥그릇 물그릇 정리 등)</li>
              <li>돌봄일지 작성</li>
          </ul>
      </div>

      <!-- 두 번째 h3와 목록 -->
      <div class="service-group">
          <h3>이럴 때 이용해보세요</h3>
          <ul>
              <li>여행 갈 때</li>
              <li>출장</li>
              <li>입원</li>
              <li>업무가 너무 바빠 돌봄이 불가능할 때</li>
              <li>고령으로 산책이 힘들 때</li>
          </ul>
      </div>
  </div>

  <!-- 서비스 가능한 동물 안내 -->
  <h5>서비스 가능한 동물 안내</h5>

  <p>* 강아지와 고양이만 서비스를 제공해드리고 있습니다.</p>

</section>

<!-- 배경 오버레이 (투명도 효과) -->
<div class="overlay" id="overlay"></div>

</body>
</html>
