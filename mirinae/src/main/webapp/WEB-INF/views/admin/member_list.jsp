<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.form-selectcate {
		  width: 120px;
		  padding: 0.375rem 2.25rem 0.375rem 0.75rem;
		  -moz-padding-start: calc(0.75rem - 3px);
		  font-size: 1rem;
		  font-weight: 400;
		  color: #212529;
		  height:37px;
		  background-color: #fff;
		  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
		  background-repeat: no-repeat;
		  background-position: right 0.75rem center;
		  background-size: 16px 12px;
		  border: 1px solid #ced4da;
		  border-radius: 0.25rem;
		  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
	}
	.form-controllogin {
		  width: 300px;
		  padding: 0.575rem 0.75rem;
		  font-size: 1rem;
		  font-weight: 400;
		  height: 37px;
		  color: #212529;
		  background-color: #fff;
		  background-clip: padding-box;
		  border: 1px solid #ced4da;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
		  border-radius: 0.25rem;
		  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	.mar { margin-bottom: 5px;}
	.topTable {background-color: #2c3e50; color: white; border-radius: 1px;
		 border-collapse: collapse;
 		 border-radius: 10px;
		 text-align: center;
		 border-bottom: 1px solid white;
	}
	th, td {padding-left: 5px; padding-right: 5px; text-align: center; }
	th { border-right: 1px solid white; }
	td { border-bottom: 1px solid black;}
	.red {color: red; }
	.red:hover { cursor: pointer; background: red; color: white;}
	.btn-secondary:disabled, .btn-secondary.disabled {
	  color: #fff;
	  background-color: #f39c12;
	  border-color: #f39c12;
	}
	table { margin-bottom: 20px;}
	#top{color: black; text-align: left; border-bottom: 0px;}
</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	function del(delMid) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../admin/admin_delete.sun?m_id="+delMid+"&pageNum=${pageNum}";
		} else alert("탈퇴 취소");
	};
	
</script>
</head>
<body>
<h2 align="center">전 체 회 원 목 록</h2>
<div align="center">
<pre><span style="color: red">*</span>탈퇴회원도 포함</pre>
</div>
<div align="center" style="margin-top: 20px;">
	<table style="width: 95%;">
		<tr><td colspan="13" id="top">총 회원수는 <b>${total }</b> 명 (탈퇴회원포함)</td></tr>
		<tr>
			<th class="topTable">회원번호</th>
			<th class="topTable">ID</th>
			<th class="topTable">비밀번호</th>
			<th class="topTable">이름</th>
			<th class="topTable">닉네임</th>
			<th class="topTable">생년월일</th>
			<th class="topTable">휴대전화</th>
			<th class="topTable">이메일</th>
			<th class="topTable" >주소</th>
			<th class="topTable">상세주소</th>
			<th class="topTable">회원가입일</th>
			<th class="topTable">탈퇴여부</th>
			<th class="topTable" style="width: 70px;">탈퇴</th>
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
					<td class="red"><a onclick="del('${member.m_id}')">탈퇴</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</div>
	<!-- paging -->
	<div>
		<div align="center">
			<div >
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button  onclick="location.href='member_list.sun?pageNum=${startPage-1}'"
						class="btn btn-primary">
						이전
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button  onclick="location.href='member_list.sun?pageNum=${currentPage - 1}'"
					class="btn btn-primary">
						이전
					</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button
							onclick="location.href='member_list.sun?pageNum=${i}'"
							disabled="disabled" class="btn btn-secondary">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button
							onclick="location.href='member_list.sun?pageNum=${i}'"
							class="btn btn-secondary">${i}</button>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<button onclick="location.href='member_list.sun?pageNum=${currentPage + 1}'"
							class="btn btn-primary">
						다음
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button onclick="location.href='member_list.sun?pageNum=${endPage + 1}'"
					 class="btn btn-primary">
						다음
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->	
<div align="center"; style="margin-top: 20px;">
<form method="post" action="member_search.sun">
	<select name="part" id="part" class="form-selectcate">
		<option value="m_id">ID</option>
		<option value="m_name">이름</option>
		<option value="m_nick">닉네임</option>
		<option value="del">탈퇴여부</option>
	</select>
		<input type="text" name="searchData" id="searchData" required="required" 
				class="form-controllogin" />
		<input type="submit" value="검색" class="btn btn-primary mar"/> 
</form>
</div>
	<div align="center" style="margin-top: 15px;"><input type="button" value="이전 페이지" onclick="location.href='admin_page.sun'"
						class="btn btn-primary"></div>
</body>
</html>