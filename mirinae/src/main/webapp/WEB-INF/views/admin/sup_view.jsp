<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#s_view { margin-left: 20%; margin-right: 20%; display: flex; justify-content: center; padding: 0px;}
	.t_view { width: 100%; }
	h3 { display: inline; color: #3498db; margin-right: 20px; }	
	span { margin-right: 20px; }
	.underline { border-bottom: 1px solid black; }
	.leftpa { padding-left: 20px;}
	.topTable {background-color: #2c3e50; color: white; 
		 border-collapse: collapse;
 		 border-radius: 10px;
		 text-align: center;
		 border-bottom: 1px solid white;
		 height: 30px;
		 width: 18%;
	}
	.imageArea { height: 600px; width: 100%; }
	.imageArea img { height: 600px; width: 100%; }
 	.tableMain { width: 100%; }
 	.form { width: 100%; }
 	#button { margin-top: 10px; }
 	#a { font-size: 30px; text-decoration: none; }
 	#a:active { color: black; }
	#a:hover { color: black; }
	#a:visited { color: black; }
	#a:link { color: black; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body>
<c:url var="deleteUrl" value="sup_delete.kwon">
	<c:param name="sup_no" value="${sp.sup_no }"/>
	<c:param name="total_price" value="${sp.total_price }"/>
	<c:param name="p_no" value="${sp.p_no }"/>
	<c:param name="pageNum" value="${pageNum }"/>
</c:url>
<c:url var="projectView" value="/views/project/p_view.kim">
	<c:param name="p_no" value="${sp.p_no }"></c:param>
</c:url>
<script type="text/javascript">
	function con(del) {
		if (del == 'n') {
			var data = confirm('후원을 취소하시겠습니까?');
			if (data) {
				location.href='${deleteUrl }'
			}
			else return false;
		}
		else alert('취소된 후원내역입니다');
	}
</script>
<c:if test="${sp.p_del == 'n'}">
	<div id="s_view">
			<form action="" method="post" class="form">
				<input type="hidden" name="sup_no" value="${sp.sup_no }"	>
				<div class="imageArea">
					<a href="${projectView }"><img alt="" src="/mirinae/p_images/${sp.p_no }.jpg"></a>
				</div>
				<div class="t_view">
					<table class="tableMain">
						<tr>
							<th colspan="4">
								<h3><fmt:formatNumber value="${sp.cur_money/sp.goal_money * 100 }" pattern="0.00"/>%</h3><a id="a" href="${projectView }">${sp.p_name }</a>
							</th>
						</tr>
						<tr>
							<th class="topTable">
								목표 금액
							</th>
							<td class="leftpa underline">
								<fmt:formatNumber value="${sp.goal_money }" pattern="#,###"/>
							</td>
							<th class="topTable">
								현재 금액
							</th>
							<td class="leftpa underline">
								<fmt:formatNumber value="${sp.cur_money }" pattern="#,###"/>
							</td>
						</tr>
						<tr>
							<th class="topTable">
								후원 기간
							</th>
							<td class="leftpa underline">
								${sp.s_date } ~ ${sp.e_date }
							</td>
							<th class="topTable">
								후원 일자
							</th>
							<td class="leftpa underline">
								${sp.sup_date }
							</td>
						</tr>
						<tr id="last">
							<th class="topTable">
								수령인
							</th>
							<td class="leftpa underline">
								${sp.sup_name }
							</td>
							<th class="topTable">
								배송지
							</th>
							<td class="leftpa underline">
								${sp.sup_address } ${sp.address_d }
							</td>
						</tr>
						<tr>
							<th class="topTable">
								후원 내역
							</th>
							<td class="leftpa underline" colspan="3">
								${result }<p>
								총액 <fmt:formatNumber value="${sp.total_price }" pattern="#,###"/>원
							</td>
						</tr>	
					</table>
				</div>
			</form>
		</div>
	</c:if>
	<div align="center" id="button">
		<input type="button" value="목록" onclick="location.href='support_list.kwon?pageNum=${pageNum}'" class="btn btn-primary optmargin">
		<input type="button" value="취소" onclick="con('${sp.del }')" class="btn btn-primary optmargin">
	</div>
</body>
</html>