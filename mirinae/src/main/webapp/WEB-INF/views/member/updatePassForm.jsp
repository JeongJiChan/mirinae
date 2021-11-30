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
 	<form action="updatePass.sun" method="post" name="frm" onsubmit="return chk()">
 	<input type="hidden" name="m_id" value="${m_id }">
 	
		<fieldset><legend>새 비 밀 번 호 설 정</legend>
			<div> <!-- 비밀번호 -->
				<label>새로운 비밀번호</label><br>
				<input type="password" name="m_pass" required="required" autofocus="autofocus">
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
</body>
</html>