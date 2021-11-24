<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#mp_list { width: 100%; cursor: pointer; }
	.item {width: 32%; height: 310px; }
	.content {width:65%; margin: auto;}
	.p_content {width:32%; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mp_list">
	<h1 class="mp_title" style="text-align:center" onclick="location.href='mypick_list.la'">My Pick</h1>
</div>
<div class="content">
	<c:if test="${pick_list.size() == 0  }">
		마이픽 프로젝트가 없습니다.
	</c:if>
	<c:if test="${pick_list.size() != 0  }">
			<c:forEach var="list" items="${ pick_list}">
				<div class="pick_items">
					<div class="p_img">
						<a href="/mirinae/views/project/p_view.kim?p_no=${list.p_no }">
							<img alt="${list.p_name }" src="/mirinae/p_images/${list.p_no }.jpg" class="item">
						</a>
					</div>
					<div class="p_content">
						<ul>
							<li>프로젝트명 : ${list.p_name }</li>
							<li>목표 금액 : <fmt:formatNumber value="${list.goal_money }" pattern="#,###" /></li>
							<li>현재 후원 금액 : <fmt:formatNumber value="${list.cur_money }" pattern="#,###" /></li>
							<li>프로젝트 기간 : ${list.s_date } ~ ${list.e_date }</li>
						</ul>
					</div>
				</div>
			</c:forEach>
	</c:if>
</div>
</body>
</html>