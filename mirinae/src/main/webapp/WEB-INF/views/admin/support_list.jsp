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
	.delbtn{border: none; background: white; color: red;}
	.delbtn:hover { background: red; color: white;}
</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
</head>
<body>
<c:url var="deleteUrl" value="sup_delete.kwon">
	<c:param name="sup_no" value="${s.sup_no }"/>
	<c:param name="total_price" value="${s.total_price }"/>
	<c:param name="p_no" value="${s.p_no }"/>
	<c:param name="pageNum" value="${pageNum }"/>
</c:url>
<script type="text/javascript">
	function con(del,s_no,price,p_no,num) {
		if (del == 'n') {
			var data = confirm('후원을 취소하시겠습니까?');
			if (data) {
				alert('sup_delete.kwon?sup_no='+s_no+'&p_no='+p_no+'&total_price='+price+'&pageNum='+num);
				location.href='sup_delete.kwon?sup_no='+s_no+'&p_no='+p_no+'&total_price='+price+'&pageNum='+num;
			}
			else return false;	
		}
		else alert('취소된 후원내역입니다');
	}
</script>
<div align="center"><h2>전체 후원 목록</h2></div>
<div align="center"><span style="color: red">&nbsp;&nbsp;&nbsp;*</span>취소한 후원도 포함</div>
		<c:if test="${empty list}">
			<div align="center" style="margin-top: 30px; margin-bottom: 30px;"><h2>후원 데이터가 존재하지 않습니다.</h2></div>
		</c:if>
	<c:if test="${not empty list }">
	<div align="center">

	<table style="width: 95%; margin-top: 30px; margin-bottom: 20px;">
		<tr>
			<th class="topTable">후원번호</th>
			<th class="topTable">회원번호</th>
			<th class="topTable">배송지</th>
			<th class="topTable">상세주소</th>
			<th class="topTable">전화번호</th>
			<th class="topTable">후원날짜</th>
			<th class="topTable">후원자명</th>
			<th class="topTable">프로젝트번호</th>
			<th class="topTable">총액</th>
			<th class="topTable">취소여부</th>
			<th class="topTable">취소 및 환불</th>
		</tr>
			<c:forEach var="s" items="${list }">
				<tr>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'" align="center">${s.sup_no}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'" align="center">${s.m_no}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'">${s.sup_address}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'">${s.address_d}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'">${s.sup_tel}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'">${s.sup_date}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'">${s.sup_name}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'" align="center">${s.p_no}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'">${s.total_price}</td>
					<td onclick="location.href='../admin/sup_view.kwon?sup_no=${s.sup_no}&pageNum=${currentPage  }'" align="center">${s.del }</td>
					<td><button style="width: 100%;" class="delbtn" onclick="con('${s.del }','${s.sup_no }','${s.total_price }','${s.p_no }','${pageNum }')">취소</button></td>
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
					<button onclick="location.href='support_list.kwon?pageNum=${startPage-1}'"
						class="btn btn-primary">
						이전
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button onclick="location.href='support_list.kwon?pageNum=${currentPage - 1}'"
					 class="btn btn-primary">
						이전
					</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button
							onclick="location.href='support_list.kwon?pageNum=${i}'"
							disabled="disabled" class="btn btn-secondary">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button
							onclick="location.href='support_list.kwon?pageNum=${i}'"
							class="btn btn-secondary">${i}</button>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<button onclick="location.href='support_list.kwon?pageNum=${currentPage + 1}'"
					 class="btn btn-primary">
						다음
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button onclick="location.href='support_list.kwon?pageNum=${endPage + 1}'"
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