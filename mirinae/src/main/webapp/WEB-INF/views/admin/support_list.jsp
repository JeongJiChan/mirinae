<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table,tr,th,td { border: 1px solid black; }
	.prev_btn, .num_btn, .next_btn { float: left; margin: 10px; }
	.goback { clear: both; }
	.number { align: center;}
	.support:hover { 
		text-decoration: underline;
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
</head>
<body>
<h2>전체 후원 목록</h2>
<pre><span style="color: red">&nbsp;&nbsp;&nbsp;*</span>취소한 후원도 포함</pre>
<!-- <form method="post" action="searchMember.sun">
	<select name="part">
		<option value="id">ID</option>
		<option value="name">이름</option>
	</select>
		<input type="text" name="searchData" required="required"/>
		<input type="submit" value="검색" /> 
</form> -->

	<table>
		<tr>
			<th>후원번호</th>
			<th>회원번호</th>
			<th>배송지</th>
			<th>상세주소</th>
			<th>전화번호</th>
			<th>후원날짜</th>
			<th>후원자명</th>
			<th>프로젝트번호</th>
			<th>총액</th>
			<th>취소여부</th>
			<th>취소 및 환불</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="13">후원 데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="s" items="${list }">
				<tr>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'" align="center">${s.sup_no}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'" align="center">${s.m_no}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'">${s.sup_address}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'">${s.address_d}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'">${s.sup_tel}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'">${s.sup_date}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'">${s.sup_name}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'" align="center">${s.p_no}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'">${s.total_price}</td>
					<td class="support" onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}'" align="center">${s.del }</td>
					<th><button onclick="location.href='../admin/sup_delete.kwon?sup_no=${s.sup_no}&p_no=${s.p_no}&total_price=${s.total_price }'">취소</button></th>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<!-- paging -->
	<div align="center">
		<div class="number">
			<div class="prev_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='support_list.kwon?pageNum=${startPage-1}'">
						이전
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='support_list.kwon?pageNum=${currentPage - 1}'">
						이전
					</button>
				</c:if>
			</div>
			<div class="num_btn">
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button
							onclick="location.href='support_list.kwon?pageNum=${i}'"
							disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button
							onclick="location.href='support_list.kwon?pageNum=${i}'">${i}</button>
					</c:if>
				</c:forEach>
			</div>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='support_list.kwon?pageNum=${currentPage + 1}'">
						다음
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class="last" onclick="location.href='support_list.kwon?pageNum=${endPage + 1}'">
						다음
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->	
	<div class="goback"><a href="admin_page.sun">이전 페이지</a></div>
</body>
</html>