<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.topTable {background-color: #2c3e50; color: white; border-radius: 1px;
		 border-collapse: collapse;
 		 border-radius: 10px;
		 text-align: center;
		 border-bottom: 1px solid white;
	}
	th, td {padding-left: 5px; padding-right: 5px; text-align: center; }
	th { border-right: 1px solid white; }
	td { border-bottom: 1px solid black;}
	.btn-secondary:disabled, .btn-secondary.disabled {
	  color: #fff;
	  background-color: #f39c12;
	  border-color: #f39c12;
	}
	table { margin-bottom: 20px;}
	.red {color: red; }
	.red:hover { cursor: pointer; background: red; color: white;}
</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	
	function del(delMid) {
		var con = confirm("취소 처리 하시겠습니까?");
		if(con) {
			location.href="../admin/p_del.kwon?p_no="+delMid;
		} 
	};
</script>
</head>
<body>
<div align="center"><h2>전체 프로젝트 목록</h2></div>
<div align="center"><span style="color: red">&nbsp;&nbsp;&nbsp;*</span>취소된 프로젝트도 포함</div>

		<c:if test="${empty list}">
		
				<div align="center" style="margin-top: 30px; margin-bottom: 30px;"><h2>프로젝트 데이터가 존재하지 않습니다.</h2></div>
		
		</c:if>
	<c:if test="${not empty list }">
	<div align="center">
	<table style="margin-top: 30px; width: 95%;">
		<tr>
			<th class="topTable">프로젝트번호</th>
			<th class="topTable">카테고리 코드</th>
			<th class="topTable">프로젝트명</th>
			<th class="topTable">등록자명</th>
			<th class="topTable">후원시작일</th>
			<th class="topTable">후원마감일</th>
			<th class="topTable">달성금액</th>
			<th class="topTable">목표금액</th>
			<th class="topTable">취소여부</th>
			<th class="topTable">취소</th>
		</tr>
			<c:forEach var="p" items="${list }">
				<tr>
					<td align="center" class="title" onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.p_no}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.cate_code}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.p_name}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.p_writer}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.s_date}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.e_date}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.cur_money}</td>
					<td  onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.goal_money}</td>
					<td  align="center" onclick="location.href='../project/p_view.kim?p_no=${p.p_no}'">${p.p_del}</td>
					<td class="red"><a onclick="del('${p.p_no}')">강제취소</a></td>
				</tr>
			</c:forEach>	
	</table>
	</div>
	</c:if>
	<!-- paging -->
	<div>
		<div align="center">
			<div>
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button onclick="location.href='project_list.kwon?pageNum=${startPage-1}'"
						class="btn btn-primary">
						이전
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button onclick="location.href='project_list.kwon?pageNum=${currentPage - 1}'"
					class="btn btn-primary">
						이전
					</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button
							onclick="location.href='project_list.kwon?pageNum=${i}'"
							disabled="disabled" class="btn btn-secondary">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button
							onclick="location.href='project_list.kwon?pageNum=${i}'" class="btn btn-secondary">${i}</button>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<button class="btn btn-primary" onclick="location.href='project_list.kwon?pageNum=${currentPage + 1}'">
						다음
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class="btn btn-primary" onclick="location.href='project_list.kwon?pageNum=${endPage + 1}'"
					 class="btn btn-primary">
						다음
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->	
		<div align="center" style="margin-top: 15px;"><input type="button" value="이전 페이지" onclick="location.href='admin_page.sun'"
						class="btn btn-primary"></div>
</body>
</html>