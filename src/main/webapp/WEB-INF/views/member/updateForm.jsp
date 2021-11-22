<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table,tr,th,td { border: 2px solid;}
</style>
<title>Insert title here</title>
</head>
<body>
	<form action="update.sun" method="post" name="frm"
		onsubmit="return chk()">
		<fieldset>
			<legend>회 원 정 보 수 정</legend>
			<table>
				<tr>
					<th>아이디</th>
					<td>${member.m_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member.m_name }</td>
				<tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td><input type="password" name="m_pass" required="required"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="m_nick" required="required"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="m_email" placeholder="이메일"
						required="required"></td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><input type="tel" name="tel" required="required"
						pattern="010-\d{3,4}-\d{4}" placeholder="010-0000-0000"
						title="010-숫자3/4-숫자4"></td>
				</tr>
				<tr><th>생년월일</th><td><input type="date" name="birth" required="required"></td></tr>
				<tr><th>주소</th><td><input type="text" id="address_kakao" name="address" placeholder="주소"
	            	required="required" readonly /></td></tr>
				<tr><th>상세주소</th><td><input type="text" name="address_detail" placeholder="상세주소" required="required"></td></tr>
				<tr><th colspan="2"><input type="submit" value="수정하기"></th></tr>
			</table>
		</fieldset>
	</form>
</body>
</html>