<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th { border: 1px solid black;}
	td { border: 1px solid black;}
	#picture_table { width: 35%; float: left; table-layout: fixed;}
 	#picture { border: 1px solid black; width: 100%; height: 310px; } 
	#project_table { width: 60%;  float: left; }
	#option_table {  border: 1px solid black; width: 59.8%;  float: left; overflow: hidden; table-layout: fixed; }
	#button { clear: both; }
	.title { height: 35px; }
	.option_list { border: 0px; }
	.option_list1 { width:70%; border-bottom: 1px solid black; border-right: 1px solid black; }
	.option_list2 { border-bottom: 1px solid black; border-left: 1px solid black; }
	.option_list3 { height: 95px; }
	#opt_divN { height: 95px; overflow: auto; }
	#opt_divP { height: 95px; overflow-x:hidden; overflow-y: auto; }
	.box::-webkit-scrollbar {    display:none;	}
	#preImage { width: 100%; height: 310px; }
</style>
<script type="text/javascript">
	//현재 시간 yyyymmdd 로 구해서 int로 형변환
	var date = new Date();
	var year = date.getYear() +1900;
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var finishdate = year+""+month+""+day;
	finishdate = parseInt(finishdate);
	// 시작일을 위한 변수
	var s_date;
	
	window.onload = function() {
		if(${empty id && empty admin_id}){
			alert("로그인 후 이용해주세요.");
			location.href="/mirinae/views/member/loginForm.sun";
		}
	}	
	var name_arr = [];
	var price_arr = [];

	//제약조건
	function chk() {
		if(frm.category.value == "카테고리를 선택하세요"){
			alert("카테고리를 선택하세요");
			return false;
		}
		if(frm.s_date.value > frm.e_date.value){
			alert("프로젝트 시작일보다 종료일이 더 빠릅니다.");
			return false;
		}
		if(frm.s_date.value == frm.e_date.value){
			alert("프로젝트 시작일과 종료일은 같을 수 없습니다.");
			return false;
		}
		if(frm.goal_money.value < 0 ){
			alert("목표금액을 0원 이상으로 입력해주세요.")
		}
		if(frm.filename.value == ""){
			alert("프로젝트 수정 시 대표이미지를 다시 선택해 주세요.");
			return false;
		}
		if(frm.filename.value.indexOf(".jpg") == -1){
			alert("확장자가 jpg인 파일만 올려주시기 바랍니다.");
			return false;
		}

		frm.name_arr.value = name_arr;
		frm.price_arr.value = price_arr;
		
		if(frm.name_arr.value =="" || frm.price_arr.value ==""){
			alert("옵션을 1개 이상 등록 해주세요");
			return false;
		}
		if(s_date < finishdate){
			alert("프로젝트 시작일을 오늘 이후로 설정하세요");
			return false;
		}
	}
	//옵션 추가하기
	function optionplus() {
		var name = document.getElementById("opt_name").value;
		var price = document.getElementById("price").value;
		if(name == "" || price == "" ){
			alert("옵션 이름 또는 옵션 가격을 입력하여 주십시오.")
		}else if(price <= 0){
			alert("옵션 가격이 0보다 작을 수 없습니다.")
		}else{
			if(name.indexOf(",") != -1){
				alert('옵션 이름에 ","를 사용할 수 없습니다. ');
				document.getElementById("opt_name").value = "";
				document.getElementById("price").value = "";
				frm.opt_name.focus();
			}else if(name_arr.indexOf(name) != -1){
				alert("동일한 옵션명을 입력할 수 없습니다.");
				document.getElementById("opt_name").value = "";
				document.getElementById("price").value = "";
			}else{
				name_arr.push(name);
				price_arr.push(price);
				document.getElementById("opt_name").value = "";
				document.getElementById("price").value = "";
				var name_str = "";
				var price_str ="";
				for(var i = 0; i < name_arr.length; i++){
					name_str += name_arr[i]+"<hr>";
					//금액을 자동으로 천단위를 바꿔줌
					price_str += price_arr[i].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원<hr>";
				}
				$('#opt_divN').html(name_str);
				$('#opt_divP').html(price_str);
				$('#opt_divN').scrollTop($('#opt_divN')[0].scrollHeight);
				$('#opt_divP').scrollTop($('#opt_divP')[0].scrollHeight);
				frm.opt_name.focus();
			}
		}
	}
	//옵션 목록을 비운다
	function optiondelete() {
		var name = document.getElementById("opt_name").value;
		var del_num = name_arr.indexOf(name);
		name_arr.splice(del_num,1);
		price_arr.splice(del_num,1);
		document.getElementById("opt_name").value = "";
		var name_str = "";
		var price_str ="";
		for(var i = 0; i < name_arr.length; i++){
			name_str += name_arr[i]+"<hr>";
			price_str += price_arr[i]+"<hr>";
		}
		$('#opt_divN').html(name_str);
		$('#opt_divP').html(price_str);

	}
	//옵션 이름과 가격의 스크롤바를 동시에 내린다.
	$(function() {			
		$('#opt_divN').scroll(function() {
			$('#opt_divP').scrollTop($('#opt_divN').scrollTop());
			$('#opt_divP').scrollLeft($('#opt_divN').scrollLeft());
		});
		$('#opt_divP').scroll(function() {
			$('#opt_divN').scrollTop($('#opt_divP').scrollTop());
			$('#opt_divN').scrollLeft($('#opt_divP').scrollLeft());
		});
	});	
	//이미지 미리보기
	$(function() {
        $("#filename").on('change', function(){
            readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
              $('#preImage').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }
    }
    //옵션 이름에 공백 불가
    function noSpaceForm(obj) 
    {             
        var str_space = /\s/;               // 공백 체크
        if(str_space.exec(obj.value)) 
        {     // 공백 체크
            alert("공백을 넣을 수 없습니다.");
            obj.focus();
            obj.value = obj.value.replace(' ',''); // 공백제거
            return false;
        }
    }
    
    $(function() {

		$("#s_date").change(function() {
			s_date = $(this).val();
			s_date = s_date.replaceAll("-","");
			s_date = parseInt(s_date);
			if(s_date < finishdate){
				alert("프로젝트 시작일을 오늘 이후로 설정해주세요");
			}
		});
	});
	

</script>
</head>
<body>
<form action="p_update.kim" method="post" name="frm" onsubmit=" return chk()" enctype="multipart/form-data" >
	<input type="hidden" name="name_arr">
	<input type="hidden" name="price_arr">
	<input type="hidden" name="p_no" value="${project.p_no }">
<table id="picture_table">
	<tr><th id="picture"><img id="preImage" src="/mirinae/p_images/${project.p_no }.jpg"></th></tr>
	<tr><td><input type='file' id="filename" name="filename" value="${project.p_no }.jpg"></td></tr>
</table>
<table id="project_table">
	<tr><th class="title">카테고리</th><td><select id="category" name="category">
								<option>카테고리를 선택하세요</option>
								<option value="100">의류</option>
								<option value="200">가전</option>
								<option value="300">기타</option></select></td></tr>
								
	<tr><th class="title">프로젝트 이름</th><td><input type="text" name="name" required="required" autofocus="autofocus" value="${project.p_name }"></td></tr>
	
	<tr><th class="title">프로젝트 기간</th><td><input type="date" id="s_date" name="s_date" required="required" disabled="disabled"> ~ 
									<input type="date" name="e_date" required="required" value="${project.e_date }"></td></tr>	
									
	<tr><th class="title">목표 금액</th><td><input type="number" name="goal_money" required="required" min="1" value="${project.goal_money }">원</td></tr>	
	
		
	<tr><th class="title">옵션</th><td><input type="text" name="opt_name" id="opt_name" placeholder="옵션 이름" onkeyup="noSpaceForm(this)">
								 <input type="number" name="price" id="price" placeholder="옵션 가격" onkeyup="noSpaceForm(this)"><input type="button" value="옵션추가" onclick="optionplus()">
								 <input type="button" value="옵션삭제" onclick="optiondelete()"><br>
								 	<div style="color:red">옵션삭제는 최근부터 삭제됩니다. 원하는 이름을 입력 후 삭제버튼을 눌러주세요</div></td></tr>
</table>
<table id="option_table">
	<tr><th class="option_list option_list1">옵션이름</th><th class="option_list option_list2">옵션 가격</th></tr>
	<tr><th class="option_list option_list3"><div id="opt_divN" class="box"></div></th><th class="option_list"><div id="opt_divP"></div></th></tr>
</table>
<textarea id="content" rows="40" style="width:94%" placeholder="내용을 입력하세요" name="content" required="required">
--------------------------------------------------------
           수정전 옵션
<c:forEach var="opt" items="${options }">
	옵션 이름 : ${opt.opt_name }
	옵션 가격 : ${opt.opt_price }원
</c:forEach>
--------------------------------------------------------
${project.p_content }</textarea>
<div align="center" id="button"><input type="submit" value="수정"><input type="button" value="취소" onclick="history.back()"></div>
</form>
</body>
</html>