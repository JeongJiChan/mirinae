<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if(!frm.num.value.equals(frm.confirmNum.value)) {
			alert("인증번호가 일치하지 않습니다. 메일을 다시 확인해주세요.");
			$('#confirmNum').val("");
			$('#confirmNum').focus();
			return false;
		}
	}
</script>
</head>
<body>
 	<c:if test="${result == 1 }">
 	<form action="updatePass.sun" method="post" name="frm">
 	<input type="hidden" name="num" value="${num}">
 	<input type="hidden" name="m_id" value="${member.m_id}">
 	
		<fieldset><legend>비 밀 번 호 찾 기</legend>
			<div> <!-- 인증번호 -->
				<label>인증번호</label><br>
				<input type="text" name="m_pass" required="required" autofocus="autofocus">
			</div>
			<div> <!-- 비밀번호 확인 -->
				<label>새로운 비밀번호</label><br>
				<input type="password" name="m_pass2"required="required">
			</div>
			
			<div> <!-- 찾기 -->
	            <input type="submit" value="비밀번호 변경">
	        </div>
		</fieldset>
	</form>
	</c:if>
	
	<c:if test="${result == -1 }">
		<div>등록된 정보가 없습니다</div>
		<div>
            <a href="findPassForm.sun">다시 찾기</a> | <a href="findIdForm.sun">아이디 찾기</a> | <a href="joinForm.sun">회원가입</a>
        </div>
	</c:if>
	
</body>
</html>