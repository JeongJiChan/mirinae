<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		var n = parseInt(frm.num.value);
		var cn = parseInt(frm.confirmNum.value);
		if(n != cn) {
			alert("인증번호가 일치하지 않습니다. 메일을 다시 확인해주세요.");
			$('#confirmNum').val("");
			$('#confirmNum').focus();
			return false;
		}
	}
</script>
</head>
<body>
			<div class="loginimg" align="center">
				<img alt="" src="/mirinae/p_images/loginFormImg.png">
			</div>
			<div align="center" style="margin-bottom: 10px;"><h3>인 증 번 호 확 인</h3></div>
			<div align="center" style="margin-bottom: 20px;"><h5><b>${m_email }</b>로 인증 메일이 발송되었습니다.</h5></div>
 	<c:if test="${result == 1 }">
 	<form action="updatePassForm.sun" method="post" name="frm" onsubmit="return chk()">
 	<input type="hidden" name="num" value="${num}">
 	<input type="hidden" name="m_id" value="${member.m_id}">
		<fieldset>
			<div class="divtext" align="center"> <!-- 인증번호 -->
				<label></label>
				<input type="text" name="confirmNum" maxlength="6" placeholder="인증번호를 입력해주세요" required="required" autofocus="autofocus"
				class="form-controllogin">
			</div>
			
			<div class="divtext" align="center"> <!-- 인증번호 입력 -->
	            <input type="submit" value="확인" class="btn btn-primary loginbtn" style="margin-top: 10px;">
	        </div>
		</fieldset>
	</form>
	</c:if>
	
	<c:if test="${result == -1 }">
		<div align="center"><h2>등록된 정보가 없습니다</h2></div>
		<div class="divtext" align="center" style="margin-top: 20px;">
            <a href="findPassForm.sun">다시 찾기</a> | <a href="findIdForm.sun">아이디 찾기</a> | <a href="joinForm.sun">회원가입</a>
        </div>
	</c:if>
	
</body>
</html>