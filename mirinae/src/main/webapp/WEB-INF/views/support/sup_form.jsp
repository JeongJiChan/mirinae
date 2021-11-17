<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#img_area { height: 400px; width: 450px; border: 1px solid black; width: 100%; }
	tr, th, td { border: 0px; margin: 10px; padding: 20px; }
	input { height: 30px; }
</style>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document.getElementById("address_kakao").addEventListener("click", function() { //주소입력칸을 클릭하면
			//카카오 지도 발생
			new daum.Postcode({
				oncomplete : function(data) { //선택시 입력값 세팅
					document.getElementById("address_kakao").value = data.address; // 주소 넣기
					document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
				}
			}).open();
		});
	}
</script>
</head>
<body>
	<form action="sup_action.chan" method="post">
		<input type="hidden" value="${p_no }">
		<input type="hidden" value="${m_no }">
		<input type="hidden" value="${p_name }">
		<input type="hidden" value="${opt_name }">
		<input type="hidden" value="${supd_cnt }">
		<input type="hidden" value="${total_price }">
		<div align="center">
			<table>
				<tr>
					<td colspan="2" width="100%"><div id="img_area"></div></td>
				</tr>
				<tr>
				${item.price }
					<td colspan="2">${p_name }</td>
				</tr>
				<tr>
					<td colspan="2">${result }</td>
				</tr>
				<tr>
					<td colspan="2">총 금액 : ${total_price }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="m_name" placeholder="프로젝트 받는 분" required="required" size="100%"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="tel" name="m_tel"  placeholder="프로젝트 받는 분 전화번호" required="required" size="100%"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="address_kakao" name="address" required="required" readonly="readonly" placeholder="프로젝트 받는 분 주소" size="100%"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="address_detail" required="required"  placeholder="상세주소" size="100%"></td>
				</tr>
				<tr>
					<th><input type="submit" value="후원"></th>
					<th><input type="button" value="취소"></th>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>