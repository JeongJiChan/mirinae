<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.m_pass.value != frm.m_pass2.value) {
			alert("비밀번호 재확인이 일치하지 않습니다");
			frm.m_pass.focus();
			frm.m_pass.value = "";
			frm.m_pass2.value = "";
			return false;
		}
	}
</script>
</head>
<body>
	<div class="loginimg" align="center">
		<img alt="" src="/mirinae/p_images/loginFormImg.png">
	</div>
	<div align="center" style="margin-bottom: 20px;"><h3>새 비 밀 번 호 설 정</h3></div>
	<div align="center" style="margin-bottom: 20px;"><h5>새로운 비밀번호를 입력해 주세요</h5></div>
 	<form action="updatePass.sun" method="post" name="frm" onsubmit="return chk()">
 	<input type="hidden" name="m_id" value="${m_id }">
 	
		<fieldset>
			<div class="loginId"  align="center"> <!-- 비밀번호 -->
				<label></label>
				<input type="password" name="m_pass" required="required" autofocus="autofocus" placeholder="새로운 비밀번호"
				class="form-controllogin">
			</div>
			<div class="loginId" align="center"> <!-- 비밀번호 확인 -->
				<label></label>
				<input type="password" name="m_pass2"required="required" placeholder="새로운 비밀번호 확인"
				class="form-controllogin">
			</div>
			
			<div align="center"> <!-- 찾기 -->
	            <input type="submit" value="비밀번호 변경" class="btn btn-primary">
	        </div>
		</fieldset>
	</form>
</body>
</html>