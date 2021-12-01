<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#img { margin-top: 100px; margin-bottom: 50px; position: relative; }
	button { margin: 50px; margin-bottom: 100px; }
	#p { text-align: center; position: absolute; top: 50%; left: 50%; color: white; font-size: 20px; transform: translate( -50%, -50% ); }
</style>
</head>
<body>
	<c:if test="${result >= 1 }">
		<script type="text/javascript">
			alert("삭제 완료");
			location.href="support_list.kwon";
		</script>
	</c:if>
	<c:if test="${result < 1 }">
		<script type="text/javascript">
			alert("취소 실패")
			history.back();
		</script>
	</c:if>
</body>
</html>