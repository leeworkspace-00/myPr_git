<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

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
  <style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #f8f9fa;
	border-bottom: 1px solid #dee2e6;
}

.logo img {
	height: 40px;
}

.navbar ul {
	list-style: none;
	display: flex;
	margin: 0;
	padding: 0;
}

.navbar li {
	margin-left: 15px;
}

.navbar a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
}

.category-btn {
	background: none;
	border: none;
	font-size: 20px;
	cursor: pointer;
	color: #333;
}

.btn-container {
	display: grid; /* Grid 레이아웃 활성화 */
	grid-template-columns: repeat(2, 120px);
	gap: 60px; /* 버튼 사이 간격 설정 */
	justify-content: center; /* 수평 방향 중앙 정렬 */
	align-items: center; /* 수직 방향 중앙 정렬 */
	 height: 40vh; /* 화면 전체 높이 사용 */

}

.btn-container button {
	width: 150px;
	height: 150px;
	font-size: 16px;
	border: none;
	border-radius: 10px;
	background-color: #007bff;
	color: white;
	cursor: pointer;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 큐브 느낌을 위한 그림자 추가 */
	transition: transform 0.3s ease, box-shadow 0.3s ease; /* 애니메이션 효과 */
}

.btn-container button:hover {
	background-color: #0056b3;
	transform: translateY(-5px);
	box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
<header>
  <div class="logo">
    <a href="<%=request.getContextPath()%>/member/mainPage.aws">
      <img src="../resources/images/cat&dogLogo.png" alt="Logo">
    </a>
  </div>
  <nav class="navbar">
    <ul>
      <li><a href="<%=request.getContextPath() %>/member/memberLogout.aws">LOGOUT</a></li>
      <li><button class="category-btn" onclick="toggleChapters();">≡</button></li>
    </ul>
  </nav>
</header>
<div class="btn-container">
  <button type="button" onclick="location.href='<%=request.getContextPath() %>/board/reservationList.aws'">예약신청현황</button>
  <button type="button" onclick="location.href='<%=request.getContextPath() %>/board/levelupList.aws'">시터신청현황</button>
  <button type="button" onclick="location.href='<%=request.getContextPath() %>/board/askList.aws'">답변하러가기</button>
  <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'">메인가기</button>
</div>
</body>
</html>