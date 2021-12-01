<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("탈퇴되었습니다");
		location.href="loginForm.sun";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("탈퇴 실패. 등록한 프로젝트를 취소해 주시기 바랍니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>