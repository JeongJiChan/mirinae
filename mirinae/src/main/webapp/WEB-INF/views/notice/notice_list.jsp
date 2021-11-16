<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.n_title {style="font-size:56px; line-height:1.4em; text-align:center"}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 공지사항 리스트 --> 
<div id="" class="" data-testid="">
	<h1 class="n_title">Notice</h1>
</div>
<div>
	<table>
		<tr><th>글번호</th><th>제목</th><th>작성일</th><th>조회수</th></tr>
		<c:forEach var="notice" items="${list }">
			<tr>
			<td width="50px">${notice.no_no }</td>
			<td width="150px"><input type="button" onclick="location.href='notice_view.do?no_no=${notice.no_no}'" value="${notice.no_title }"></td>
			<td width="50px">${notice.no_date}</td>
			<td width="50px">${notice.no_view }</td></tr>
		</c:forEach>
	</table>
</div>


<div class="paging" align="center">
	<div class="items">
	<!-- 이전 페이지 버튼 -->
		<div class="prev_btn">
			<c:if test="${startPage > PAGE_PER_BLOCK}">
				<button class="first" onclick="location.href='notice_list.do?pageNum=${startPage - 1}'">
					이전
				</button> 
			</c:if>
			<c:if test="${pageNum > 1}">
				<button class="prev" onclick="location.href='notice_list.do?pageNum=${currentPage - 1}'">
					이전
				</button>
			</c:if>
		</div>
	<!-- 페이지 버튼 -->	
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button id="page${i}" class="page_num" onclick="location.href='notice_list.do?pageNum=${i}'">${i}</button>
			</c:forEach>
	<!-- 다음 페이지 버튼 -->
		<div class="next_btn">
			<c:if test="${currentPage < totalPage}">
				<button class="next" onclick="location.href='notice_list.do?pageNum=${currentPage + 1}'">
					다음
				</button>
			</c:if>
			<c:if test="${endPage < totalPage}">
				<button class=last onclick="location.href='notice_list.do?pageNum=${endPage + 1}'">
					다음
				</button> 
			</c:if>
		</div>
	</div>
</div>
</body>
</html>