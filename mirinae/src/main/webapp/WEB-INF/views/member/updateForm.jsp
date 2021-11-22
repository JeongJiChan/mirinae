<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		var getEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		//이메일 유효성 검사 
		if(!getEmail.test($("#m_email").val())) { 
			alert("이메일 형식에 맞게 다시 입력");
			$("#m_email").focus(); 
			return false;
		}

		if (frm.m_pass.value != frm.m_pass2.value) {
			alert("비밀번호 재확인이 일치하지 않습니다");
			frm.m_pass.focus();
			frm.m_pass.value = "";
			frm.m_pass2.value = "";
			return false;
		}

		if (frm.nickchk.value == "unChk") {
   	 		alert("닉네임 중복체크를 해주세요.");
    		return false;
		}
	};
	
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
		$.post('confirmMyNick.sun', "m_nick=" + frm.m_nick.value, function(data) {
			 if(data == 1) {
                $('#err_nick').html("닉네임 중복인가?");
                $('#err_nick').css("color","red");
                frm.nickchk.value == "unChk";
             }
             else {
                $('#err_nick').html("사용가능한 닉네임??");
                $('#err_nick').css("color","blue");
                frm.nickchk.value="chk";
             }
		});
	}
</script>
<style type="text/css">
table, tr, th, td {
	border: 2px solid;
}
table td { width: 250px; }
</style>
<title>Insert title here</title>
</head>
<body>
	<form action="update.sun" method="post" name="frm"
		onsubmit="return chk()">
		<fieldset>
		<input type="hidden" name="nickchk" value="unChk">
		<input type="hidden" name="m_id" value="${member.m_id }">
		<input type="hidden" name="m_name" value="${memer.m_name }">
		<input type="hidden" name="birth" value="${memer.birth }">
		
			<legend>회 원 정 보 수 정</legend>
			<table>
				<tr>
					<th>아이디</th>
					<td>${member.m_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member.m_name }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${member.birth }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_pass" required="required" size="20"></td>
				</tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td><input type="password" name="m_pass2" required="required" size="20" onchange="pass_chk()">
					<div id="same"></div></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="m_nick" required="required" value="${member.m_nick }" size="15">
					<input type="button" value="중복체크" onclick="nick_chk()">
					<div id="err_nick"></div></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="m_email" id="m_email" placeholder="이메일"
						required="required" value="${member.m_email }" size="30"></td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><input type="tel" name="tel" required="required"
						pattern="010-\d{3,4}-\d{4}" placeholder="010-0000-0000"
						title="010-숫자3/4-숫자4" value="${member.tel }" size="30"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="address_kakao" name="address"
						placeholder="주소" required="required" readonly value="${member.address }" size="30" /></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" name="address_detail"
						placeholder="상세주소" required="required" value="${member.address_d }" size="30"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="수정하기"></th>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>