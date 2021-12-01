<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("탈퇴되었습니다");
		location.href="member_list.sun?pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${!(result > 0)}">
	<script type="text/javascript">
		alert("탈퇴 실패. 해당 회원이 등록한 프로젝트가 있습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>