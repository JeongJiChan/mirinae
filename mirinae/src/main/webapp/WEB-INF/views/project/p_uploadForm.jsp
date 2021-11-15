<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		th { border: 1px solid black;}
		td { border: 1px solid black;}
		#picture_table { width: 35%; float: left; table-layout: fixed; }
		#picture { border: 1px solid black; width: 100%; height: 300px; }
		#project_table { width: 60%;  float: left; }
		#option_table {  border: 1px solid black; width: 59.8%;  float: left; overflow: hidden; table-layout: fixed; }
		#button { clear: both; }
		.title { height: 35px; }
		.option_list { border: 0px; }
		.option_list1 { width:70%; border-bottom: 1px solid black; border-right: 1px solid black; }
		.option_list2 { border-bottom: 1px solid black; border-left: 1px solid black; }
		.option_list3 { height: 95px; }
		#opt_divN { height: 95px; overflow: auto; }
		#opt_divP { height: 95px; overflow: auto; }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	//카테고리 미선택시 화면 안넘어감
	function chk() {
		if(frm.category.value == "카테고리를 선택하세요"){
			alert("카테고리를 선택하세요");
			return false;
		}
		if(frm.s_date.value > frm.e_date.value){
			alert("시작일이 종료일보다 나중일 수 없습니다.");
			return false;
		}
	}
	//이미지 미리보기
	function preview(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	//이미지 삭제
	function picturedelete() {
		$('#image_container').text(""); //임시방편 
	};
	//옵션 추가하기
	function optionplus() {
		var name = document.getElementById("opt_name").value;
		var price = document.getElementById("price").value;
		if(name == "" || price == "" ){
			alert("옵션 이름 또는 옵션 가격을 입력하여 주십시오.")
		}else if(price <= 0){
			alert("옵션 가격이 0보다 작을 수 없습니다.")
		}else{
			$('#opt_divN').append(name+"<hr>");
			$('#opt_divP').append(price+"<hr>");
			document.getElementById("opt_name").value = "";
			document.getElementById("price").value = "";
		}
	}
	//옵션 목록을 비운다
	function optiondelete() {
		$('#opt_divN').text("");
		$('#opt_divP').text("");
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

</script>
</head>
<body>
<form action="p_upload.do" method="post" name="frm" onsubmit=" return chk()">
<table id="picture_table">
	<tr><th id="picture"><div id="image_container"></div></th></tr>
	<tr><td><input type="file" name="file" id="image" accept="image/*"	onchange="preview(event);">
			 <input type="button" value="그림제거" onclick="picturedelete()"></td></tr>
</table>
<table id="project_table">
	<tr><th class="title">카테고리</th><td><select id="category" name="category">
								<option>카테고리를 선택하세요</option>
								<option>의류</option>
								<option>가전</option>
								<option>기타</option></select></td></tr>
	<tr><th class="title">프로젝트 이름</th><td><input type="text" name="name" required="required" autofocus="autofocus"></td></tr>
	
	<tr><th class="title">프로젝트 기간</th><td><input type="date" name="s_date" required="required"> ~ 
									<input type="date" name="e_date" required="required"></td></tr>	
									
	<tr><th class="title">목표 금액</th><td><input type="number" name="goal_money" required="required">원</td></tr>	
	
		
	<tr><th class="title">옵션</th><td><input type="text" name="opt_name" id="opt_name" placeholder="옵션 이름">
								 <input type="number" name="price" id="price" placeholder="옵션 가격"><input type="button" value="옵션추가" onclick="optionplus()">
								 <input type="button" value="옵션제거" onclick="optiondelete()"></td></tr>
</table>
<table id="option_table">
	<tr><th class="option_list option_list1">옵션이름</th><th class="option_list option_list2">옵션 가격</th></tr>
	<tr><th class="option_list option_list3"><div id="opt_divN"></div></th><th class="option_list"><div id="opt_divP"></div></th></tr>
</table>
<textarea  rows="40" style="width:94%" placeholder="내용을 입력하세요"></textarea>
<div align="center" id="button"><input type="submit" value="등록"><input type="button" value="취소" onclick="history.back()"></div>
</form>
</body>
</html>