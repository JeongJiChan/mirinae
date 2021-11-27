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
	table {table-layout: fixed; }
	th { border: 1px solid black;}
	td { border: 1px solid black;}
	#picture_table { width: 35%; float: left; table-layout: fixed;}
 	#picture { border: 1px solid black; width: 100%; height: 340px; } 
	#project_table { width: 60%;  float: left; }
	#preImage { width: 100%; height: 340px; }
	#option { height: 80px; }
	.btntable { border: 0px solid black; }
	.star {margin-left:15px; width: 30px; height: 30px; cursor: pointer;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function sessionChk(p_no) {
		if(${not empty id}) {
			$.post("/mirinae/views/mypick/mypick.la", "p_no="+p_no, function(data) {
				var imgSrc = data.split(",")[0];
				var msg = data.split(",")[1];
				
				$(".star").attr("src", imgSrc);
			});
		}else {
			alert('로그인 후 이용해주세요.');
			location.href="/mirinae/views/member/loginForm.sun";
			return false;
		}
	} 
	
	function chk1() {
	 		if(${empty id}){
	 			alert("로그인 후 이용해주세요.");
	 			location.href="/mirinae/views/member/loginForm.sun";
				return false;
	 		}
	 		if(frm.opt_code.value == ""){
	 			alert("옵션을 선택해주세요");
	 			return false;
	 		}
	}
	 	
 	function del() {
 		var con = confirm("정말 삭제하시겠습니까??");
		if (con){  
			location.href="p_del.kim?p_no="+${project.p_no};
		}
	}
 	function update() {
 		var con = confirm("정말 수정하시겠습니까??");
		if (con){  
			location.href="p_updateForm.kim?p_no="+${project.p_no};
		}
	}
 	$(function() {	
 		
 		$('.opt').change(function() {
 		    var value = $(this).val();
 		    var checked = $(this).prop('checked');
 		    if(checked){
 		    	$('.'+value).attr('disabled', false);
 		    	$('.'+value).focus();
 		    }else{
 		    	$('.'+value).attr('disabled', true);
 		    	$('.'+value).val("");
 		    	const element = document.getElementById(value);
 		 		 element.innerHTML = "";
 		    }			
 		});	
 		
 		$('input').keyup('number',function() {
 			//해당 클래스 이름 가져오기
 		   var getClass=$(this).attr("class");
 		    //해당 클래스이름을 name으로 사용하는 input에 값 가져오기
 		   var valueByClass = $('input[name='+getClass+']').val();
 		   var price = $(this).val();
 		   var totalmoney = valueByClass * price;
 		  const element = document.getElementById(getClass);
 		  element.innerHTML = totalmoney.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 		});		
 		//alert(name.textContent);  //text 값	
 		
 		setInterval(() => {
 			var total = 0;
 			$('#total>div').each(function(index, item) {
	 			var num = item.textContent;
	 			num = num.replaceAll(",","");
	 			num *= 1;
				 total += num;
		 		  const element = document.getElementById('totalview');
		 		  element.innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"<b>원</b>"; 
	 		});	
		}, 2500);
 	});	

</script>
</head>
<body>
<form action="/mirinae/views/support/sup_form.chan" method="post" name="frm" onsubmit="return chk1()">
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
	<tr><th>목표 금액</th><td colspan="3"><fmt:formatNumber value="${project.goal_money }" pattern="#,###" />원</td></tr>
	<tr><th colspan="3">현재 모인 금액</th><td><fmt:formatNumber value="${project.cur_money }" pattern="#,###" />원</td></tr>	
	<tr><th colspan="3"> 달성률</th><td><fmt:formatNumber value="${project.cur_money/project.goal_money * 100 }" pattern="0.00"/>%</td></tr>
	<tr><th colspan="4">옵션 구매하기</th></tr>	
	<c:forEach var="opt" items="${options }">
		<input type="hidden" name="${opt.opt_code }" value="${opt.opt_price }">
		<tr><th><input type="checkbox" name="opt_code" class="opt"  value="${opt.opt_code }">${opt.opt_name }</th>
			<th>가격  : <fmt:formatNumber value="${opt.opt_price }" pattern="#,###" />원</th>
			<td colspan="2">수량 : <input type="number" name="supd_cnt" class="${opt.opt_code }" disabled="disabled" required="required" min="1">
			<div id="total" style="display:inline;"><div id="${opt.opt_code }" style="display:inline;"></div><b>원</b></div><br>
			</td></tr>
	</c:forEach>
	<tr><th>총 금액</th><th colspan="3"><div id="totalview" style="display:inline;">원</div></th></tr>
	<tr class="btntable"><th class="btntable" colspan="4"><input type="submit" value="후원하기"  >
	<c:if test="${project.m_id == id || not empty admin_id }">
		<input type="button" onclick="update()" value="수정">
	</c:if>
	<c:if test="${project.m_id == id || not empty admin_id }">
		<input type="button" onclick="del()" value="삭제">
	</c:if>
	
	<!-- 마이픽 버튼 -->
	
	<img onclick="sessionChk(${project.p_no })" alt="마이픽" src="${imgSrc}" class="star">
	${imgSrc }<br>${msg }
	</th></tr>
</table>
<textarea id="content" rows="40" style="width:94%" name="content" readonly="readonly">${project.p_content }</textarea>
</form>
</body>
</html>