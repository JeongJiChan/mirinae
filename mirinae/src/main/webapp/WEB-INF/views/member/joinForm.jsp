<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	function id_chk() {
		if (!frm.m_id.value) {
			alert("아이디를 입력하고 체크하시오");
			frm.m_id.focus();
			return false;
		}
		// 변수 id에 입력한 id를 담아서 post방식으로 confirm.do를 실행하고, 그 결과를 받아서
		// id가 err인 곳에 html 형식으로 보여줘라
		$.ajax({ type:"get",
				 url:"confirm.do?m_id="+ frm.m_id.value, 
				 success:function(data) {
					   alert(data);
					   $('#err_id').html(data);
				    },
				error: function(a,b,c) {
			           alert(a+b+c);
		            }
		});
	}
	function chk() {
		if (frm.m_pass.value != frm.m_pass2.value) {
			alert("비밀번호 재확인이 일치하지 않습니다");
			frm.m_pass.focus();
			frm.m_pass.value = "";
			return false;
		}
	}

	function nick_chk() {
		if (!frm.m_nick.value) {
			alert("닉네임을 입력하고 체크하시오");
			frm.m_nick.focus();
			return false;
		}
		// 변수 id에 입력한 id를 담아서 post방식으로 confirm.do를 실행하고, 그 결과를 받아서
		// id가 err인 곳에 html 형식으로 보여줘라
		$.post('confirm.do', "m_nick=" + frm.m_nick.value, function(data) {
			$('#err_nick').html(data);
		});
	}
</script>
</head>
<body>
	<form action="join.do" method="post" name="frm" onsubmit="return chk()">
		<table>
			<caption>회 원 가 입</caption>
			<tr>
				<th><span style="color: red">*</span>아이디</th>
				<td><input type="text" name="m_id" required="required"
					autofocus="autofocus"> <input type="button" value="중복체크"
					onclick="id_chk()">
				<div id="err_id"></div></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>비밀번호</th>
				<td><input type="password" name="m_pass" required="required"></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>비밀번호 재확인</th>
				<td><input type="password" name="m_pass2" required="required"></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>닉네임</th>
				<td><input type="text" name="m_nick" required="required">
					<input type="button" value="중복체크" onclick="nick_chk()">
				<div id="err_nick"></div></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>이메일</th>
				<td><input type="email" name="m_email" required="required"></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>이름</th>
				<td><input type="text" name="m_name" required="required"></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>휴대전화</th>
				<td><input type="tel" name="tel" required="required"
					pattern="010-\d{3,4}-\d{4}" placeholder="010-1111-1111"
					title="전화형식 010-숫자3/4-숫자4"></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>생년월일</th>
				<td><input type="date" name="birth" required="required"></td>
			</tr>
			<tr>
				<th><span style="color: red">*</span>주소</th>
				<td><input type="text" name="address" required="required"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="가입하기"></th>
			</tr>
		</table>
	</form>
</body>
</html>