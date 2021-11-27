<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">

	/* 비밀번호 확인, 중복체크 버튼 눌렀는지 확인 */
	function chk() {
		var getName = /^[가-힣]+$/;

		//이름 유효성 검사 
		if(!getName.test($("#m_name").val())) { 
			alert("이름은 한글만 입력가능");
			$("#m_name").val(""); 
			$("#m_name").focus(); 
			return false; 
		}

		if (frm.m_pass.value != frm.m_pass2.value) {
			alert("비밀번호 재확인이 일치하지 않습니다");
			frm.m_pass.focus();
			frm.m_pass.value = "";
			frm.m_pass2.value = "";
			return false;
		}
		if (frm.idchk.value == "unChk") {
	  		alert("아이디 중복체크를 해주세요.");
	   	 	return false;
		}	
		if (frm.nickchk.value == "unChk") {
	   	 	alert("닉네임 중복체크를 해주세요.");
	    	return false;
		}
		if (frm.emailchk.value == "unChk") {
	   	 	alert("이메일 중복체크를 해주세요.");
	    	return false;
		}
	};

	/* 아이디 중복체크 & 특정단어 필터링 */
	function id_chk() {
		var getCheck= RegExp(/^[a-zA-Z0-9]{0,20}$/);

		//아이디 유효성검사
		if(!getCheck.test($("#m_id").val())){ 
			alert("아이디는 영문자와 숫자만 입력가능"); 
			$("#m_id").val(""); 
			$("#m_id").focus(); 
			return false; 
		}
		
		if (!frm.m_id.value) {
			alert("아이디를 입력하고 체크해주세요");
			frm.m_id.focus();
			return false;
		}
		if (frm.m_id.value.match(/admin/gi)||frm.m_id.value.match(/master/gi)) {
			alert("아이디에 admin 또는 master 단어 포함할 수 없음");
			frm.m_id.value = "";
			frm.m_id.focus();
			$('#err_id').html("");
			frm.idchk.value == "unChk";
			return false;
		}

		// 변수 id에 입력한 id를 담아서 post방식으로 confirmId.sun을 실행하고, 그 결과를 받아서
		// id가 err_id인 곳에 html 형식으로 보여줘라
		$.post('confirmId.sun', "m_id=" + frm.m_id.value, function(data) {
 		 	if(data == 1) {
                $('#err_id').html("아이디 중복");
                $('#err_id').css("color","red");
                frm.idchk.value="unChk";
             }
 		 	else {
 				$('#err_id').html("사용가능한 아이디");
             	$('#err_id').css("color","blue");
             	frm.idchk.value="chk";
              	}
			});
		}
	
	/* 비밀번호와 비밀번호 재확인 일치여부 */
	function pass_chk() {
		if (frm.m_pass.value != '' && frm.m_pass2.value != '') {
			if (frm.m_pass.value == frm.m_pass2.value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치';
				document.getElementById('same').style.color = 'blue';
				
			} else {
				document.getElementById('same').innerHTML = '비밀번호 불일치';
				document.getElementById('same').style.color = 'red';
			}
		}
	}
	
	/* 닉네임 중복체크 & 특정단어 필터링 */
	function nick_chk() {
		if (!frm.m_nick.value) {
			alert("닉네임을 입력하고 체크해주세요");
			frm.m_nick.focus();
			return false;
		}
		if (frm.m_nick.value.match(/관리자/gi)
			||frm.m_nick.value.match(/admin/gi)
			||frm.m_nick.value.match(/master/gi)) {
			alert("닉네임에 관리자,admin,master 단어 포함할 수 없음");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			$('#err_nick').html("");
			frm.nickchk.value == "unChk";
			return false;
		}
		// 변수 id에 입력한 id를 담아서 post방식으로 confirmNick.sun을 실행하고, 그 결과를 받아서
		// id가 err_nick인 곳에 html 형식으로 보여줘라
		$.post('confirmNick.sun', "m_nick=" + frm.m_nick.value, function(data) {
			 if(data == 1) {
                $('#err_nick').html("닉네임 중복");
                $('#err_nick').css("color","red");
                frm.nickchk.value="unChk";
             }
             else {
                $('#err_nick').html("사용가능한 닉네임");
                $('#err_nick').css("color","blue");
                frm.nickchk.value="chk";
             }
		});
	}
	
	/* 이메일 중복체크 & 이메일 유효성 검사 */
	function email_chk() {
		var getEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		//이메일 유효성 검사 
		if(!getEmail.test($("#m_email").val())) { 
			alert("이메일 형식에 맞게 입력해주세요");
			$("#m_email").focus(); 
			return false; 
		}
		
		if (!frm.m_email.value) {
			alert("이메일을 입력하고 체크해주세요");
			frm.m_email.focus();
			return false;
		}

		// 변수 id에 입력한 id를 담아서 post방식으로 confirmId.sun을 실행하고, 그 결과를 받아서
		// id가 err_id인 곳에 html 형식으로 보여줘라
		$.post('confirmEmail.sun', "m_email=" + frm.m_email.value, function(data) {
 		 	if(data == 1) {
                $('#err_email').html("이메일 중복");
                $('#err_email').css("color","red");
                frm.emailchk.value="unChk";
             }
 		 	else {
 				$('#err_email').html("사용가능한 이메일");
             	$('#err_email').css("color","blue");
             	frm.emailchk.value="chk";
              	}
			});
	}
</script>
</head>
<body>
<div>
	<form action="join.sun" method="post" name="frm" onsubmit="return chk()">
		<fieldset><legend>회 원 가 입</legend>
			<input type="hidden" name="idchk" value="unChk">
	    	<input type="hidden" name="nickchk" value="unChk">
	    	<input type="hidden" name="emailchk" value="unChk">
	
			<pre>*는 반드시 입력항목입니다</pre>
			<div> <!-- 아이디 -->
	            <label for="m_id"><span style="color: red">*</span></label>
	            	<input type="text" name="m_id" id="m_id" placeholder="아이디" required="required" autofocus="autofocus">
					<input type="button" value="중복체크" onclick="id_chk()">
					<div id="err_id"></div>
	        </div>
	        
	        <div> <!-- 비밀번호 -->
	            <label for="m_pass"><span style="color: red">*</span></label>
	            	<input type="password" name="m_pass" id="m_pass" placeholder="비밀번호" required="required">
	        </div>
	        
			<div> <!-- 비밀번호 재확인 -->
	            <label for="m_pass2"><span style="color: red">*</span></label>
	            	<input type="password" name="m_pass2" placeholder="비밀번호 재확인" required="required" onchange="pass_chk()">
					<div id="same"></div>
	        </div>
	        
	        <div> <!-- 닉네임 -->
	            <label for="m_nick"><span style="color: red">*</span></label>
	            	<input type="text" name="m_nick" id="m_nick" placeholder="닉네임" required="required">
					<input type="button" value="중복체크" onclick="nick_chk()">
					<div id="err_nick"></div>
	        </div>
	        
	        <div> <!-- 이메일 -->
	            <label for="m_email"><span style="color: red">*</span></label>
	            	<input type="email" name="m_email" id="m_email" placeholder="이메일" required="required">
	            	<input type="button" value="중복체크" onclick="email_chk()">
					<div id="err_email"></div>
	        </div>
	        
	        <div> <!-- 이름 -->
	            <label for="m_name"><span style="color: red">*</span></label>
	            	<input type="text" name="m_name" id="m_name" placeholder="이름" required="required">
	        </div>
	        
			<div> <!-- 휴대전화 -->
	            <label for="tel"><span style="color: red">*</span></label>
	            	<input type="tel" name="tel" required="required"
						pattern="010-\d{3,4}-\d{4}" placeholder="010-0000-0000"
						title="010-숫자3/4-숫자4">
	        </div>
	        
	        <div> <!-- 생년월일 -->
	            <label for="birth"><span style="color: red">*</span></label>
	            	<input type="date" name="birth" required="required">
	        </div>
	        
	        <div> <!-- 주소 -->
	            <label for="address"><span style="color: red">*</span></label>
	            	<input type="text" id="address_kakao" name="address" placeholder="주소"
	            	required="required" readonly />
	        </div>
	        
	        <div> <!-- 상세주소 -->
	            <label for="address_detail"><span style="color: red">*</span></label>
	            	<input type="text" name="address_detail" placeholder="상세주소" required="required">
	        </div>
	        
	        <div> <!-- 가입하기 -->
	            <input type="submit" value="가입하기">
	        </div>
		</fieldset>
	</form>

</div>
</body>
</html>