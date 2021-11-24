<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#s_subject { width: 100%; cursor: pointer; }
	div.item { display : flex; justify-content: flex-start; margin:auto; }
	table { border: 1px solid black; margin: 20px;}
	tr th { border: 1px solid black; }
	#image { width: 100%; height: 310px; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table id="table">
			<c:forEach var="list" items="${sp_list }">
				<tr><th colspan="2"><a href="sup_view.chan?sup_no=${list.sup_no }&pageNum=${currentPage }"><img id="image" src="/mirinae/p_images/${list.p_no }.jpg"></a></th></tr>
				<tr><th>목표금액 : <fmt:formatNumber value="${list.goal_money }" pattern="#,###" /></th><th>현재금액 : <fmt:formatNumber value="${list.cur_money }" pattern="#,###" /></th></tr>
				<tr><th colspan="2">목표 달성률 : <fmt:formatNumber value="${list.cur_money/list.goal_money * 100 }" pattern="0.00"/>%</th></tr>
				<tr><th colspan="2">기간 : ${list.s_date } ~ ${list.e_date }</th></tr>
				<tr><th>후원번호 : ${list.sup_no }</th><th id="s_subject"><a href="sup_view.chan?sup_no=${list.sup_no }&pageNum=${currentPage }">프로젝트 : ${list.p_name }</a></th></tr>
				<tr><th>후원일 : ${list.sup_date }</th><th>후원금액 : <fmt:formatNumber value="${list.total_price }" pattern="#,###" /></th></tr>
			</c:forEach>
		</table>
	</div>
	<div class="item" align="center">
		<!-- 이전 페이지 버튼 -->
		<c:if test="${startPage > PAGE_PER_BLOCK}">
			<button class="first" onclick="location.href='support_list.chan?pageNum=${startPage - 1}">이전</button> 
		</c:if>
		<c:if test="${pageNum > 1}">
			<button class="prev" onclick="location.href='support_list.chan?pageNum=${currentPage - 1}">이전	</button>
		</c:if>
		<!-- 페이지 버튼 -->	
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<button id="page${i}" class="page_num" onclick="location.href='support_list.chan?pageNum=${i}">${i}</button>
		</c:forEach>
		<!-- 다음 페이지 버튼 -->
		<c:if test="${currentPage < totalPage}">
			<button class="next" onclick="location.href='support_list.chan?pageNum=${currentPage + 1}">다음	</button>
		</c:if>
		<c:if test="${endPage < totalPage}">
			<button class=last onclick="location.href='support_list.chan?pageNum=${endPage + 1}">다음</button> 
		</c:if>
	</div>
</body>
</html>