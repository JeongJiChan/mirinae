<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table { margin: 2%;}
	#table { width: 28%; float: left; table-layout: fixed;}
	#image { width: 100%; height: 290px; border-radius: 1px;
			 border-collapse: collapse;
 			 border-radius: 10px;
 			 }
	#btnlist {clear: both; bottom: 0; width: 100%; }
	.btn-secondary:disabled, .btn-secondary.disabled {
	  color: #fff;
	  background-color: #f39c12;
	  border-color: #f39c12;
	}
	#prolist { margin-left: 20%; margin-right: 20%;}
	h4 { display: inline; color: #3498db; }
	.underline {border-bottom: 1px solid #2c3e50; }
	.proname { margin-left: 5px; margin-top: 10px; margin-bottom: 0px; font-size: 23px}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div id="mp_list">
	<h1 class="mp_title" style="text-align:center" onclick="location.href='mypick_list.la'">My Pick</h1>
</div>
<c:if test="${pick_list.size() == 0  }">
		<h1 align="center">등록된 프로젝트가 없습니다.</h1>
</c:if>
<div id="prolist">
<c:if test="${pick_list.size() != 0  }">
		<c:forEach var="list" items="${pick_list }">
			<c:set var="i" value="${i+1 }"></c:set>
			<table id="table" class="topTable">
			<tr><th id="table_picture" colspan="2">
			<a href="/mirinae/views/project/p_view.kim?p_no=${list.p_no }">
			<img id="image" src="/mirinae/p_images/${list.p_no }.jpg" onerror="this.src='/mirinae/p_images/ximg.jpg'">
			</a></th></tr>
			<tr><td colspan="2"><div class="proname" style="display: inline;"><b>${list.p_name }</b></div>	</td></tr>	
			<tr><td colspan="2" class="underline">
				<c:if test="${list.cate_code == 100 }">의류</c:if>
				<c:if test="${list.cate_code == 200 }">가전</c:if>
				<c:if test="${list.cate_code == 300 }">기타</c:if>
			</td></tr>
			<tr><th colspan="2"><h4 style="margin-right: 20px;"><fmt:formatNumber value="${list.cur_money/list.goal_money * 100 }" pattern="0.00"/>%</h4>
							<fmt:formatNumber value="${list.goal_money }" pattern="#,###" />원</th></tr>
			</table>
		</c:forEach>
	</c:if>
</div>
<div id="btnlist" align="center">
<c:if test="${startPage > PAGE_PER_BLOCK }">
	<button class="btn btn-primary" onclick="location.href='mypick_list.la?pageNum=${startPage-1 }'">이전</button>
</c:if>
<c:forEach var="i" begin="${ startPage }" end="${endPage }">
	<c:if test="${currentPage == i }">
		<button class="btn btn-secondary" onclick="location.href='mypick_list.la?pageNum=${i}'" disabled="disabled">${i }</button>
	</c:if>
	<c:if test="${currentPage != i }">
		<button class="btn btn-secondary" onclick="location.href='mypick_list.la?pageNum=${i}'">${i }</button>	
	</c:if>
</c:forEach>
<c:if test="${endPage < totalPage }">
	<button class="btn btn-primary" onclick="location.href='mypick_list.la?pageNum=${endPage+1 }'">다음</button>
</c:if>
</div>
</body>
</html>