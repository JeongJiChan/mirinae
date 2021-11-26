<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="findId.sun" method="post" name="frm" onsubmit="return chk()">
		<fieldset><legend>아 이 디 찾 기</legend>
			<div> <!-- 이름 -->
				<label></label>
				<input type="text" name="m_name" placeholder="이름" required="required" autofocus="autofocus">
			</div>
	
			<div> <!-- 이메일 -->
				<label></label>
				<input type="email" name="m_email" placeholder="이메일" required="required">
			</div>
			
			<div> <!-- 찾기 -->
	            <input type="submit" value="아이디 찾기">
	            <input type="button" onclick="history.back()" value="취소">
	        </div>
	        
	         <div>
            <a href="findPassForm.sun">비밀번호 찾기</a> | <a href="loginForm.sun">로그인</a> |<a href="joinForm.sun">회원가입</a>
        	</div>
		</fieldset>
	</form>
</body>
</html>