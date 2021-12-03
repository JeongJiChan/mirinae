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
	#prolist { margin-left: 13%; margin-right: 10%;}
	h4 { display: inline; color: #3498db; }
	.underline {border-bottom: 1px solid #2c3e50; }
	h3 { margin-left: 5px; margin-top: 10px; margin-bottom: 0px; }
	.bdate { font-size: 17pt; color: #3498db;}
	.timeimg{width: 20px; height: 20px; margin-bottom: 5px;}
	.endpro {font-size: 16pt; color: red; }	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<c:if test="${empty project }">
		<h1 align="center">등록된 프로젝트가 없습니다.</h1>
</c:if>
<div id="prolist">
<c:if test="${not empty project }">
		<c:forEach var="pro" items="${project }">
		<c:if test="${pro.p_del != 'y' }">
			<c:set var="i" value="${i+1 }"></c:set>
			<table id="table" class="topTable">
			<tr><th id="table_picture" colspan="2">
			<a href="p_view.kim?p_no=${pro.p_no }">
			<img id="image" src="/mirinae/p_images/${pro.p_no }.jpg" onerror="this.src='/mirinae/p_images/ximg.jpg'">
			</a></th></tr>
			<tr><td colspan="2"><h3 style="display: inline;">${pro.p_name }</h3>
			
							<c:if test="${pro.p_date >= 0 }">
								<div style="display: inline; float: right;">
								<img class="timeimg" alt="" src="/mirinae/p_images/timeicon.png">
								<span>시작</span><span class="bdate"> ${pro.p_date }</span><span>일 전</span></div>
							</c:if>
							<c:if test="${pro.b_date >= 0 && pro.p_date < 0}">
								<div style="display: inline; float: right;">
								<img class="timeimg" alt="" src="/mirinae/p_images/timeicon.png">
								<span>종료</span><span class="bdate"> ${pro.b_date }</span><span>일 전</span></div>
							</c:if>
							<c:if test="${pro.b_date < 0 }">
								<div style="display: inline; float: right;"><span class="endpro">마감</span></div>
							</c:if>
							
							</td></tr>		
			<tr><td colspan="2" class="underline">
				<c:if test="${pro.cate_code == 100 }">의류</c:if>
				<c:if test="${pro.cate_code == 200 }">가전</c:if>
				<c:if test="${pro.cate_code == 300 }">기타</c:if>
			</td></tr>
			<tr><th colspan="2"><h4 style="margin-right: 20px;"><fmt:formatNumber value="${pro.cur_money/pro.goal_money * 100 }" pattern="0.00"/>%</h4>
							<fmt:formatNumber value="${pro.goal_money }" pattern="#,###" />원</th></tr>
			</table>
		</c:if>
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