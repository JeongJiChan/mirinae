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
	table { margin: 2%; text-align: center;}
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
	#prolist { margin-left: 13%; margin-right: 13%;}
/* 	.topTable {background-color: #2c3e50; color: white; border-radius: 1px; */
/* 			 border-collapse: collapse; */
/*  			 border-radius: 10px; */
/*  			 border-style: hidden;		 */
/* 		} */
	th, td { border: 1px solid black;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('select').change(function() {
			if($('#cate').prop("select", true)){
				 var value = $(this).val();
				 if(value == 0){
					 location.href="p_list.kim"; 
				 }else{
				 location.href="p_cateView.kim?cate_code="+value;
				 }
			}
		});	
	});
</script>
</head>
<body>
<div>카테고리 <select id="cate">
			<option value="0">전체보기</option>
			<option value="100">의류</option>
			<option value="200">가전</option>
			<option value="300">기타</option>	
			</select> </div>
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
			<tr><th colspan="2">목표 달성률 : <fmt:formatNumber value="${pro.cur_money/pro.goal_money * 100 }" pattern="0.00"/>%</th></tr>
			<tr><th colspan="2">제목 : ${pro.p_name }</th></tr>	
			<tr><th colspan="2"><b><fmt:formatNumber value="${pro.cur_money/pro.goal_money * 100 }" pattern="0.00"/>%</b>목표금액 : <fmt:formatNumber value="${pro.goal_money }" pattern="#,###" />원</th></tr>
			<tr><th colspan="2">기간 : ${pro.s_date } ~ ${pro.e_date }</th></tr>
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