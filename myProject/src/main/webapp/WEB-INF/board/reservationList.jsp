<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>   
<%@ page import="com.myaws.myapp.domain.*" %>  
<%
 ArrayList<BoardVo> blist = (ArrayList<BoardVo>)request.getAttribute("blist"); // 형변환 때문에 경고라인 뜬거 걱정 말기
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	int totalCount = pm.getTotalCount();
	String keyword= pm.getScri().getKeyword();
	String searchType = pm.getScri().getSearchType();
	String param = "keyword="+keyword+"&searchType="+searchType+"";		
 %>
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
<title>예약글 목록</title>

<script>

</script>
</head>
 <link href="../resources/css/boardStyle.css" rel="stylesheet">
<button onclick="location.href='<%=request.getContextPath() %>/member/mainPage.aws'" class="main-button">Main</button>



<body>
<header>

	<h2 class = "mainTitle">예약신청 현황</h2>
	<form class="search">
		<select name = "searchType">
			<option value="subject">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword">
		<button  type="submit" class="btn">검색</button>
	</form>
</header>
<section>


<table class="listTable">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>승인여부</th>

		</tr>
		<%
		int num  = totalCount - (pm.getScri().getPage()-1)*pm.getScri().getPerPageNum();	
		for(BoardVo bv : blist) { 			
		
			String lvlStr = "";
			for(int i=1;i<=bv.getLevel(); i++){
				
				lvlStr = lvlStr +"&nbsp;&nbsp;";
				
				if (i == bv.getLevel()){
					lvlStr  = lvlStr + "ㄴ";
				}
			}			
		%>
		<tr>
			<td><%=num %></td>
			<td class="title">
			<%=lvlStr %>
			<a href="<%=request.getContextPath() %>/board/reservationContents.aws?bidx=<%=bv.getBidx() %>"><%=bv.getSubject() %></a></td>
			<td><%=bv.getWriter()%></td>
			<td><%=bv.getWriteday() %></td>
			<td><%=bv.getAccept()%></td>
		</tr>
		<%
		 num = num-1; // 여기는 한 페이지에서 15번까지 돌릴때 
		 // 게시물 한개 제목 작성자 번호 등등 찍어줬으면 다음 번호 찍도록 -1 해준것
		}
		%>
		
	</table>

	
	<div class="btnBox">
		<a class="btn aBtn" href="<%=request.getContextPath() %>/board/reservationWrite.aws">예약</a>
	</div>
	
	

<div class = "page">
		<ul>
		
		<% if (pm.isPrev()==true) { %>
		<li><a href="<%=request.getContextPath() %>/board/reservationList.aws?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></li>
		<%} %>
		
		<% for(int i = pm.getStartPage();i<=pm.getEndPage();i++) { %>
			<li
			<%if (i==pm.getScri().getPage()) {%> class="on"<%}%> > 
				<a href="<%=request.getContextPath() %>/board/reservationList.aws?page=<%=i%>&<%=param%>">
				<span style="font-size:20px;"> <%=i %></span></a>
			</li>
		<%} %>
		
		<%if(pm.isNext() == true && pm.getEndPage()>0){ %>
		<li>
			<a href="<%=request.getContextPath() %>/board/reservationList.aws?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a></li>
		<%} %>

		</ul>
	
	</div>
<!-- <div class = "page">
    <ul>
        <li><a href="#">◀</a></li>
        <li><a href="#" class="on">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">6</a></li>
        <li><a href="#">7</a></li>
        <li><a href="#">8</a></li>
        <li><a href="#">9</a></li>
        <li><a href="#">10</a></li>
        <li><a href="#">▶</a></li>
    </ul>
</div> -->

</section>

</body>
</html>