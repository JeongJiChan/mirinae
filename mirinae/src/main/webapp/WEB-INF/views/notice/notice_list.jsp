<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<style type="text/css">
	#n_list { width: 100%; cursor: pointer; }
	.topTable {background-color: #2c3e50; color: white; border-radius: 1px;
			 border-collapse: collapse;
 			 border-radius: 10px;
 			 border-style: hidden;		
		}
	.tableno{ width: 10%; height: 50px;  text-align: center;}
	.tabletitle { width: 55%; text-align: center; }
	.tabletitlenocenter { width:55%; }
	.tabledate{ width: 15%; text-align: center; }
	.tableviewcount { width: 10%; text-align: center; }
	.linewhite { border: 1px solid white; }
	.underline {border-bottom:1px solid; border-bottom-color: #2c3e50 }
	.hover:hover{cursor: pointer; color: #f39c12;}
	.bottommargin { margin-bottom: 20px;}
	#btn { float: right; }
.btn-secondary:disabled, .btn-secondary.disabled {
  color: #fff;
  background-color: #f39c12;
  border-color: #f39c12;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="n_list">
	<h1 class="bottommargin" style="font-size: 56px; line-height: 1.4em; text-align: center;" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<!-- 공지사항 리스트 -->
	<table align="center" width="800px;" class="topTable">
			<tr>
				<th class="tableno linewhite">글번호</th>
				<th class="tabletitle linewhite">제목</th>
				<th class="tabledate linewhite">작성일</th>
				<th class="tableviewcount linewhite">조회수</th>
			</tr>
	</table>
	<table align="center" width="800px;">
		<c:forEach var="notice" items="${list }">
		<c:if test="${notice.no_del == 'n'}"> 
		<c:set var="number" value="${number}"/>

		<c:url value="notice_view.la" var="nl_title">
			<c:param name="no_no" value="${notice.no_no }"/>
			<c:param name="pageNum" value="${currentPage }"/>
		</c:url> <a href=></a>
			<tr>
			<td class="tableno underline">${number }<c:set var="number" value="${number-1 }"/> </td>
			<td class="tabletitlenocenter underline hover" onclick="location.href='${nl_title}'">${notice.no_title }</td>
			<td class="tabledate underline">${notice.no_date}</td>
			<td class="tableviewcount underline">${notice.no_view }</td></tr>
		</c:if>
		</c:forEach>
		<tr><th colspan="4">
		<div align="center" style="margin-top: 7px;">
			<!-- 이전 페이지 버튼 -->
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="btn btn-primary" onclick="location.href='notice_list.la?pageNum=${startPage - 1}'">이전</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="btn btn-primary" onclick="location.href='notice_list.la?pageNum=${currentPage - 1}'">이전	</button>
					</c:if>
			<!-- 페이지 버튼 -->	
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage!= i }">
						<button class="btn btn-secondary" onclick="location.href='notice_list.la?pageNum=${i}'">${i}</button>
					</c:if>
					<c:if test="${currentPage== i }">
						<button class="btn btn-secondary" onclick="location.href='notice_list.la?pageNum=${i}'" disabled="disabled">${i}</button>
					</c:if>
					</c:forEach>
			<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<button class="btn btn-primary" onclick="location.href='notice_list.la?pageNum=${currentPage + 1}'">다음	</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class="btn btn-primary" onclick="location.href='notice_list.la?pageNum=${endPage + 1}'">다음</button> 
					</c:if>
		
				<c:if test="${result != 0 }">
					<button id="btn" class="btn btn-primary" onclick="location.href='notice_writeForm.la'">글쓰기</button>
				</c:if>
			</div>
	</th></tr>
	</table>
</body>
</html>