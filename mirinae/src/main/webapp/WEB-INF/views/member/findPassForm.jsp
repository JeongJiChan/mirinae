<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="findPass.sun" method="post" name="frm">
		<fieldset><legend>비 밀 번 호 찾 기</legend>
			<div> <!-- 아이디 -->
				<label></label>
				<input type="text" name="m_id" placeholder="아이디" required="required" autofocus="autofocus">
			</div>
	
			<div> <!-- 이메일 -->
				<label></label>
				<input type="email" name="m_email" placeholder="이메일" required="required">
			</div>
			
			<div> <!-- 찾기 -->
	            <input type="submit" value="비밀번호 찾기">
	            <input type="button" onclick="history.back()" value="취소">
	        </div>
	        
	        <div>
            	<a href="findIdForm.sun">아이디 찾기</a> | <a href="loginForm.sun">로그인</a> | <a href="joinForm.sun">회원가입</a>
        	</div>
		</fieldset>
	</form>
</body>
</html>