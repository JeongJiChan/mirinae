<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.sun" method="post" name="frm" onsubmit="return chk()">
		<h2>로 그 인</h2>
		<div> <!-- 아이디 -->
			<label for="m_id"></label>
			<input type="text" name="m_id" placeholder="아이디" required="required" autofocus="autofocus">
		</div>

		<div> <!-- 비밀번호 -->
			<label for="m_pass"></label>
			<input type="password" name="m_pass" placeholder="비밀번호" required="required">
		</div>
		
		<div> <!-- 로그인하기 -->
            <input type="submit" value="로그인">
        </div>
	</form>
</body>
</html>