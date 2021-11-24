<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../decorator/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.caption {
	width: 100%;
}
.title {
	padding-left: 70px;
}
.title:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
<body>
	
	<div class="caption">
		<h1 class="cs_title"
			style="font-size: 56px; line-height: 1.4em; text-align: center">고객 문의내역</h1>
	</div>
	<div>
		<table align="center" width="60%">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<c:if test="${empty list }">
					<h3>문의내역이 없습니다</h3>
				</c:if>
				<c:if test="${not empty list}">
				<c:forEach var="cs" items="${list }">
					<tr>
						<td align="center">${cs.cs_no}<c:set var="number"
								value="${cs.cs_no - 1}"></c:set></td>
						<c:if test="${cs.cs_del=='y' }">
							<th colspan="4">삭제된 게시글입니다</th>
						</c:if>
						
						<c:if test="${cs.cs_del != 'y' }">
							
							<td
								onclick="location.href='my_cs_view.kwon?cs_no=${cs.cs_no}&pageNum=${currentPage}'"
								width="70%" class="title">
								<c:if test="${cs.cs_re_level > 0 }">
								<img alt="" src="/mirinae/images/level.gif" height="5"
									width="${cs.cs_re_level*10 }">
									<img alt="" src="/mirinae/images/re.gif" height="5">
								</c:if>
								${cs.cs_title }</td>
							<td align="center" width="10%">${cs.cs_writer }</td>
							<td>${cs.cs_reg_date }</td>
							<td align="center">${cs.cs_view }</td>
						</c:if>
					</tr>
				</c:forEach>
				</c:if>
		</table>
		<div align="center">
			<!-- 이전 -->
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button
					onclick="location.href='my_cs_list.kwon?pageNum=1'">처음으로</button>
			</c:if>
			<c:if test="${pageNum > 1}">
				<button
					onclick="location.href='my_cs_list.kwon?pageNum=${currentPage-1}'">이전</button>
			</c:if>
			<!-- 페이지 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage== i }">
					<button
						onclick="location.href='my_cs_list.kwon?pageNum=${i}'"
						disabled="disabled">${i}</button>
				</c:if>
				<c:if test="${currentPage!= i }">
					<button
						onclick="location.href='my_cs_list.kwon?pageNum=${i}'">${i}</button>
				</c:if>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${currentPage < totalPage}">
				<button
					onclick="location.href='my_cs_list.kwon?pageNum=${currentPage + 1}'">다음</button>
			</c:if>
			<!-- 보여줄 것이 남아있다 -->
			<c:if test="${endPage < totalPage }">
				<button
					onclick="location.href='my_cs_list.kwon?pageNum=${endPage+1}'">다음 목록</button>
			</c:if>
		</div>
		<br>
	</div>
</body>
</html>