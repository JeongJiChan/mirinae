<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.caption {
	width: 100%;
}
</style>
</head>
<body>
	<div class="caption">
		<h1 class="cs_title"
			style="font-size: 56px; line-height: 1.4em; text-align: center">CustomerService</h1>
	</div>
	<div>
		<table align="center" width="60%">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<c:forEach var="cs" items="${list }">
					<tr>
						<td align="center">${cs.cs_no}<c:set var="number"
								value="${cs.cs_no - 1}"></c:set></td>
						<c:if test="${cs.cs_del=='y' }">
							<th colspan="4">삭제된 게시글입니다</th>
						</c:if>
						<c:if test="${cs.cs_del != 'y' }">
							<td
								onclick="location.href='/mirinae/views/cs/cs_view.kwon?cs_no=${cs.cs_no}'"
								width="70%" style="padding-left: 70px">${cs.cs_title }</td>
							<td align="center" width="10%">${cs.cs_writer }</td>
							<td>${cs.cs_reg_date }</td>
							<td align="center">${cs.cs_view }</td>
						</c:if>
					</tr>
				</c:forEach>
		</table>
		<div align="center">
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button
					onclick="location.href='mirinae/views/cs/cs_list.kwon?pageNum=${startPage-1}'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage== i }">
					<button
						onclick="location.href='mirinae/views/cs/cs_list.kwon?pageNum=${i}'"
						disabled="disabled">${i}</button>
				</c:if>
				<c:if test="${currentPage!= i }">
					<button
						onclick="location.href='mirinae/views/cs/cs_list.kwon?pageNum=${i}'">${i}</button>
				</c:if>
			</c:forEach>
			<!-- 보여줄 것이 남아있다 -->
			<c:if test="${endPage < totalPage }">
				<button
					onclick="location.href='mirinae/views/cs/cs_list.kwon?pageNum=${endPage+1}'">다음</button>
			</c:if>
		</div>
		<!-- num=0 처음 쓴글 -->
		<br>
		<button
			onclick="location.href='cs_writeForm.kwon?num=0&pageNum=${currentPage}'" style="margin-left: 1300px">글쓰기</button>
	</div>
</body>
</html>