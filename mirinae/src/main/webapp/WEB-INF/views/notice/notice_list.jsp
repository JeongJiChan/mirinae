<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#n_list { width: 100%; cursor: pointer; }
	.n_title {style="font-size:56px; line-height:1.4em; align: center;}
	button.writeBtn { margin-left: 1400px; }
	div.item { display : flex;   justify-content: flex-start; margin:auto; float: left;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="n_list">
	<h1 class="n_title" style="text-align:center" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<!-- 공지사항 리스트 -->
<div>
	<table width="60%" align= "center">
		<tr><th>글번호</th><th>제목</th><th>작성일</th><th>조회수</th></tr>
		<c:forEach var="notice" items="${list }">
		<c:set var="number" value="${number}"/>

		<c:url value="notice_view.la" var="nl_title">
			<c:param name="no_no" value="${notice.no_no }"/>
			<c:param name="pageNum" value="${currentPage }"/>
		</c:url>
		
			<tr>
			<td align="center">${number }<c:set var="number" value="${number-1 }"/> </td>
			<td width="70%" style="padding-left :70px"><input type="button" onclick="location.href='${nl_title}'" value="${notice.no_title }"></td>
			<td>${notice.no_date}</td>
			<td>${notice.no_view }</td></tr>
		</c:forEach>
	</table>
</div>


<div class="item" align="center">
	<!-- 이전 페이지 버튼 -->
			<c:if test="${startPage > PAGE_PER_BLOCK}">
				<button class="first" onclick="location.href='notice_list.la?pageNum=${startPage - 1}'">이전</button> 
			</c:if>
			<c:if test="${pageNum > 1}">
				<button class="prev" onclick="location.href='notice_list.la?pageNum=${currentPage - 1}'">이전	</button>
			</c:if>
	<!-- 페이지 버튼 -->	
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button id="page${i}" class="page_num" onclick="location.href='notice_list.la?pageNum=${i}'">${i}</button>
			</c:forEach>
	<!-- 다음 페이지 버튼 -->
			<c:if test="${currentPage < totalPage}">
				<button class="next" onclick="location.href='notice_list.la?pageNum=${currentPage + 1}'">다음	</button>
			</c:if>
			<c:if test="${endPage < totalPage}">
				<button class=last onclick="location.href='notice_list.la?pageNum=${endPage + 1}'">다음</button> 
			</c:if>
</div>
<!-- <button class="writeBtn" onclick="notice_write.la">글쓰기</button> -->
</body>
</html>