<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.btnDiv {display: flex;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sp.p_del == 'n'}">
	<div id="n_view">
		<form action="" method="post">
			<input type="hidden" name="sup_no" value="${sp.sup_no }"	>
			<div>
				<img alt="" src="/mirinae/p_images/${sp.p_no }.jpg">
			</div>
			<div>
				<div>
					프로젝트 : ${sp.p_name }
					기   간 : ${sp.s_date } ~ ${sp.e_date }
					목표금액 : <fmt:formatNumber value="${sp.goal_money }" pattern="#,###"/>
					현재금액 : <fmt:formatNumber value="${sp.cur_money }" pattern="#,###"/>
					목표달성률 : <fmt:formatNumber value="${sp.cur_money/sp.goal_money * 100 }" pattern="0.00"/>%
					후원금액 : <fmt:formatNumber value="${sp.total_price }" pattern="#,###"/>
					후원일 : ${sp.sup_date }
					수령인 : ${sp.sup_name }
					배송지 : ${sp.sup_address } ${sp.address_d }
				</div>
			</div>
		</form>
	</div>
</c:if>
	<div class="btnDiv">
		<a href="sup_list.chan?pageNum=${pageNum}">List</a>
	</div>
</body>
</html>