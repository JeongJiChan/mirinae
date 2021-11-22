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
	<h1 class="n_title" style="text-align:center" onclick="location.href='sup_list.chan'">List</h1>
</div>
<!-- 공지사항 리스트 -->
<div>
	<table width="60%" align= "center">
		<c:forEach var="support" items="${list }">
		<c:if test="${support.del == 'n' }">
		<tr><th>후원번호</th><th>프로젝트명</th><th>후원일</th><th>금액</th></tr>
		<tr><td align="center">${support.sup_no }<c:set var="number" value="${number-1 }"/> </td>
			<td width="70%" style="padding-left :70px"><a href="sup_view.chan?pageNum=${currentPage }&sup_no=${sup_no }">${support.p_name }</a></td>
			<td>${support.sup_date }</td>
			<td>${support.total_price }</td></tr>
		</c:if>
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
<button class="writeBtn" onclick="location.href='notice_writeForm.la'">글쓰기</button>
</body>
</html>