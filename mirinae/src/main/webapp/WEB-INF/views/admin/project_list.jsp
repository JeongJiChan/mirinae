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
	.title:hover {
		text-decoration: underline;
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	/* function del(delMid) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../admin/admin_delete.sun?m_id="+delMid+"&pageNum=${pageNum}";
		} else alert("탈퇴 취소");
	};) */
</script>
</head>
<body>
<h2>전체 프로젝트 목록</h2>
<pre><span style="color: red">*</span>취소된 프로젝트도 포함</pre>
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
			<th>프로젝트번호</th>
			<th>카테고리 코드</th>
			<th>프로젝트명</th>
			<th>등록자명</th>
			<th>후원시작일</th>
			<th>후원마감일</th>
			<th>달성금액</th>
			<th>목표금액</th>
			<th>취소여부</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="13">프로젝트 데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="p" items="${list }">
				<tr>
					<td align="center">${p.p_no}</td>
					<td>${p.cate_code}</td>
					<td class="title" onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.p_name}</td>
					<td>${p.p_writer}</td>
					<td>${p.s_date}</td>
					<td>${p.e_date}</td>
					<td>${p.cur_money}</td>
					<td>${p.goal_money}</td>
					<td>${p.p_del}</td>
					
					<td><a onclick="del('${p.p_no}')">강제취소</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<!-- paging -->
	<div>
		<div class="number">
			<div class="prev_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='project_list.kwon?pageNum=${startPage-1}'">
						이전
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='project_list.kwon?pageNum=${currentPage - 1}'">
						이전
					</button>
				</c:if>
			</div>
			<div class="num_btn">
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button
							onclick="location.href='project_list.kwon?pageNum=${i}'"
							disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button
							onclick="location.href='project_list.kwon?pageNum=${i}'">${i}</button>
					</c:if>
				</c:forEach>
			</div>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='prject_list.kwon?pageNum=${currentPage + 1}'">
						다음
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class="last" onclick="location.href='project_list.kwon?pageNum=${endPage + 1}'">
						다음
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->	
	<div class="goback"><a href="admin_page.sun">이전 페이지</a></div>
</body>
</html>