<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<style type="text/css">
	.form-controllogin {
	  width: 380px;
	  padding: 0.575rem 0.75rem;
	  font-size: 1rem;
	  font-weight: 400;
	  line-height: 1.5;
	  color: #212529;
	  background-color: #fff;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.25rem;
	  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
	.loginbtn { width: 100pt; }
	.loginimg { padding-top: 100pt; padding-bottom: 20pt;}
	.loginId {margin-bottom: 10pt;  }
	.divtext>a {text-decoration: none; color: #212529; }
	.divtext>a:hover{color: #f39c12; }

</style>
</head>
<body>

	<form action="findId.sun" method="post" name="frm" onsubmit="return chk()">
		<fieldset>
					<div class="loginimg" align="center">
						<img alt="" src="/mirinae/p_images/loginFormImg.png">
					</div>
			<div align="center" class="loginId"> <!-- 이름 -->
				<label></label>
				<input type="text" name="m_name" placeholder="이름" required="required" autofocus="autofocus"
				class="form-controllogin">
			</div>
	
			<div align="center"> <!-- 이메일 -->
				<label></label>
				<input type="email" name="m_email" placeholder="이메일" required="required"
				class="form-controllogin">
			</div>
			
			<div style="margin: 25pt;" align="center"> <!-- 찾기 -->
	            <input type="submit" value="아이디 찾기" class="btn btn-primary loginbtn">
	            <input type="button" onclick="history.back()" value="취소" class="btn btn-primary loginbtn">
	        </div>
	        
	         <div class="divtext" align="center">
            <a href="loginForm.sun">로그인</a> | <a href="joinForm.sun">회원가입</a> | <a href="findPassForm.sun">비밀번호 찾기</a>
        	</div>
		</fieldset>
	</form>
</body>
</html>