<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#mp_list { width: 100%; cursor: pointer; }
	.item {width: 100%; height: 310px; }
	.mycontent {width:65%; margin: auto;}
	.p_content {width:100%; }
	.pick_items{float: left; margin:10px; width: 30%;}
	#p_name {font-weight: bold; font-size: 18px;}
	.btnlist{position: relative;}
	.btn {width: 100%; bottom: 100px; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mp_list">
	<h1 class="mp_title" style="text-align:center" onclick="location.href='mypick_list.la'">My Pick</h1>
</div>
<div class="mycontent">
	<c:if test="${pick_list.size() == 0  }">
		마이픽 프로젝트가 없습니다.
	</c:if>
	<c:if test="${pick_list.size() != 0  }">
			<c:forEach var="list" items="${ pick_list}">
				<div class="pick_items" id=${list.p_no }>
					<div class="p_img">
						<a href="/mirinae/views/project/p_view.kim?p_no=${list.p_no }">
							<img alt="${list.p_name }" src="/mirinae/p_images/${list.p_no }.jpg" class="item">
						</a>
					</div>
					<div class="p_content">
							<div id="p_name">${list.p_name }</div>
							<div>목표 금액 : <fmt:formatNumber value="${list.goal_money }" pattern="#,###" /> 원</div>
							<div>현재 후원 금액 : <fmt:formatNumber value="${list.cur_money }" pattern="#,###" /> 원</div>
							<div>프로젝트 기간 : ${list.s_date } ~ ${list.e_date }</div>
					</div>
				</div>
			</c:forEach>
	</c:if>
	</div>
	<div class="btn">
		<div id="btnlist" align="center">
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button onclick="location.href='p_list.kim?pageNum=${startPage-1 }'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${endPage }">
				<c:if test="${currentPage == i }">
					<button onclick="location.href='p_list.kim?pageNum=${i}'" disabled="disabled">${i }</button>
				</c:if>
				<c:if test="${currentPage != i }">
					<button onclick="location.href='p_list.kim?pageNum=${i}'">${i }</button>	
				</c:if>
			</c:forEach>
			<c:if test="${endPage < totalPage }">
				<button onclick="location.href='p_list.kim?pageNum=${endPage+1 }'">다음</button>
			</c:if>
		</div>
	</div>
</body>
</html>