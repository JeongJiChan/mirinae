<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#img_area { height: 400px; width: 450px; border: 1px solid black; width: 100%; }
	tr, th, td { border: 0px; }
	.mainTable input { height: 30px; width: 90%; }
	#button { margin-top: 10px; }
	.subject { font-size: 30px; }
	.topTable {background-color: #2c3e50; color: white; 
		 border-collapse: collapse;
 		 border-radius: 10px;
		 text-align: center;
		 border-bottom: 1px solid white;
		 height: 30px;
		 width: 18%;
		 border-bottom: 5px solid white;
	}
	h2 { display: inline; color: #3498db; margin-right: 20px; }	
	.mainTable { margin-left: 20%; margin-right: 20%; }	
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
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body>
	<form action="sup_result.chan" method="post">
		<input type="hidden" name="m_no" value="${m_no }">
		<input type="hidden" name="opt_code" value="${opt_code }">
		<input type="hidden" name="supd_cnt" value="${supd_cnt }">
		<input type="hidden" name="p_no" value="${p_no }">
		<input type="hidden" name="opt_price" value="${opt_price }">
		<input type="hidden" name="total_price" value="${total_price }">
		<div align="center" class="mainTable">
			<table style="width: 70%;">
				<tr>
					<td colspan="4" width="100%"><img id="img_area" alt="" src="/mirinae/p_images/${p_no }.jpg"></td>
				</tr>
				<tr>
					<td colspan="4" style="border-bottom: 10px solid white;">
						<h2><fmt:formatNumber value="${per }" pattern="0.00"/>%</h2>
						<span class="subject">${p_name }</span>
					</td>
				</tr>
				<tr>
					<th class="topTable">이름</th>
					<td style="border-bottom: 5px solid white; padding-left: 10px; width: 40%;"><input type="text" name="sup_name" placeholder="프로젝트 받는 분" required="required"></td>
					<th class="topTable" colspan="2">내역</th>
				</tr>
				<tr>
					<th class="topTable">전화번호</th>
					<td style="border-bottom: 5px solid white; padding-left: 10px;"><input type="tel" name="sup_tel"  placeholder="프로젝트 받는 분 전화번호" required="required"></td>
					<td style="border-bottom: 5px solid white; padding-left: 10px;" rowspan="2" colspan="2">${result }</td>
				</tr>
				<tr>
					<th class="topTable">주소</th>
					<td style="border-bottom: 5px solid white; padding-left: 10px;"><input type="text" id="address_kakao" name="address" required="required" readonly="readonly" placeholder="프로젝트 받는 분 주소"></td>
				</tr>
				<tr>
					<th class="topTable">상세주소</th>
					<td style="border-bottom: 5px solid white; padding-left: 10px;"><input type="text" name="address_detail" required="required"  placeholder="상세주소"></td>
					<th class="topTable">금액</th>
					<td style="border-bottom: 5px solid white; padding-left: 10px;"><fmt:formatNumber value="${total_price }" pattern="#,###" /></td>
				</tr>
			</table>
		</div>
		<div align="center" id="button">
			<input type="submit" value="후원" class="btn btn-primary optmargin">
			<input type="button" value="취소" onclick="history.back()" class="btn btn-primary optmargin">
		</div>
	</form>
</body>
</html>