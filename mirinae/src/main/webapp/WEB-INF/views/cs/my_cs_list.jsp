<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../decorator/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<style type="text/css">
	th { text-align: center; }
	.caption {	width: 100%;	}
	.topTable {background-color: #2c3e50; color: white; border-radius: 1px;
			 border-collapse: collapse;
 			 border-radius: 10px;
 			 border-style: hidden;		
		}
	.linewhite { border: 1px solid white; }
	.underline {border-bottom:1px solid; border-bottom-color: #2c3e50 }
	.btnheight {height: 35px;}
	.tableno{ width: 10%; height: 50px;  text-align: center;}
	.tabletitle { width: 55%; }
	.tablewirter{ width: 10%; text-align: center; }
	.tabledate{ width: 15%; text-align: center; }
	.tableviewcount { width: 10%; text-align: center; }
	.topmargin {margin-top: 7px; }
	.hover:hover{cursor: pointer; color: #f39c12;}
	.bottommargin { margin-bottom: 20px;}
	.btn-secondary:disabled, .btn-secondary.disabled {
	  color: #fff;
	  background-color: #f39c12;
	  border-color: #f39c12;
	}	
</style>
</head>
<body>
	<div class="caption">
		<h1 class="bottommargin" style="font-size: 56px; line-height: 1.4em; text-align: center;">${m_name }님의 문의내역</h1>
	</div>
		<table align="center" width="800px;" class="topTable">
			<tr>
				<th class="tableno linewhite">글번호</th>
				<th class="tabletitle linewhite">제목</th>
				<th class="tablewirter linewhite">작성자</th>
				<th class="tabledate linewhite">작성일</th>
				<th class="tableviewcount linewhite">조회수</th>
			</tr>
		</table>
		<table align="center" width="800px;">
				<c:if test="${empty list }">
					<h3 align="center" style="margin-top: 10px;">문의내역이 없습니다</h3>
				</c:if>
				<c:if test="${not empty list}">
				<c:forEach var="cs" items="${list }">
					<tr>
						<td class="tableno underline">${cs.cs_no}<c:set var="number"
								value="${cs.cs_no - 1}"></c:set></td>	
						<c:if test="${cs.cs_del=='y' }">
							<th colspan="4" style="border-bottom: 1px solid black;">삭제된 게시글입니다</th>
						</c:if>
						<c:if test="${cs.cs_del != 'y' }">		
							<td
								onclick="location.href='my_cs_view.kwon?cs_no=${cs.cs_no}&pageNum=${currentPage}'"
								class="tabletitle underline hover">
								<c:if test="${cs.cs_re_level > 0 }">
								<img alt="" src="/mirinae/images/level.gif" height="5"
									width="${cs.cs_re_level*10 }">
									<img alt="" src="/mirinae/images/re.gif" height="5">
								</c:if>
								${cs.cs_title }</td>
							<td class="tablewirter underline">${cs.cs_writer }</td>
							<td class="tabledate underline">${cs.cs_reg_date }</td>
							<td class="tableviewcount underline">${cs.cs_view }</td>
						</c:if>
					</tr>
				</c:forEach>
				</c:if>
			<tr><th colspan="5">
				<div align="center" class="topmargin">
					<div style="display: inline;">
						<!-- 이전 -->
						<c:if test="${startPage > PAGE_PER_BLOCK }">
							<button class="btn btn-secondary"
								onclick="location.href='my_cs_list.kwon?pageNum=1'">처음으로</button>
						</c:if>
						<c:if test="${pageNum > 1}">
							<button class="btn btn-primary"
								onclick="location.href='my_cs_list.kwon?pageNum=${currentPage-1}'">이전</button>
						</c:if>
						<!-- 페이지 -->
							<c:if test="${endPage == 0}">
								<button class="btn btn-secondary"
									disabled="disabled">1</button>
							</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${currentPage== i}">
								<button class="btn btn-secondary"
									onclick="location.href='my_cs_list.kwon?pageNum=${i}'"
									disabled="disabled">${i}</button>
							</c:if>
							<c:if test="${currentPage!= i }">
								<button class="btn btn-secondary"
									onclick="location.href='my_cs_list.kwon?pageNum=${i}'">${i}</button>
							</c:if>
						</c:forEach>
						<!-- 다음 -->
						<c:if test="${currentPage < totalPage}">
							<button class="btn btn-primary"
								onclick="location.href='my_cs_list.kwon?pageNum=${currentPage + 1}'">다음</button>
						</c:if>
						<!-- 보여줄 것이 남아있다 -->
						<c:if test="${endPage < totalPage }">
							<button class="btn btn-primary"
								onclick="location.href='my_cs_list.kwon?pageNum=${endPage+1}'">다음 목록</button>
						</c:if>
					</div>
		</th></tr>
		</table>
</body>
</html>