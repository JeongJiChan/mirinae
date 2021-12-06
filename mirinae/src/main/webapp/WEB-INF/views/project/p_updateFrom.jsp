<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.proform { width:1100px;}
	.topTable {background-color: #2c3e50; color: white; border-radius: 1px;
		 border-collapse: collapse;
 		 border-radius: 10px;
		 text-align: center;
		 border-bottom: 1px solid white;
		 height: 30px;
		 width: 18%;
	}
	.form-selectcate {
		  display: block;
		  width: 40%;
		  padding: 0.375rem 2.25rem 0.375rem 0.75rem;
		  -moz-padding-start: calc(0.75rem - 3px);
		  font-size: 1rem;
		  font-weight: 400;
		  line-height: 1;
		  color: #212529;
		  background-color: #fff;
		  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
		  background-repeat: no-repeat;
		  background-position: right 0.75rem center;
		  background-size: 16px 12px;
		  border: 1px solid #ced4da;
		  border-radius: 0.25rem;
		  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
	}
		.form-controllogin {
		  width: 40%;
		  padding: 0.575rem 0.75rem;
		  font-size: 1rem;
		  font-weight: 400;
		  height: 35px;
		  color: #212529;
		  background-color: #fff;
		  background-clip: padding-box;
		  border: 1px solid #ced4da;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
		  border-radius: 0.25rem;
		  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
		.form-controlloginopt {
		  width: 30%;
		  padding: 0.575rem 0.75rem;
		  font-size: 1rem;
		  font-weight: 400;
		  height: 35px;
		  color: #212529;
		  background-color: #fff;
		  background-clip: padding-box;
		  border: 1px solid #ced4da;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
		  border-radius: 0.25rem;
		  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#picture_table { width: 40%; float: left; table-layout: fixed; margin-right: 10px; margin-bottom: 20px;}
 	#picture { width: 100%; height: 363px;} 
	#project_table { width: 58%;  float: left; margin-top: 40px;  }
	#option_table {  width: 57.5%; height:120px; float: left; overflow: hidden; table-layout: fixed; }
	#button { clear: both; }
	.option_list { border: 0px; }
	.option_list1 { width:60%;  }
	.option_list3 { height: 95px; }
	#opt_divN { height: 95px; overflow: auto; }
	#opt_divP { height: 95px; overflow-x:hidden; overflow-y: auto; }
	.box::-webkit-scrollbar {    display:none;	}
	#preImage { width: 100%; height: 310px; }
	#content { clear: both; }
	.underline {border-bottom: 1px solid #212529;}
	.optmargin { margin-top: 10px;}
	.bottmmargin { margin-bottom: 5px; }
</style>
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
	// 시작일을 위한 변수
	var s_date;
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
			alert("대표이미지를 선택해주세요.");
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
					name_str += name_arr[i]+"<br>";
					//금액을 자동으로 천단위를 바꿔줌
					price_str += price_arr[i].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원<br>";
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
			name_str += name_arr[i]+"<br>";
			price_str += price_arr[i]+"<br>";
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
	<div>
		<h1 style="font-size: 56px; line-height: 1.4em; text-align: center;">프로젝트 등록</h1>
	</div>
<form action="p_update.kim" method="post" name="frm" onsubmit=" return chk()" enctype="multipart/form-data" >
	<input type="hidden" name="name_arr">
	<input type="hidden" name="price_arr">
	<input type="hidden" name="p_no" value="${project.p_no }">
<div align="center">
<div class="proform">
<table id="picture_table">
	<tr><th id="picture"><img id="preImage" src="/mirinae/p_images/${project.p_no }.jpg"></th></tr>
	<tr><td><input type='file' id="filename" name="filename" class="form-control" value="${project.p_no }.jpg"></td></tr>
</table>
<table id="project_table">
	<tr><th class="topTable">카테고리</th><td><select id="category" name="category" class="form-selectcate">
								<option>카테고리를 선택하세요</option>
								<option value="100">가전</option>
								<option value="200">반려동물</option>
								<option value="300">뷰티</option>
								<option value="400">푸드</option>
								<option value="500">패션</option>
								<option value="600">기타</option></select></td></tr>
								
	<tr><th class="topTable">프로젝트 이름</th><td><input type="text" name="name" required="required" autofocus="autofocus"
													class="form-controllogin" value="${project.p_name }"></td></tr>
	
	<tr><th class="topTable">프로젝트 기간</th><td><input type="date" id="s_date" name="s_date" required="required" disabled="disabled" class="form-controllogin"> ~ 
									<input type="date" name="e_date" required="required" class="form-controllogin" value="${project.e_date }"></td></tr>	
									
	<tr><th class="topTable">목표 금액</th><td><input type="number" name="goal_money" required="required" min="1" class="form-controllogin"
											value="${project.goal_money }">원</td></tr>	
	
		
	<tr><th class="topTable">옵션</th><td><input type="text" name="opt_name" id="opt_name" placeholder="옵션 이름" onkeyup="noSpaceForm(this)"
											class="form-controlloginopt">
								 <input type="number" name="price" id="price" placeholder="옵션 가격" onkeyup="noSpaceForm(this)"
								 	class="form-controlloginopt">
								 	<input type="button" value="옵션추가" onclick="optionplus()" class="btn btn-warning bottmmargin">
								 <input type="button" value="옵션삭제" onclick="optiondelete()" class="btn btn-danger bottmmargin"><br>
								 	<div style="color:red;">옵션은 최근옵션부터 삭제됩니다.<br> 원하는 이름을 입력 후 삭제버튼을 눌러주세요</div></td></tr>
</table>
<table id="option_table">
	<tr><th class="option_list option_list1 topTable">옵션이름</th><th class="option_list  topTable">옵션 가격</th></tr>
	<tr><th class="option_list option_list3 underline"><div id="opt_divN" class="box" style="text-align: center;"></div></th><th class="option_list underline"><div id="opt_divP" style="text-align: center;"></div></th></tr>
</table>
<textarea id="content" class="form-control" rows="20" style="width:99.5%;" name="content" required="required">
--------------------------------------------------------
           수정전 옵션
<c:forEach var="opt" items="${options }">
	옵션 이름 : ${opt.opt_name }
	옵션 가격 : ${opt.opt_price }원
</c:forEach>
--------------------------------------------------------
${project.p_content }</textarea>
</div>
</div>
<div align="center" id="button"><input type="submit" value="수정" class="btn btn-primary optmargin"> <input type="button" value="취소" onclick="history.back()" class="btn btn-primary optmargin"></div>
</form>
</body>
</html>