<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("로그인 성공");
		location.href="/mirinae/views/main/home.chan";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("회원정보가 없습니다");
		history.go(-1);
	</script>
</c:if>
</body>
</html>