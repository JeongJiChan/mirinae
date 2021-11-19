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

</head>
<body>
<script type="text/javascript">
	
	var name_arr = [];
	var price_arr = [];

	//카테고리 미선택시 화면 안넘어감
	function chk() {
		if(frm.category.value == "카테고리를 선택하세요"){
			alert("카테고리를 선택하세요");
			return false;
		}
		if(frm.s_date.value > frm.e_date.value){
			alert("시작일보다 종료일이 더 빠릅니다.");
			return false;
		}
		if(frm.goal_money.value < 0 ){
			alert("목표금액을 0원 이상으로 입력해주세요.")
		}
		//값 넘어가는지 확인

		frm.name_arr.value = name_arr;
		frm.price_arr.value = price_arr;
	  alert(frm.filename.value);
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
			name_arr.push(name);
			price_arr.push(price);
			document.getElementById("opt_name").value = "";
			document.getElementById("price").value = "";
			var name_str = "";
			var price_str ="";

			for(var i = 0; i < name_arr.length; i++){
				name_str += name_arr[i]+"<hr>";
				price_str += price_arr[i]+" 원<hr>";
			}
			$('#opt_divN').html(name_str);
			$('#opt_divP').html(price_str);
			$('#opt_divN').scrollTop($('#opt_divN')[0].scrollHeight);
			$('#opt_divP').scrollTop($('#opt_divP')[0].scrollHeight);
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

</script>
<form action="p_upload.kim" method="post" name="frm" onsubmit=" return chk()" enctype="multipart/form-data">
	<input type="hidden" name="name_arr">
	<input type="hidden" name="price_arr">
<table id="picture_table">
	<tr><th id="picture"><img id="preImage" src="/mirinae/p_images/imgcho.jpg"></th></tr>
	<tr><td><input type='file' id="filename" name="filename"></td></tr>
</table>
<table id="project_table">
	<tr><th class="title">카테고리</th><td><select id="category" name="category">
								<option>카테고리를 선택하세요</option>
								<option value="100">의류</option>
								<option value="200">가전</option>
								<option value="300">기타</option></select></td></tr>
								
	<tr><th class="title">프로젝트 이름</th><td><input type="text" name="name" required="required" autofocus="autofocus"></td></tr>
	
	<tr><th class="title">프로젝트 기간</th><td><input type="date" name="s_date" required="required"> ~ 
									<input type="date" name="e_date" required="required"></td></tr>	
									
	<tr><th class="title">목표 금액</th><td><input type="number" name="goal_money" required="required">원</td></tr>	
	
		
	<tr><th class="title">옵션</th><td><input type="text" name="opt_name" id="opt_name" placeholder="옵션 이름">
								 <input type="number" name="price" id="price" placeholder="옵션 가격"><input type="button" value="옵션추가" onclick="optionplus()">
								 <input type="button" value="옵션삭제" onclick="optiondelete()"><br>
								 	<div style="color:red">옵션삭제는 최근부터 삭제됩니다. 원하는 이름을 입력 후 삭제버튼을 눌러주세요</div></td></tr>
</table>
<table id="option_table">
	<tr><th class="option_list option_list1">옵션이름</th><th class="option_list option_list2">옵션 가격</th></tr>
	<tr><th class="option_list option_list3"><div id="opt_divN" class="box"></div></th><th class="option_list"><div id="opt_divP"></div></th></tr>
</table>
<textarea id="content" rows="40" style="width:94%" placeholder="내용을 입력하세요" name="content"></textarea>
<div align="center" id="button"><input type="submit" value="등록"><input type="button" value="취소" onclick="history.back()"></div>
</form>
</body>
</html>