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
 	<c:if test="${result == 1 }">
 	<form action="updatePassForm.sun" method="post" name="frm" onsubmit="return chk()">
 	<input type="hidden" name="num" value="${num}">
 	<input type="hidden" name="m_id" value="${member.m_id}">
		<fieldset><legend>비 밀 번 호 찾 기</legend>
			<div> <!-- 인증번호 -->
				<label>인증번호</label><br>
				<input type="text" name="confirmNum" maxlength="6" placeholder="인증번호를 입력해주세요" required="required" autofocus="autofocus">
			</div>
			
			<div> <!-- 인증번호 입력 -->
	            <input type="submit" value="확인">
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