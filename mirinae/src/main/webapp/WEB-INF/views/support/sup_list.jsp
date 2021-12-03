<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#s_subject { width: 100%; cursor: pointer; }
	#btnlist {clear: both; bottom: 0; width: 100%; }
	.btn-secondary:disabled, .btn-secondary.disabled {
	  color: #fff;
	  background-color: #f39c12;
	  border-color: #f39c12;
	}
	table { margin: 2%;}
	#table { width: 28%; float: left; table-layout: fixed;}
	#image { width: 100%; height: 290px; border-radius: 1px;
			 border-collapse: collapse;
 			 border-radius: 10px;
 			 cursor: pointer;
 			 }
	.sup_list { margin-left: 20%; margin-right: 20%; }
	.sup_list a:active { color: black; }
	.sup_list a:hover { color: black; }
	.sup_list a:visited { color: black; }
	.sup_list a:link { color: black; }
	.sup_list a { text-decoration: none; }
	#s_subject { font-size: 30px; font-weight: bold; }
	h4 { display: inline; color: #3498db; margin-right: 20px; }
	.underline {border-bottom: 1px solid #2c3e50; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty sp_list }">
		<h1 align="center">후원한 프로젝트가 없습니다.</h1>
	</c:if>
	<div class="sup_list">
		<c:if test="${not empty sp_list }">
			<c:forEach var="list" items="${sp_list }">
				<table id="table">
					<tr>
						<th colspan="2"><a href="sup_view.chan?sup_no=${list.sup_no }&pageNum=${currentPage }">
							<img id="image" src="/mirinae/p_images/${list.p_no }.jpg"></a>
						</th>
					</tr>
					<tr>
						<th id="s_subject" colspan="2" class="underline">
							<a href="sup_view.chan?sup_no=${list.sup_no }&pageNum=${currentPage }">${list.p_name }</a>
						</th>
					</tr>
					<tr>
						<td colspan="2">
							<h4><fmt:formatNumber value="${list.cur_money/list.goal_money * 100 }" pattern="0.00"/>%</h4> ${list.goal_money }원
						</td>
					</tr>
					<tr>
						<td colspan="2">
							기간 : ${list.s_date } ~ ${list.e_date }
						</td>
					</tr>
					<tr>
						<td>
							후원일 : ${list.sup_date }
						</td>
						<td>
							후원금액 : <fmt:formatNumber value="${list.total_price }" pattern="#,###" />
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</div>
	<div id="btnlist" align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-secondary" onclick="location.href='p_list.kim?pageNum=${startPage-1 }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${ startPage }" end="${endPage }">
			<c:if test="${currentPage == i }">
				<button class="btn btn-secondary" onclick="location.href='p_list.kim?pageNum=${i}'" disabled="disabled">${i }</button>
			</c:if>
			<c:if test="${currentPage != i }">
				<button class="btn btn-secondary" onclick="location.href='p_list.kim?pageNum=${i}'">${i }</button>	
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-secondary" onclick="location.href='p_list.kim?pageNum=${endPage+1 }'">다음</button>
		</c:if>
	</div>
</body>
</html>