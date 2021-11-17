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
	function chk() { // 비밀번호 확인, 중복체크 버튼 눌렀는지 확인
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
		if (frm.m_id.value == "master" || "admin") {
			alert("관리자 아이디로는 가입 불가능");
			frm.m_id.focus();
			frm.m_id.value = "";
			return false;
		}
	};
	
	function id_chk() {
		if (!frm.m_id.value) {
			alert("아이디를 입력하고 체크해주세요");
			frm.m_id.focus();
			return false;
		}
		// 변수 id에 입력한 id를 담아서 post방식으로 confirmId.sun을 실행하고, 그 결과를 받아서
		// id가 err_id인 곳에 html 형식으로 보여줘라
		$.post('confirmId.sun', "m_id=" + frm.m_id.value, function(data) {
			frm.idchk.value="chk";
			 if(data == 1) {
                 $('#err_id').html("아이디 중복");
                 $('#err_id').css("color","red");
              }
              else {
                 $('#err_id').html("사용가능한 아이디");
                 $('#err_id').css("color","blue");
              }
		});
	}
	
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
	function nick_chk() {
		if (!frm.m_nick.value) {
			alert("닉네임을 입력하고 체크해주세요");
			frm.m_nick.focus();
			return false;
		}
		// 변수 id에 입력한 id를 담아서 post방식으로 confirmNick.sun을 실행하고, 그 결과를 받아서
		// id가 err_nick인 곳에 html 형식으로 보여줘라
		$.post('confirmNick.sun', "m_nick=" + frm.m_nick.value, function(data) {
			frm.nickchk.value="chk";
			 if(data == 1) {
                $('#err_nick').html("닉네임 중복");
                $('#err_nick').css("color","red");
             }
             else {
                $('#err_nick').html("사용가능한 아이디");
                $('#err_nick').css("color","blue");
             }
		});
	}
	
</script>
</head>
<body>
<div>
	<form action="join.sun" method="post" name="frm" onsubmit="return chk()">
		<input type="hidden" name="idchk" value="unChk">
    	<input type="hidden" name="nickchk" value="unChk">
    	
		<h2>회 원 가 입</h2>
		<pre>*는 반드시 입력항목입니다</pre>
		<div> <!-- 아이디 -->
            <label for="m_id"><span style="color: red">*</span></label>
            	<input type="text" name="m_id" placeholder="아이디" required="required" autofocus="autofocus">
				<input type="button" value="중복체크" onclick="id_chk()">
				<div id="err_id"></div>
        </div>
        
        <div> <!-- 비밀번호 -->
            <label for="m_pass"><span style="color: red">*</span></label>
            	<input type="password" name="m_pass" placeholder="비밀번호" required="required">
        </div>
        
		<div> <!-- 비밀번호 재확인 -->
            <label for="m_pass2"><span style="color: red">*</span></label>
            	<input type="password" name="m_pass2" placeholder="비밀번호 재확인" required="required" onchange="pass_chk()">
				<div id="same"></div>
        </div>
        
        <div> <!-- 닉네임 -->
            <label for="m_nick"><span style="color: red">*</span></label>
            	<input type="text" name="m_nick" placeholder="닉네임" required="required">
				<input type="button" value="중복체크" onclick="nick_chk()">
				<div id="err_nick"></div>
        </div>
        
        <div> <!-- 이메일 -->
            <label for="m_email"><span style="color: red">*</span></label>
            	<input type="email" name="m_email" placeholder="이메일" required="required">
        </div>
        
        <div> <!-- 이름 -->
            <label for="m_name"><span style="color: red">*</span></label>
            	<input type="text" name="m_name" placeholder="이름" required="required">
        </div>
        
		<div> <!-- 휴대전화 -->
            <label for="tel"><span style="color: red">*</span></label>
            	<input type="tel" name="tel" required="required"
					pattern="010-\d{3,4}-\d{4}" placeholder="010-XXXX-XXXX"
					title="전화형식 010-숫자3/4-숫자4">
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
	</form>
</div>
</body>
</html>