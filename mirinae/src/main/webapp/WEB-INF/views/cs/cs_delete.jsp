<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("삭제 완료");
			location.href="cs_list.kwon?pageNum=${pageNum}";
		</script>
	</c:if>
	<c:if test="${result != 1 }">
		<script type="text/javascript">
			alert("오류 발생");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>