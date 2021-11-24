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
	th { border: 1px solid black;}
	td { border: 1px solid black;}
	#picture_table { width: 35%; float: left; table-layout: fixed;}
 	#picture { border: 1px solid black; width: 100%; height: 340px; } 
	#project_table { width: 60%;  float: left; }
	#preImage { width: 100%; height: 340px; }
	#option { height: 80px; }
	.btntable { border: 0px solid black; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
 	function chk() {
 		if(${empty id}){
 			alert("로그인 후 이용해주세요.");
 			location.href="/mirinae/views/member/loginForm.sun";
			return false;
 		}
 	};
 	$(function() {		
 		$('.opt').change(function() {
 		    var value = $(this).val();
 		    var checked = $(this).prop('checked');
 		    if(checked){
 		    	$('.'+value).attr('disabled', false);	
 		    }else{
 		    	$('.'+value).attr('disabled', true);
 		    }			
 		});
 	});	
</script>
</head>
<body>
<form action="/mirinae/views/support/sup_form.chan" method="post" name="frm" onsubmit=" return chk()" >
<input type="hidden" name="p_no" value="${project.p_no }">
<table id="picture_table">
	<tr><th id="picture"><img id="preImage" src="/mirinae/p_images/${project.p_no }.jpg"></th></tr>
</table>
<table id="project_table">
	<tr><th>카테고리</th><td>
	<c:if test="${project.cate_code == 100 }">	의류	</c:if>
	<c:if test="${project.cate_code == 200 }">	가전	</c:if>
	<c:if test="${project.cate_code == 300 }">	기타	</c:if>
	</td><th>조회수</th><td>${project.p_view }</td></tr>
								
	<tr><th>프로젝트 이름</th><td colspan="3">${project.p_name }</td></tr>
	
	<tr><th>프로젝트 기간</th><td colspan="3">${project.s_date } ~ ${project.e_date }</td></tr>	
									
	<tr><th>목표 금액</th><td colspan="3">${project.goal_money }</td></tr>
	<tr><th colspan="3">현재 모인 금액</th><td>${project.cur_money }</td></tr>	
	<tr><th colspan="3"> 달성률</th><td><fmt:formatNumber value="${project.cur_money/project.goal_money * 100 }" pattern="0.00"/>%</td></tr>
	<tr><th colspan="4">옵션 구매하기</th></tr>	
	<c:forEach var="opt" items="${options }">
	<c:set var="i" value="${i+1 }"></c:set>
		<tr><th colspan="2"><input type="checkbox" name="opt_code" class="opt"  value="${opt.opt_code }">${opt.opt_name }</th><th>가격  : ${opt.opt_price }</th>
		<td>수량 : <input type="number" name="supd_cnt" class="${opt.opt_code }" disabled="disabled" required="required" min="1"> </td></tr>
	</c:forEach>
	<tr><th>총 금액</th><th colspan="3"></th></tr>
	<tr class="btntable"><th class="btntable" colspan="4"><button style="WIDTH: 150pt; HEIGHT: 30pt">후원하기</button></th></tr>
</table>
<textarea id="content" rows="40" style="width:94%" name="content">${project.p_content }</textarea>
</form>
</body>
</html>