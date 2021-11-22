<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("회원수정 성공");
			location.href = "my_page.sun";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("회원수정 실패");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("아이디 또는 닉네임 중복");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>