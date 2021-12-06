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
	.proform { width:1100px;}
	.topTable {background-color: #2c3e50; color: white; 
		 border-collapse: collapse;
 		 border-radius: 5px;
		 text-align: center;
		 border-bottom: 1px solid white;
		 height: 30px;
		 width: 18%;
	}
	.topTablex {background-color: #2c3e50; color: white;

		 text-align: center;
		 border-bottom: 1px solid white;
		 height: 30px;
		 width: 18%;
	}
	.textcenter { text-align: center;}
	#picture_table { width: 35%; float: left; table-layout: fixed; margin-bottom: 20px; }
 	#picture { width: 100%; height: 360px; padding-right: 10px;} 
	#project_table { width: 60%;  float: left; }
	#preImage { width: 100%; height: 340px; }
	#option { height: 80px; }
	.btntable { border: 0px solid black; }
	.star {margin-left:15px; width: 30px; height: 30px; cursor: pointer;}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
  	-webkit-appearance: none;
	}
	.countsize { width: 100px;}
	input{ width: 100px;}
	.leftpa { padding-left: 20px;}
	.opttable {float: left; width: 660px; height: 90px; table-layout:fixed;
				border-left: 1px solid black; border-right: 1px solid black; }
	.underline {border-bottom: 1px solid black;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	//현재 시간 yyyymmdd 로 구해서 int로 형변환
	var date = new Date();
	var year = date.getYear() +1900;
	var month = date.getMonth() + 1;
	var day = date.getDate();
	if(month < 10){
		month = "0"+month;
	}
	if(day < 10){
		day = "0"+day;	
	}
	var finishdate = year+""+month+""+day;
	finishdate = parseInt(finishdate);
	
	var s_date = '${project.s_date}';
	s_date = s_date.replaceAll("-","");
	s_date = parseInt(s_date);
	
	var e_date = '${project.e_date}';
	e_date = e_date.replaceAll("-","");
	e_date = parseInt(e_date);

	var data =0;
	function sessionChk(p_no) {
		if(${not empty id}) {
			$.post("/mirinae/views/mypick/mypick.la", "p_no="+p_no, function(data) {
				var imgSrc = data.split(",")[0];
				var msg = data.split(",")[1];
				alert(msg);
				$(".star").attr("src", imgSrc);
			});
		}else if(${not empty admin_id}){
			alert("관리자 아이디로는 마이픽이 불가능 합니다.");
			return false;
		}else {
			alert('로그인 후 이용해주세요.');
			location.href="/mirinae/views/member/loginForm.sun";
			return false;
		}
	} 
	
	function chk1() {
			if(${not empty admin_id}){
				alert("관리자 아이디로는 후원을 할 수 없습니다.");
				return false;
			}
	 		if(${empty id}){
	 			alert("로그인 후 이용해주세요.");
	 			location.href="/mirinae/views/member/loginForm.sun";
				return false;
	 		}
	 		if(finishdate < s_date ){
	 			alert("아직 후원 예정인 프로젝트 입니다.");
	 			return false;
	 		}
	 		if(finishdate > e_date ){
	 			alert("마감된 프로젝트 입니다.");
	 			return false;
	 		}
	 		if(data == 0){
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
 		    	data += 1;
 		    }else{
 		    	$('.'+value).attr('disabled', true);
 		    	$('.'+value).val("");
 		    	data -= 1;
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
<input type="hidden" name="per" value="${project.cur_money/project.goal_money * 100 }">
<input type="hidden" name="s_date" value="${project.s_date }">
<input type="hidden" name="e_date" value="${project.e_date }">
<div align="center" style="margin-top: 50px; margin-left: 60px;">
<div class="proform">
<table id="picture_table">
	<tr><th id="picture"><img id="preImage" src="/mirinae/p_images/${project.p_no }.jpg"></th></tr>
</table>
<table id="project_table">
	<tr><th class="topTable">카테고리</th><td class="leftpa underline">
	<c:if test="${project.cate_code == 100 }">	가전	</c:if>
	<c:if test="${project.cate_code == 200 }">	반려동물	</c:if>
	<c:if test="${project.cate_code == 300 }">	뷰티	</c:if>
	<c:if test="${project.cate_code == 400 }">	푸드	</c:if>
	<c:if test="${project.cate_code == 500 }">	패션	</c:if>
	<c:if test="${project.cate_code == 600 }">	기타	</c:if>
	</td><th class="topTable">조회수</th><td class="leftpa underline">${project.p_view }</td>
	<td>	<!-- 마이픽 버튼 -->
	<img onclick="sessionChk(${project.p_no })" alt="마이픽" src="${imgSrc}" class="star" style="float: left;"></td></tr>
								
	<tr><th class="topTable">프로젝트 이름</th><td colspan="4" class="leftpa underline">${project.p_name }</td></tr>
	<tr><th class="topTable">프로젝트 기간</th><td colspan="4" class="leftpa underline">${project.s_date } ~ ${project.e_date }</td></tr>	
	<tr><th class="topTable">목표 금액</th><td colspan="4" class="leftpa underline"><fmt:formatNumber value="${project.goal_money }" pattern="#,###" />원</td></tr>
	<tr><th class="topTable">현재 모인 금액</th><td colspan="4" class="leftpa underline"><fmt:formatNumber value="${project.cur_money }" pattern="#,###" />원</td></tr>	
	<tr><th class="topTable"> 달성률</th><td colspan="4">
	<div class="progress">
  		<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width:${project.cur_money/project.goal_money * 100 }%;">
  			<fmt:formatNumber value="${project.cur_money/project.goal_money * 100 }" pattern="0.00"/>%
  		</div>
	</div>
	<tr><th colspan="5" class="topTablex">옵션 구매하기</th></tr>	
	</table>
<div style="display: inline; float: left; width: 660px; height: 90px; overflow-y:auto;overflow-x:hidden; border-bottom: 1px solid black;">
	<table class="opttable">
	<c:forEach var="opt" items="${options }">
		<input type="hidden" name="${opt.opt_code }" value="${opt.opt_price }">
		<tr style="height: 30px;"><th style="text-align: center; width: 25px;"><input type="checkbox" name="opt_code" class="opt form-check-input"  value="${opt.opt_code }"> 
				</th><td style="text-align: center; width: 100px;">${opt.opt_name }</td>
			<th style="text-align: center; width: 180px;">가격  : <fmt:formatNumber value="${opt.opt_price }" pattern="#,###" />원</th>
			<td>수량 : <input type="number" name="supd_cnt" class="${opt.opt_code }" disabled="disabled" required="required" min="1">
			<div id="total" style="display:inline;"><div id="${opt.opt_code }" style="display:inline; margin-left: 30px;"></div><b>원</b></div><br>
			</td></tr>
	</c:forEach>
	</table>
</div>
	<table style="float: left; width: 660px; margin-top: 10px; margin-bottom: 20px;">
	<tr><th class="topTable">총 금액</th><th style="width: 200px;" class="underline"><div id="totalview" style="display:inline; margin-left: 50px;">원</div></th>
	<td>
	<c:if test="${project.m_id != sessionScope.id }">
	<input type="submit" value="후원하기" class="btn btn-primary" >
	</c:if>
	<c:if test="${project.m_id == id || not empty admin_id }">
		<input type="button" onclick="update()" value="수정" class="btn btn-warning">
	</c:if>
	<c:if test="${project.m_id == id || not empty admin_id }">
		<input type="button" onclick="del()" value="삭제" class="btn btn-danger">
	</c:if>
	</td></tr>
	</table>
<textarea id="content" class="form-control" rows="20" style="width:96%; float: left;" name="content" readonly="readonly">${project.p_content }</textarea>
</div>
</div>
</form>
</body>
</html>