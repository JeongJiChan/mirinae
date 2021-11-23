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
</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	function del(delMid) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../member/admin_delete.sun?m_id="+delMid;
		} else alert("탈퇴 취소");
	}
</script>
</head>
<body>
<h2>전 체 회 원 목 록</h2>
<pre><span style="color: red">*</span>탈퇴회원도 포함</pre>
	<table>
		<tr>
			<th>회원번호</th>
			<th>ID</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>생년월일</th>
			<th>휴대전화</th>
			<th>이메일</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>회원가입일</th>
			<th>탈퇴여부</th>
			<th>탈퇴</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="13">회원데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="member" items="${list }">
				<tr>
					<td>${member.m_no}</td>
					<td>${member.m_id}</td>
					<td>${member.m_pass}</td>
					<td>${member.m_name}</td>
					<td>${member.m_nick}</td>
					<td>${member.birth}</td>
					<td>${member.tel}</td>
					<td>${member.m_email}</td>
					<td>${member.address}</td>
					<td>${member.address_d}</td>
					<td>${member.reg_date}</td>
					<td>${member.del}</td>
					<td><a onclick="del(${member.m_id})">탈퇴</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<!-- paging -->
	<div>
		<div>
			<div class="prev_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='member_list.sun?pageNum=${startPage-1}'">
						이전
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='member_list.sun?pageNum=${currentPage - 1}'">
						이전
					</button>
				</c:if>
			</div>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='member_list.sun?pageNum=${i}'">${i}</span>
			</c:forEach>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='member_list.sun?pageNum=${currentPage + 1}'">
						다음
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class="last" onclick="location.href='member_list.sun?pageNum=${endPage + 1}'">
						다음
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->	
	<div><a href="admin_page.sun">이전</a></div>
</body>
</html>