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
<c:if test="${result > 0 }">
<script type="text/javascript">
	alert("답변이 등록되었습니다");
	location.href = "cs_list.kwon?pageNum=1";
</script>
</c:if>
<c:if test="${result != 0 }">
<script type="text/javascript">
	alert("답변 작성 중 오류가 발생했습니다");
	history.back();
</script>
</c:if>
</body>
</html>